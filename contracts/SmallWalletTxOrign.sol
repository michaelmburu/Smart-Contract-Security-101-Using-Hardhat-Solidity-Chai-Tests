// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SmallWallet {
    address public owner;

    constructor(){
        owner = tx.origin;
    }


    function withdrawAll(address _recepient) external {
        require(tx.origin == owner, "Caller not authorised");
        payable(_recepient).transfer(address(this).balance);
    }

    receive() external payable{}

}