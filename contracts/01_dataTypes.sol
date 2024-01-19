// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// pragma solidity >= 0.8.7 <0.9.0;


// link to get test sepolia ethereum https://faucets.chain.link/sepolia
contract SimpleStorage {
    // boolean, unit, int, address, bytes


    // bool hasFavouriteNumber = true;
    
    // uint8, uint256
    uint256 hasFavouriteNumber = 123;
    string favouriteNumber = "Five";
    int256 favouriteInt = -5;
    address myAddress = 0x288174e5FdD4C995aD251E136f2072462A64Bd0e;
    // 8 bits = 1 byte, maximum byte size = 32
    bytes32 favouriteBytes = "Cat";
}



