// Get Funds From User;
// Withdraw Funds;
// Set a Minimum value in USD;

// SPDX-License-Identifier: MIT

    // since blockchains can't directly interact with real world (because they are deterministic), there are certain chainlinks which interact with real world
    // why they are deterministic because, if they directly interact with real world, different nodes will have different data, which will lead to the condition
    // of CONSENSUS NOT REACHED. (CONSENSUS means general agreement).

    // blockchain nodes can't make api call because they won't be able to reach consensus.
    // blockchain oracle is a device that interacts with off chain world to provide the data to smart contract or blockchains.

    // Chainlink Data Feeds (sab jagah se data leke single contract me blockchains ko data dedeta hai) 
    // websites to checkout more -> data.chain.link, http://docs.chain.link/, https://docs.chain.link/data-feeds/using-data-feeds

    // learn about getting a random number in a blockchain,proven way by ChainLinkVRF, https://chain.link/vrf

    // ChainLink Keepers (triggers which automatially do some actions if a condition is met), they listen to the events and fire after specific time
    // or specific event.

    // end to end relaiability , because chainlink node can make api calls,

pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

error NotOwner();
contract FundMe {

    // uint256 public minimumUsd = 50 * 1e18; // 1* 10 ** 18
    uint256 public constant MINIMUM_USD = 50 * 1e18; // 1* 10 ** 18

    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;
    // address public owner;
    address public immutable owner;
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD;
        // 1. How to we send ETH to this contract?;
        // contract address can also hold fund, just like wallet;

        // require(msg.value > 1e18, "Didn't send enough!!"); // 1 * 10 ** 18 == 100000000000(18 zeros), which means 1 eth, 18 zeros because transaction is done in wei 
        require(getConversionRate(msg.value) >= MINIMUM_USD,"Didn't send enough!!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        // this require keyword simply means a if block, that msg.value should be greater than this, else return error didnt send enough, just like javascript ternary operator(?)
    }
    
    function getPrice() public view returns (uint256){
        // since we want to get the price of eth in compared to USD, we have to interact with chain link for this, which is also a contract,
        // and to interact with a contract we need two things:
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI 

        // Address can be found easily on contract address section of datalink
        // ABI is just a list of functions details

        AggregatorV3Interface priceFeed =  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // (uint80 roundId, int price, uint256 startedAt, uint256 timeStamp, uint80 answeredInRound);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD;
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        // AggregatorV3Interface versions = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // return versions.version();
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 oneEthPrice = getPrice();
        uint256 ethAmountInUsd = (oneEthPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function withdraw() public onlyOwner {
        // /*start index, end index, step*/
        // for (uint256 funderIndex = 0; funderIndex<funders.length;funderIndex= funderIndex + 1)
        // require(msg.sender == owner, "Sender is Not the Owner");
        for (uint256 funderIndex = 0; funderIndex<funders.length;funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new  address[](0);

        // now since they are withdrawing from this, we have to actually send ETH to the people who are withdrawing, 
        // so there are three ways to send money to the people,
        
        // transfer (easy and used on service level), if it fails, it throws error,
        // send (if it fails, returns bool)
        // call

        payable(msg.sender).transfer(address(this).balance);
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed !");

        (bool callSuccess, ) = payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "Call failed");
        // revert();
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Sender is Not the Owner");
        _;
        // if (msg.sender != owner) {
        //     revert NotOwner();
        // }
    }

    // if someone sends payment to this contract address, we will still receive money on our fund function
    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
}
