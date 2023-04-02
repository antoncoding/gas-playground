// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import {IdHash, IdConcat} from "../HashVSConcat.sol";

contract IdHashTest is DSTest {
    IdHash internal immutable h;

    constructor() {
        h = new IdHash();
    }

    function testCall() public view {
        uint256 gas = gasleft();
        h.generateId(true, 198374, 19280981376876123);
        h.generateId(false, 4882945209384, 29831309449852);
        uint256 gas2 = gasleft();
        console.log(gas - gas2);
    }

    function testCallFuzz(
        bool _a,
        uint64 _b,
        uint128 _c
    ) public view {
        h.generateId(_a, _b, _c);
    }
}

contract IdConcatTest is DSTest {
    IdConcat internal immutable c;

    constructor() {
        c = new IdConcat();
    }

    function testCall() public view {
        uint256 gas = gasleft();
        c.generateId(true, 198374, 19280981376876123);
        c.generateId(false, 4882945209384, 29831309449852);
        uint256 gas2 = gasleft();
        console.log(gas - gas2);
    }

    function testCallFuzz(
        bool _a,
        uint64 _b,
        uint128 _c
    ) public view {
        c.generateId(_a, _b, _c);
    }
}
