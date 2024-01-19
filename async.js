// synchronous [solidity]
// asynchronous [javascript]

// cooking

// Synchronous
// 1. Put popcorn in microwave
// 2. Wait for popcorn to finish
// 3. Pour drinks for everyone


// Asynchronous -> Do things without waiting for anything.
// 1. Put popcorn in microwave
// 2. Pour drinks for everyone
// 3. Wait for popcorn to finish

// Promise
// Pending
// Reject
// Fullfilled


async function setupMovieNight(){
    await cookPopcorn();
    await pourDrinks();
    startMoive();
}

function cookPopcorn() {
    return Promise(/* Some code here*/);
}

async function main (){
    
}

main()
    .then(()=>process.exit(0))
    .catch((error)=>{
        console.log(error);
        process.exit(1);
    });