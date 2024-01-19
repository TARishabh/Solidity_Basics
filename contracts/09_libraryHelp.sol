// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
import "contracts/08_library.sol";


contract FundMe {
    using UtilityFuntions for uint256;
    uint256 public minimumUsd = 50 * 1e18; // 1* 10 ** 18

    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;

    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD;
        // 1. How to we send ETH to this contract?;
        // contract address can also hold fund, just like wallet;

        // require(msg.value > 1e18, "Didn't send enough!!"); // 1 * 10 ** 18 == 100000000000(18 zeros), which means 1 eth, 18 zeros because transaction is done in wei 
        // library functions receive their first argument like this: 
        // argument_first.FUNCTIONNAME();
        // if the function take 2 arguments then the first argument will be passed same as above and the next will be passed inside the bracket:
        // argument_first.FUNCTIONNAME(second_argument);
        
        require(msg.value.getConversionRate() >= minimumUsd,"Didn't send enough!!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        // this require keyword simply means a if block, that msg.value should be greater than this, else return error didnt send enough, just like javascript ternary operator(?)
    }

    // function withdraw(params) {
    //     code
    // }
}

