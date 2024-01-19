// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PracticeSession {
    uint256 public favNum;
    bool public favChoice;
    string public favWord;


    function changeFavs(uint256 _favNum, bool _favChoice, string calldata _favWord) public {
        favNum = _favNum;
        favChoice = _favChoice;
        favWord = _favWord;
    }   


    function retrieve() public view returns(uint256,bool,string memory) {
        return (favNum, favChoice, favWord);
    }
}