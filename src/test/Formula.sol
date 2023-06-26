// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {Vm} from "forge-std/Vm.sol";

import {CalculationLib, CalculationLib2} from "../NumberMul.sol";
import {AssertEQ, AssertGT} from "../Assert.sol";

contract FormulaNoLib is DSTest {
    CalculationLib2 internal immutable kk;

    constructor() {
        kk = new CalculationLib2();
    }

    function testCalculateFormula() public {
        kk.calFormula(5e18, 5e18, 2e18, 0.5e18);
        kk.calFormula(5e18, 15e18, 22e18, 0.5e18);
    }
}

contract FormulaLib is DSTest {
    CalculationLib internal immutable kk;

    constructor() {
        kk = new CalculationLib();
    }

    function testCalculateFormula() public {
        kk.calFormula(5e18, 5e18, 2e18, 0.5e18);
        kk.calFormula(5e18, 15e18, 22e18, 0.5e18);
    }
}
