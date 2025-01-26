// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.7.0;

contract ScopeStu {
    function minimalScoping() pure public {
        {
            uint same;
            same =1;
        }

        {
            uint same;
            same = 3;
        }
    }

    function warnScoping() pure public returns(uint) {
        uint x = 1;
        {
            x = 2;
            uint x;
        }

        return x;
    }

    // compile error
    // function compileFail() pure public returns (uint) {
    //     x = 2;
    //     uint x;
    //     return x;
    // }
}