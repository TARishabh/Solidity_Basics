// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "contracts/SimpleStorage.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// INHERITANCE EXAMPLE;
// contract ExtendedSimpleStorage is SimpleStorage  {
//     function store(uint256 _favouriteNumber) public override {
//         favouriteNumber = _favouriteNumber + 5;
//     }
// }


// FUNDING CONTRACT EXAMPLE;

contract FundAbleContract {

    uint256 public minimumUSD = 50 * 1e18; 
    address[] public Senders; 
    mapping(address=>uint256) mappedWithPeople; // this maps respective users to how much amount they paid;
    // msg.value: This global variable holds the amount of ETH sent along with the transaction in wei, the smallest denomination of Ether (1 ETH = 1e18 wei).
    // 1e18: This represents the number 1 followed by 18 zeros, which is equivalent to 1 ETH in wei.

    function pay() public payable  {
        require(ConvertUsdToEth(msg.value)>= minimumUSD,"Didn't send enough!!");
        Senders.push(msg.sender);
        mappedWithPeople[msg.sender] = msg.value;
    }

    function getPrice() public view returns (uint256) {
        // we have to get the current conversion rate from chain links, 
        AggregatorV3Interface conversionRate = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = conversionRate.latestRoundData();
        return uint256(price * 1e10);
    }

    function ConvertUsdToEth(uint256 _ethAmount) public view returns (uint256) {
        uint256 oneEthPrice = getPrice();
        uint256 UsdPrice = (oneEthPrice * _ethAmount) / 1e18;
        return UsdPrice; 
    }
}
