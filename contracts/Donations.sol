// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Donations{ 
    struct Donation {
        uint id;
        uint amount;
        string donor;
        string message;
        uint timestamp; //seconds since unix start
    }
    uint private amount = 0;
    uint private id = 0;
    mapping(address => uint) public balances;
    mapping(address => Donation[]) public donationsMap;

    function donate(address _recipient, string memory _donor, string memory _msg) public payable {
        require(msg.value > 0, "The donation needs to be >0");
        amount = msg.value;
        balances[_recipient] += amount;        
        donationsMap[_recipient].push(Donation(id++,amount,_donor,_msg,block.timestamp));
    }

    function withdraw() public {  //whole thing by default.
        amount = balances[msg.sender];
        balances[msg.sender] -= amount;
        require(amount > 0, "Your current balance is 0");
        // (bool success,) = msg.sender.call{value:amount}("");
        // if(!success){
        //     revert();
        // }
        address payable recipient = payable(msg.sender);
        recipient.transfer(amount);
    }
  
    function balancesGetter(address _recipient) public view returns (uint){
            return balances[_recipient];
    }
    
    function getBalance() public view returns(uint) {
            return msg.sender.balance;
    }
}