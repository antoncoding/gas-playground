// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {PlusPlus} from "../PlusPlus.sol";

contract PlusPlusTest is DSTest {
    PlusPlus internal immutable pp;

    constructor() {
        pp = new PlusPlus();
    }

    function testIncreaseStorage() public {
        pp.increaseStorage();
    }

    function testIncreaseMemory() public view {
        pp.increaseMemory();
    }
}
