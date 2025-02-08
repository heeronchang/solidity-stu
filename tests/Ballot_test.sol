// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/3_Ballot.sol";

contract BallotTest {
    bytes32[] proposalNames;

    Ballot ballotToTest;

    function beforeAll() public {
        proposalNames.push(bytes32("A"));
        proposalNames.push(bytes32("B"));
        proposalNames.push(bytes32("C"));
        ballotToTest = new Ballot(proposalNames);
    }

    function checkGiveRightToVote() public {
        ballotToTest.giveRightToVote(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        ballotToTest.giveRightToVote(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        ballotToTest.giveRightToVote(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        ballotToTest.giveRightToVote(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
        // ballotToTest.giveRightToVote(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
    }

    function checkWinningProposal() public {
        console.log("Running checkWinningProposal");
        ballotToTest.vote(0);
        Assert.equal(
            ballotToTest.winningProposal(),
            uint256(0),
            "proposal at index 0 should be the winning proposal"
        );
        Assert.equal(
            ballotToTest.winnerName(),
            bytes32("A"),
            "candidate1 should be the winner name"
        );
    }

    function checkWinninProposalWithReturnValue() public view returns (bool) {
        return ballotToTest.winningProposal() == 0;
    }
}
