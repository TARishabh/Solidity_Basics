// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract PracticeSessionThree {
    uint256[] public favs;

    // struct MappingStruct {
    //     uint num;
    //     bytes32 nameHash;
    // }

    mapping(bytes32 => bool) public isMapped; 

    struct FavsStruct {
        uint256 num; 
        string name;
        bool hasFav;
    }

    FavsStruct[] public favsStruct;

    function addInFavStruct(uint256 _num,string memory _name, bool _hasFav) public  {
        favsStruct.push(FavsStruct(_num,_name,_hasFav));
        bytes32 combinedKey = keccak256(abi.encodePacked(_num, _name));
        isMapped[combinedKey] = _hasFav;
    }

    function TestArray(uint256 _num) public {
        favs.push(_num);
    }

    function retrieve(uint256 index) public view returns(uint256) {
        return favs[index];
    }

    function retrieveBytes(uint256 _num,string memory _name) public pure returns(bytes32){
        bytes32 combinedKey = keccak256(abi.encodePacked(_num, _name));
        return combinedKey;
    }
}