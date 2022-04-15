// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

error InvalidArgument();

contract AssertEQ {
    function checkRevert1(uint256 _input) external pure {
        require(_input != 0, "E");
    }
}

contract AssertGT {
    function checkRevert1(uint256 _input) external pure {
        require(_input > 0, "E");
    }
}
