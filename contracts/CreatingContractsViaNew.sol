// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract D {
    uint public x;

    constructor(uint a) payable {
        x = a;
    }

    receive() external payable {
        console.log("receieved eth:%s", msg.value);
    }
}

contract C {
    D public d = new D(1);

    event Log(string message, uint value);

    function createD(uint arg) public returns (uint) {
        D d1 = new D(arg);
        return d1.x();
    }

    function createD2(uint arg) public payable returns (uint) {
        D d1 = new D(arg);
        return d1.x();
    }

    function createAndEndowD(uint arg, uint amount) public payable returns (uint) {
        emit Log("Received value", amount);
        d = new D{value: amount}(arg);
        return d.x();
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getBalance() public view returns (uint) {
        return address(d).balance;
    }
}
