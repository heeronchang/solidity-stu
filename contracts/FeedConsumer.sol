// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.7.0;

interface DataFeed {
    function getData(address token) external returns (uint value);
}

contract FeedConsumer {
    DataFeed feed;

    uint errorCount;

    function rate (address token) public returns (uint value, bool success) {
        require(errorCount < 10);
        try feed.getData(token) returns (uint v) {
            return (v, true);
        } catch Error(string memory /*reason*/) {
            errorCount++;
            return (0, false);
        } catch (bytes memory) {
            errorCount++;
            return (0, false);
        }
    }
}