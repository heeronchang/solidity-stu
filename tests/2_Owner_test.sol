// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol";

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "hardhat/console.sol";
import "../contracts/2_Owner.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite is Owner {
    address acc1;
    address acc2;
    address acc3;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        // super.beforeAll(); // runs 'BeforeAll' function from the parent contract (inherited by testSuite)

        acc1 = TestsAccounts.getAccount(0);
        acc2 = TestsAccounts.getAccount(1);
        acc3 = TestsAccounts.getAccount(2);
    }

    function checkInitialOwner() public {
        Assert.equal(getOwner(), acc1, "Owner should be acc1");
    }

    function checkChangeOwner() public {
        Assert.ok(msg.sender == acc1, "Caller should be acc1");
        changeOwner(acc2);
        Assert.equal(getOwner(), acc2, "Owner should be updated acc2");
    }

    /// Update owner again by defining custom sender
    /// #sender: account-2 (sender is account at index '1')
    function checkChangeOwnerAgain() public {
        Assert.ok(msg.sender == acc2, "Caller should be acc2");
        changeOwner(acc3);
        Assert.equal(getOwner(), acc3, "Owner should be updated acc3");
    }
}
