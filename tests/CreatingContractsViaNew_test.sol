// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "hardhat/console.sol";
import "../contracts/CreatingContractsViaNew.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    C c;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        c = new C();
        console.log("c.d balance: %s", address(c.d()).balance);
    }

    function checkSuccess() public {
        uint x = c.createD(100);
        Assert.equal(x, 100, 'x should be 100');
    }

    /// #value: 15000000000000000000
    /// #sender: account-1
    function checkSuccess2() public payable {
        Assert.equal(msg.value, 15000000000000000000, 'value should be 15 Eth');
        uint x = c.createD2{value: 1 ether}(100);
        Assert.equal(x, 100, 'x should be 100');
    }

    /// #value: 15000000000000000000
    /// #sender: account-1
    function checkSuccess3() public payable {
        uint x = c.createAndEndowD(100, 1 ether);
        Assert.equal(x, 100, 'x should be 100');
        console.log("D contract balance: %s", c.getBalance());

        Assert.emits(
            address(c),
            "Log(string, uint)",
            abi.encode("Received value", 1),
            "Log event should be emitted with correct parameters"
        );
    }
}
    