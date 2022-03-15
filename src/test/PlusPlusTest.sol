// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {PlusPlusPrefix, PlusPlusPostfix} from "../PlusPlus.sol";

contract PlusPlusPrefixTest is DSTest {
    PlusPlusPrefix internal immutable pre;

    constructor() {
        pre = new PlusPlusPrefix();
    }

    function testIncreaseStorage() public {
        // pre.increaseStorage();
        pre.increaseStorage();
    }

    function testIncreaseMemory() public view {
        pre.increaseMemory();
    }
}

contract PlusPlusPostfixTest is DSTest {
    PlusPlusPostfix internal immutable post;

    constructor() {
        post = new PlusPlusPostfix();
    }

    function testIncreaseStorage() public {
        post.increaseStorage();
    }

    function testIncreaseMemory() public view {
        post.increaseMemory();
    }
}
