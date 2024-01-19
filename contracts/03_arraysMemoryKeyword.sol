// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract BasicsThree {
    uint public favouriteNumber;
    // People public person = People({favouriteNumber:2, name:"Rishabh"});

    mapping(string => uint256) public nameToFavouriteNumber;
    struct People {
        uint256 favouriteNumber;
        string name;
    }
    
    uint256[] public favouriteNumberList;
    People[] public people; // dynamic array 
    // People[3] public peopleFixed; // fixed array 

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber,_name)); // 1st way to add

        // second way to add into the people list
        // People memory newPerson = People({favouriteNumber:_favouriteNumber,name:_name});
        // people.push(newPerson);

        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    

    // EVM can access and store information in six places:
    // calldata, memory, storage

    // calldata, memory -> the variable only exists temporarly
    // calldata can be used when you don't have to modify the variable. 

    // struct, array and mapping has to be given memory or calldata keyword;
}