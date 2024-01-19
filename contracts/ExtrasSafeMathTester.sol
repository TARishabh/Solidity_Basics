// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SafeMathTester {
    uint8 public bigNumber = 255; // unchecked

    function add() public {
        // bigNumber = bigNumber + 1;
        unchecked {bigNumber = bigNumber + 1;}
    }
}