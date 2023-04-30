// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {Vm} from "forge-std/Vm.sol";

import {UpdateStructStorage, UpdateStructMemory} from "../UpdateStruct.sol";

contract UpdateStructMemoryTest is DSTest {
    UpdateStructMemory internal immutable c;

    constructor() {
        c = new UpdateStructMemory();
    }

    function testUpdateStorageCost() public {
        c.updateStruct();
        uint256 a = 1;
        uint256 b = 1;
        uint256 ss = a * b + 1000e18;
    }
}

contract UpdateStructStorageTest is DSTest {
    UpdateStructStorage internal immutable c;

    constructor() {
        c = new UpdateStructStorage();
    }

    function testUpdateStorageCost() public {
        c.updateStruct();
        uint256 a = 1;
        uint256 b = 1;
        uint256 ss = a * b + 1000e18;
    }
}
