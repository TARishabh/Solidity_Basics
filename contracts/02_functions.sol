// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract BasicsTwo {
    uint public favouriteNumber; // this gets initalized to 0.

    //public keyword is a funciton which returns somevalue.;
    // default visibility is internal;
    // everything on blockchain happens in form of transaction;
    // the more stuff (or more logic) in code ---> more gas;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
        // retrieve(); // if this is called inside gas calling function, then it will cost gas;
    }

    // view and pure functions don't spend gas if called alone.
    // view, pure functions disallow modification of state (we can't update our favourite number here)
    // pure functions disallow you to read from the blockchain
    // if has calling function calls a view or pure function then it will cost gas;

    function retrieve() public view  returns(uint256){
        return favouriteNumber;
    }

    // use pure when you have to perform some logic
    // function add() public pure returns (uint256) {
    //     return 1 + 1;
    // }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138