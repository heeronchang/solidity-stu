// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.7.0;

contract Structure {
    uint256 storedData;
    address public seller;

    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }
    
    enum State { Created, Locked, Inactive, Release }

    event HighestBidIncrease(address bidder, uint amount);

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    function bid() public payable {
        emit HighestBidIncrease(msg.sender, msg.value);
    }

    function abort() public view onlySeller {}


}
