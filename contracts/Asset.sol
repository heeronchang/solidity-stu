// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "./Table.sol";

contract Asset {
    event RegisterEvent(int256 ret, string account, uint256 asset_value);
    event TransferEvent(
        int256 ret,
        string from_account,
        string to_account,
        uint256 amount
    );

    constructor() public {
        createTable();
    }

    function createTable() private {
        TableFactory tf = TableFactory(0x1001);
        // 资产管理表, key : account, field : asset_value
        // |  资产账户(主键)      |     资产金额       |
        // |-------------------- |-------------------|
        // |        account      |    asset_value    |
        // |---------------------|-------------------|
        //
        // 创建表
        tf.createTable("t_asset", "account", "asset_value");
    }

    function openTable() private view returns (Table) {
        TableFactory tf = TableFactory(0x1001);
        Table table = tf.openTable("t_asset");
        return table;
    }

    /**
    根据资产账户查询资产
    参数：
        account: 资产账户
    返回值：
        参数一： 成功返回0，账户不存在返回-1
        参数二： 资产金额 
    */
    function select(string memory account)
        public
        view
        returns (int256, uint256)
    {
        Table table = openTable();

        Entries entries = table.select(account, table.newCondition());
        uint256 asset_value = 0;

        if (0 == uint256(entries.size())) {
            return (-1, asset_value);
        } else {
            Entry entry = entries.get(0);
            return (0, uint256(entry.getInt("asset_value")));
        }
    }

    /*
    描述 : 资产注册
    参数 ：
            account : 资产账户
            amount  : 资产金额
    返回值：
            0  资产注册成功
            -1 资产账户已存在
            -2 其他错误
    */
    function register(string memory account, uint256 asset_value)
        public
        returns (int256)
    {
        int256 ret_code = 0;
        int256 ret = 0;
        uint256 temp_asset_value = 0;
        (ret, temp_asset_value) = select(account);

        if (ret != 0) {
            Table table = openTable();

            Entry entry = table.newEntry();
            entry.set("account", account);
            entry.set("asset_value", int256(asset_value));

            int256 count = table.insert(account, entry);
            if (count == 1) {
                ret_code = 0;
            } else {
                ret_code = -2;
            }
        } else {
            ret_code = -1;
        }

        emit RegisterEvent(ret_code, account, asset_value);
        return ret_code;
    }

    function transfer(string memory from_account, string memory to_account, uint256 amount) public returns (int256) {
        int ret_code = 0;
        int256 ret = 0;
        uint256 from_asset_value = 0;
        uint256 to_asset_value = 0;

        // 转移账户是否存在
        (ret, from_asset_value) = select(from_account);
        if (ret != 0) {
            ret_code = -1;
            // 转移资产账户不存在
            emit TransferEvent(ret_code, from_account, to_account, amount);
            return ret_code;
        }

        // 接收账户不存在
        (ret, to_asset_value) = select(to_account);
        if (ret != 0) {
            ret_code = -2;
            emit TransferEvent(ret_code, from_account, to_account, amount);
            return ret_code;
        }

        if (from_asset_value < amount) {
            // 转移资产的账户金额不足
            ret_code = -3;
            emit TransferEvent(ret_code, from_account, to_account, amount);
            return ret_code;
        }

        if (to_asset_value + amount < to_asset_value) {
            // 接收资产账户金额溢出
            ret_code = -4;
            emit TransferEvent(ret_code, from_account, to_account, amount);
            return ret_code;
        }

        Table table = openTable();
    
        // 更新转移资产账号余额
        Entry entry0 = table.newEntry();
        entry0.set("account", from_account);
        entry0.set("asset_value", int256(from_asset_value - amount));
        int count = table.update(from_account, entry0, table.newCondition());
        if (count != 1) {
            // 更新转移资产账户余额失败
            ret_code = -5;
            emit TransferEvent(ret_code, from_account, to_account, amount);
            return ret_code;
        }

        // 更新接收资产账户余额
        Entry entry1 = table.newEntry();
        entry1.set("account", to_account);
        entry1.set("asset_value", int256(to_asset_value + amount));
        table.update(to_account, entry1, table.newCondition());

        emit TransferEvent(ret_code, from_account, to_account, amount);
        return ret_code;
    }
}
