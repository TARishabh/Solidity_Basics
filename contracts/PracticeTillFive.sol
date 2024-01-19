// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// IMPORTING THE CONTRACT

import "contracts/SimpleStorage.sol";

contract PracticeDeploy {
    // SimpleStorage public simpleStorage;
    
    SimpleStorage[] public simplestorageArray; // ASSUME LIKE IT AN ARRAY OF DEPLOYED CONTRACTS, AND WITHIN EACH CONTRACT IT HAS ITS OWN FUNCTIONS LIKE STORE, RETRIEVE, ETC.
    // [[contract_1_functions],[contract_2_functions],[]] and elements inside this outer array are contracts itself.
    // Deploy a contract while using a contract; 
    // function initiateContract() public {
    //     simpleStorage = new SimpleStorage();
    // }

    // we are just initiating the contracts in array.
    function initiateContractInArray() public {
        SimpleStorage simplestorageVariable = new SimpleStorage();
        simplestorageArray.push(simplestorageVariable); 
    }

    // In this function, we accessing the storefunction of SimpleStorage contract stored in array of simplestorage, 
    // So we need the address and ABI
    function interactWithStoreFunctionFromContract(uint256 _storageIndex,uint256 _defaultStoreParameter) public  {
        SimpleStorage indexedContract = simplestorageArray[_storageIndex];
        indexedContract.store(_defaultStoreParameter);

        // simplestorageArray[_storageIndex].store(_defaultStoreParameter);
    }

    function interactWithStoreFunctionReadFromContract(uint256 _simplestorageIndex) public view returns(uint256) {
        SimpleStorage theObject = simplestorageArray[_simplestorageIndex];
        return theObject.retrieve();
        // return simplestorageArray[_simplestorageIndex].retrieve();
    }
}