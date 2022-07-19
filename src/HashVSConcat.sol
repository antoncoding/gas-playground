// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract IdHash {
    uint256 public a = 0;

    function generateId(
        bool _a,
        uint64 _b,
        uint128 _c
    ) external pure returns (bytes32) {
        return keccak256(abi.encode(_a, _b, _c));
    }
}

contract IdConcat {
    function generateId(
        bool _a,
        uint64 _b,
        uint128 _c
    ) external pure returns (uint256) {
        uint256 a;
        assembly {
            a := _a
        }
        return (a << 192) + (uint256(_b) << 128) + _c;
    }
}
