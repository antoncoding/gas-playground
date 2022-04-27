// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
// import {Vm} from "forge-std/Vm.sol";

import {Caller, Callee} from "../TryCatch.sol";
import "forge-std/Vm.sol";

contract TryCatchGasTest is DSTest {
    Caller internal immutable caller;
    Callee internal immutable callee;

    constructor() {
        callee = new Callee();
        caller = new Caller(address(callee));
    }

    function testNormal() public {
        caller.action();
        bool finished = caller.finished();
        assert(finished);
    }

    function testCatch() public {
        // test that it's possible the tx goes through with event emited
        caller.action{gas: 30000}();
        bool finished = caller.finished();
        assert(!finished);
    }
}
