// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

import "hardhat/console.sol";

contract Test {
    uint256 x;

    // This function is called for all messages sent to
    // this contract (there is no other function).
    // Sending Ether to this contract will cause an exception,
    // because the fallback function does not have the `payable`
    // modifier.

    fallback() external {
        x = 1;
        console.log("[Test] fallback executed x:%s", x);
    }
}
