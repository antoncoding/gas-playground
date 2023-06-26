// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import "../ReadStruct.sol";

contract ReadSructTest is DSTest {
    GMXStorage internal immutable gmx;
    TestStruct internal immutable viewer;

    constructor() {
        gmx = new GMXStorage();
        viewer = new TestStruct(address(gmx));
    }

    function setUp() public {
        // set key 0: all entry
        address[] memory path = new address[](2);
        gmx.setIncreaseRequest(
            0,
            IncreasePositionRequest({
                account: address(1),
                path: path, // array
                indexToken: address(1),
                amountIn: 0,
                minOut: 1,
                sizeDelta: 1,
                isLong: false,
                acceptablePrice: 1,
                executionFee: 0,
                blockNumber: 1,
                blockTime: 0,
                hasCollateralInETH: false,
                callbackTarget: address(1)
            })
        );

        // account 1: only account
        gmx.setIncreaseRequest(
            1,
            IncreasePositionRequest({
                account: address(this),
                path: path, // array
                indexToken: address(0),
                amountIn: 0,
                minOut: 0,
                sizeDelta: 0,
                isLong: false,
                acceptablePrice: 0,
                executionFee: 0,
                blockNumber: 0,
                blockTime: 0,
                hasCollateralInETH: false,
                callbackTarget: address(0)
            })
        );

        // set key 1
    }

    function testEasyLook() public {
        bool notEmpty0 = viewer.checkIncreaseIsNotEmpty(0);
        assertTrue(notEmpty0);

        bool notEmpty1 = viewer.checkIncreaseIsNotEmpty(1);
        assertTrue(notEmpty1);

        bool notEmpty2 = viewer.checkIncreaseIsNotEmpty(2);
        assertTrue(!notEmpty2);
    }

    function testAssemblyLook() public {
        bool notEmpty0 = viewer.checkIncreaseIsNotEmptyAssembly(0);
        assertTrue(notEmpty0);

        bool notEmpty1 = viewer.checkIncreaseIsNotEmptyAssembly(1);
        assertTrue(notEmpty1);

        bool notEmpty2 = viewer.checkIncreaseIsNotEmptyAssembly(2);
        assertTrue(!notEmpty2);
    }

    function testParseAccount() public {
        address acc0 = viewer.parseAccountAssembly(0);
        assertEq(acc0, address(1));

        address acc1 = viewer.parseAccountAssembly(1);
        assertEq(acc1, address(this));

        address acc2 = viewer.parseAccountAssembly(2);
        assertEq(acc2, address(0));
    }
}
