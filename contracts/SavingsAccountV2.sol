// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SavingsAccountV2 is ReentrancyGuard {
    using Address for address payable;

    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;        
    }

    // Add re-entrancy guard
    function withdraw() external nonReentrant {
        uint256 depositAmount = balanceOf[msg.sender];

        payable(msg.sender).sendValue(depositAmount);

        balanceOf[msg.sender] = 0;
    }
}