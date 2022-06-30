// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {AssertEQ, AssertGT} from "../Assert.sol";

contract AssertEQTest is DSTest {
    AssertEQ internal immutable kk;

    constructor() {
        kk = new AssertEQ();
    }

    function testCall() public view {
        kk.checkRevert1(1);
    }
}

contract AssertGTTest is DSTest {
    AssertGT internal immutable kk;

    constructor() {
        kk = new AssertGT();
    }

    function testCall() public view {
        kk.checkRevert1(1);
    }

    function testCall2() public view {
        kk.checkRevert1(2);
    }
}
