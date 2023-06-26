// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "lib/solmate/src/utils/FixedPointMathLib.sol";

contract CalculationLib {
    using FixedPointMathLib for uint256;

    function calFormula(
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d
    ) external pure returns (uint256 e) {
        return a.mulWadDown(b).divWadDown(c).divWadDown(d);
    }
}

contract CalculationLib2 {
    using FixedPointMathLib for uint256;

    function calFormula(
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d
    ) external pure returns (uint256 e) {
        return a.mulDivDown(b, c).divWadDown(d);
    }
}
