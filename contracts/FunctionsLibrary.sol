// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library UtilityFuntions {
    function getConversionRate() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();    
    }

    function ConvertEthToUsd (uint256 _ethAmount) public view returns(uint256) {
        uint256 oneEth = getConversionRate();
        uint256 ethAmountInUsd = (oneEth * _ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}