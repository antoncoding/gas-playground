// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

error InvalidArgument();

contract RevertInLine {
    function checkRevert1(uint256 _input) external pure {
        if (_input > 1000) revert InvalidArgument();
    }

    function checkRevert2(uint256 _input) external pure {
        if (_input > 2000) revert InvalidArgument();
    }

    function checkRevert3(uint256 _input) external pure {
        if (_input > 3000) revert InvalidArgument();
    }
}

contract RevertInFunction {
    function checkRevert1(uint256 _input) external pure {
        _checkArgument(_input > 1000);
    }

    function checkRevert2(uint256 _input) external pure {
        _checkArgument(_input > 2000);
    }

    function checkRevert3(uint256 _input) external pure {
        _checkArgument(_input > 3000);
    }

    function _checkArgument(bool _expression) internal pure {
        if (_expression) revert InvalidArgument();
    }
}
