// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract PlusPlusPrefix {
    uint256 public a = 0;

    function increaseStorage() external {
        ++a; // 20848
    }

    function increaseMemory() external pure {
        uint256 b;
        ++b; // 713
    }
}

contract PlusPlusPostfix {
    uint256 public a = 0;

    function increaseStorage() external {
        a++; // 20853
    }

    function increaseMemory() external pure {
        uint256 b;
        b++; // 718
    }
}
