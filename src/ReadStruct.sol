// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

// import "forge-std/console2.sol";

struct IncreasePositionRequest {
    address account;
    address[] path;
    address indexToken;
    uint256 amountIn;
    uint256 minOut;
    uint256 sizeDelta;
    bool isLong;
    uint256 acceptablePrice;
    uint256 executionFee;
    uint256 blockNumber;
    uint256 blockTime;
    bool hasCollateralInETH;
    address callbackTarget;
}

contract GMXStorage {
    mapping(uint256 => IncreasePositionRequest) public increasePositionRequests;

    function setIncreaseRequest(
        uint256 key,
        IncreasePositionRequest memory request
    ) external {
        increasePositionRequests[key] = request;
    }
}

contract TestStruct {
    GMXStorage gmx;

    constructor(address _gmx) {
        gmx = GMXStorage(_gmx);
    }

    function checkIncreaseIsNotEmptyAssembly(
        uint256 key
    ) external returns (bool) {
        bytes memory data = abi.encodeWithSelector(
            gmx.increasePositionRequests.selector,
            key
        );

        (, bytes memory returndata) = address(gmx).call(data);
        // require(success);

        // parse account from the first 32 bytes of returned data
        // same as: (address account,,,,,,,,,,,,) = positionRouter.increasePositionRequests(pendingOrderKey);
        address account;
        assembly {
            account := mload(add(returndata, 32))
        }
        return account != address(0);
    }

    function parseAccountAssembly(
        uint256 key
    ) external returns (address account) {
        bytes memory data = abi.encodeWithSelector(
            gmx.increasePositionRequests.selector,
            key
        );

        (bool success, bytes memory returndata) = address(gmx).call(data);
        require(success);

        assembly {
            account := mload(add(returndata, 32))
        }
    }

    function checkIncreaseIsNotEmpty(uint256 key) external view returns (bool) {
        // parse account from the first 32 bytes of returned data
        (address account, , , , , , , , , , , ) = gmx.increasePositionRequests(
            key
        );
        return account != address(0);
    }
}
