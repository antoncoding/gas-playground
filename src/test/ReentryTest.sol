// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {Reentry1, Reentry2} from "../Reentry.sol";

contract ReentryUintGas is DSTest {
    Reentry1 internal immutable r;

    constructor() {
        r = new Reentry1();
    }

    function testReentry1Gas() public {
        r.updateA(1);
    }
}

contract ReentryUintZeroTest is DSTest {
    Reentry2 internal immutable r;

    constructor() {
        r = new Reentry2();
    }

    function testReentry2Gas() public {
        r.updateA(1);
    }
}
