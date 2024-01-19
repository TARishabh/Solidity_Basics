// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/SimpleStorage.sol";


// ADDING A SINGLE SIMPLESTORAGE CONTRACT.
// contract DeploySimpleStorage {
//     SimpleStorage public simpleStorage;

//     function Deployment() public {
//         simpleStorage = new SimpleStorage();
//     }
// }

contract DeploySingleStorage {
    SimpleStorage[] public simpleStorageArray;

    function deploymentOfContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
}