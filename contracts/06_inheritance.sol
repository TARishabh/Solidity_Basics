// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// to inherit from a contract, use the steps:
// first import the contract
// contract newContractName is OldContractName {}

import "contracts/SimpleStorage.sol";

// function which will be OVERRIDE add "virtual" in front of it.
// and in current file when you are overriding it, add "override" in front of it.

contract ExtraStorage is SimpleStorage {
    function store(uint256 _favouriteNumber) public override  {
        favouriteNumber = _favouriteNumber + 5;
    }
}