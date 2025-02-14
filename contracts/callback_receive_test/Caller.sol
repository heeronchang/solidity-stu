// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

import "contracts/callback_receive_test/Test.sol";
import "contracts/callback_receive_test/TestPayable.sol";

contract Caller {
    function callTest(Test test) public returns (bool) {
        (bool success, ) = address(test).call(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(
            success,
            "[callTest] the call to 'nonExistingFunction' should be success."
        );

        // results in test.x becoming == 1.

        // address(test) will not allow to call ``send`` directly, since ``test`` has no payable
        // fallback function.
        // It has to be converted to the ``address payable`` type to even allow calling ``send`` on it.
        address payable testPayable = payable(address(test));

        // If someone sends Ether to that contract,
        // the transfer will fail, i.e. this returns false here.
        return testPayable.send(2 ether);
    }

    function callTestPayable(TestPayable test) public payable returns (bool) {
        console.log("[callTestPayable] msg.value:%s", msg.value);
        (bool success, ) = address(test).call(
            abi.encodeWithSignature("nonExistingFunction()")
        );

        require(
            success,
            "[callTestPayable] the call to 'nonExistingFunction' should be success."
        );

        (success, ) = address(test).call{value: 1}(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(
            success,
            "[callTestPayable] the call to 'nonExistingFunction' with value should be success."
        );

        (success, ) = address(test).call{value: 2 ether}("");
        require(
            success,
            "[callTestPayable] the call to '' with value should be success."
        );

        return true;
    }
}
