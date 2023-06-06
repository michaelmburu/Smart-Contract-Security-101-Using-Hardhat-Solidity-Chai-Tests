// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18; 

contract LogicV1 {
  uint256 public x;

  function increaseX() external {
    x++;
  }
}