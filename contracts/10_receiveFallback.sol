// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FallBackExample {
    uint256 public result;
    
    // receive is function, which is called when someone does the transaction on contract rather than a payable function;
    // go to deploy -> deploy contract -> low level interactions;
    receive() external payable {
        result = 1;
    }

    // if there is some data in call data, which does not match anything in here, then fallback is called !
    fallback() external payable {
        result = 2;
    }



    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()
}