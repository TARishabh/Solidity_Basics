// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "contracts/SimpleStorage.sol";

// For interacting with any contract you need two things, 
// Address of the contract (where it is deployed);
// ABI (Application Binary Interface) (when you compile a contract, go to compilation details, go to ABI);


contract InterActingWithContracts {
    SimpleStorage[] public simpleStorageArray;

    function deployContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function interActSimpleStorageStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage simpleStorage =  simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function interActStorageGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}