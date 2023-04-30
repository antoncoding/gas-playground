// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

struct StructTwoSlots {
    // slot 1
    uint128 a;
    uint64 b;
    uint64 c;
    // slot 2
    uint128 d;
    uint128 e;
}

struct InfoGroup1 {
    uint128 a;
    uint64 b;
    uint64 c;
}

struct InfoGroup2 {
    uint128 d;
    uint128 e;
}

struct StructsBetter {
    // slot 1
    InfoGroup1 infoGroup1;
    InfoGroup2 infoGroup2;
}

contract UpdateStructStorage {
    StructsBetter private obj;

    function updateStruct() external {
        // gas: 25229
        obj.infoGroup1.a = 100;
    }
}

contract UpdateStructMemory {
    StructsBetter private obj;

    function updateStruct() external {
        // gas: changed to 25465
        InfoGroup1 memory cache = obj.infoGroup1;
        cache.a = 100;

        obj.infoGroup1 = cache;
    }
}
