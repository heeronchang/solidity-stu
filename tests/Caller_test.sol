// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "contracts/callback_receive_test/Caller.sol";
import "contracts/callback_receive_test/Test.sol";
import "contracts/callback_receive_test/TestPayable.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    Caller caller;
    Test test;
    TestPayable testPayable;


    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        caller = new Caller();
        test = new Test();
        testPayable = new TestPayable();
    }


    /// #sender: account-1
    /// #value: 15000000000000000000
    function checkSuccess() public payable {
        // caller.callTest(test);
        caller.callTestPayable{value: 5 ether}(testPayable);
    }

    // /// Custom Transaction Context: https://remix-ide.readthedocs.io/en/latest/unittesting.html#customization
    // /// #sender: account-1
    // /// #value: 100
    // function checkSenderAndValue() public payable {
    //     // account index varies 0-9, value is in wei
    //     Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
    //     Assert.equal(msg.value, 100, "Invalid value");
    // }
}
    