const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
    // const PROVIDER = "HTTP://127.0.0.1:7545";
    // const PRIVATE_KEY = "0x980e8856975093bb103514dbe464d6f274cc1f03a30b8a9a18c4cb64b772ac66";

    const PRIVATE_KEY = process.env.PRIVATE_KEY
    const PROVIDER = process.env.RPC_URL
    const connection = new ethers.providers.JsonRpcProvider(PROVIDER);
    const wallet = new ethers.Wallet(PRIVATE_KEY,connection);
    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
    const bin = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf8");

    const contractFactory = new ethers.ContractFactory(abi,bin,wallet);
    console.log("Deployingg");
    // const overrides = { gasLimit: 6000000 }; 
    // const contract = await contractFactory.deploy(overrides);
    const contract = await contractFactory.deploy();
    await contract.deployTransaction.wait(1); // wait for one more block to add in chain before confirmation of this block
    console.log(contract.address);

    const currentFavoriteNumber = await contract.retrieve();
    console.log(`Current Favourite Number is ${currentFavoriteNumber.toString()}`);
    const transactionResponse = await contract.store("7");
    const transactionReceipt = await transactionResponse.wait(1);
    const updatedFavoriteNumber = await contract.retrieve();
    console.log(`Updated Favourite Number is ${updatedFavoriteNumber.toString()}`);
    console.log("Done");
}

main()
    .then(()=>process.exit(0))
    .catch((error)=>{
        console.log(error);
        process.exit(1)
    });