// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

contract Caller {
    Callee public erc20;
    bool public flag;
    bool public finished;
    bool public catchBlock;

    event Error(bytes reason);

    event Error(string reason);

    constructor(address _callee) {
        erc20 = Callee(_callee);
    }

    function action() external {
        flag = true;
        try erc20.doSomething() {
            // If doSomething is successful, update the state
            finished = true;
        } catch (
            bytes memory /*reason*/
        ) {
            // if case of a failed transfer (ERC20 got frozen or something), we still want to update the state.
            // this should not happen under normal scenario.
        }
    }
}

contract Callee {
    uint256 public a;
    uint256 public b;
    uint256 public c;
    uint256 public d;

    function doSomething() external {
        a = a + 1;
        b = b + 1;
        c = b + 2;
        d = a + 2;
    }
}
