// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract Proxy{
    uint256 public x;
    address public owner;
    address public logicContract;

    constructor(address _logicContract){
        logicContract = _logicContract;
        owner = msg.sender;
    }

    function upgrade(address _newLogicContract) external {
        require(msg.sender == owner, "Access restricted");
        logicContract = _newLogicContract;
    }

    fallback() external payable {
        (bool success, ) = logicContract.delegatecall(msg.data);
        require(success, "Unexpected error");
    }
}