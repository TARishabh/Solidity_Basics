// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 favouriteNumber;

    mapping(string => uint256) public nameTofavouriteNumber;


    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favouriteNumber) public virtual  {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    function addToPeople(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(favouriteNumber, _name));
        nameTofavouriteNumber[_name] = _favouriteNumber;
    }
}