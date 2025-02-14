// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

import "hardhat/console.sol";

contract TestPayable {
    uint256 x;
    uint256 y;

    // This function is called for all messages sent to
    // this contract, except plain Ether transfers
    // (there is no other function except the receive function).
    // Any call with non-empty calldata to this contract will execute
    // the fallback function (even if Ether is sent along with the call).
    fallback() external payable {
        x = 1;
        y = msg.value;
        console.log("[TestPayable] fallback executed x:%s, y:%s", x, y);
    }

    // This function is called for plain Ether transfers, i.e.
    // for every call with empty calldata.
    receive() external payable {
        x = 2;
        y = msg.value;
        console.log("[TestPayable] receive executed x:%s, y:%s", x, y);
    }
}
