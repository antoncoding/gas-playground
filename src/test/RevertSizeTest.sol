// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {RevertInLine, RevertInFunction} from "../RevertSize.sol";

// bytecode length: 656
contract RevertInLineTest is DSTest {
    RevertInLine internal immutable instance;

    constructor() {
        instance = new RevertInLine();
    }

    function testFailRevert1() public view {
        instance.checkRevert1(5000);
    }

    function testFailRevert2() public view {
        instance.checkRevert1(5000);
    }
}

// bytecode length: 570
contract RevertInFunctionTest is DSTest {
    RevertInFunction internal immutable instance;

    constructor() {
        instance = new RevertInFunction();
    }

    function testFailRevert1() public view {
        instance.checkRevert1(5000);
    }

    function testFailRevert2() public view {
        instance.checkRevert1(5000);
    }
}
