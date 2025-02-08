// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "hardhat/console.sol";
import "../contracts/AttendanceRegister.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract AttendanceRegisterTest {
    AttendanceRegister ar;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        ar = new AttendanceRegister();
    }

    /// Test 'add' using try-catch
    function testAddWithErrorTryCatch() public {
        try ar.add(101, 'heeron', 1) returns (uint256 r) {
            Assert.equal(r, 101, 'Wrong rollNumber');
        } catch Error(string memory /*reason*/) {
            Assert.ok(false, 'failed with reason');
        } catch (bytes memory /*lowLevelData*/) {
            Assert.ok(false, 'failed unexpected');
        }
    }

     /// Test another failure case of 'add' using try-catch
    function testAddFailureUsingTryCatch2() public {
        // This will revert on 'require(register[rollNumber].class == 0, "Roll number not available");' for rollNumber '101'
        try ar.add(101, 'secondStudent', 11) returns (uint256 r) {
            Assert.ok(false, 'method execution should fail');
        } catch Error(string memory reason) {
            // Compare failure reason, check if it is as expected
            console.log(reason);
            Assert.equal(reason, 'Roll number not available', 'failed with unexpected reason');
        } catch (bytes memory /*lowLevelData*/) {
            Assert.ok(false, 'failed unexpected');
        }
    }

    /// For solidity version less than 0.6.0, low level call can be used
    /// See: https://solidity.readthedocs.io/en/v0.6.0/units-and-global-variables.html#members-of-address-types
    /// Test success case of 'add' using low level call
    function testAddSuccessUsingCall() public {
        bytes memory methodSign = abi.encodeWithSignature('add(uint256,string,uint256)', 102, 'firstStudent', 10);
        (bool success, bytes memory data) = address(ar).call(methodSign);
        // 'success' stores the result in bool, this can be used to check whether method call was successful
        Assert.equal(success, true, 'execution should be successful');
        // 'data' stores the returned data which can be decoded to get the actual result
        uint rollNumber = abi.decode(data, (uint256));
        // check if result is as expected
        Assert.equal(rollNumber, 102, 'wrong rollNumber');
    }
    
    /// Test failure case of 'add' using low level call
    function testAddFailureUsingCall() public {
        bytes memory methodSign = abi.encodeWithSignature('add(uint256,string,uint256)', 102, 'duplicate', 10);
        (bool success, bytes memory data) = address(ar).call(methodSign);
        // 'success' will be false if method execution is not successful
        Assert.equal(success, false, 'execution should be successful');
    }
}
    