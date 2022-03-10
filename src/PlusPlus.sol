// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract PlusPlus {
    uint256 public a = 0;

    function increaseStorage() external {
        a++; // 20853
        // ++a; // 20848
    }

    function increaseMemory() external pure {
        uint256 b;
        b++; // 718
        // ++b; // 713
    }
}
