
const etherObj = require("hardhat");

async function main() {

  const Counter = await etherObj.ethers.getContractFactory("Counter");
  const counter = await Counter.deploy(0);

  await counter.deployed();

  console.log(
    `Counter contract deployed to ${counter.address}`
  );
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
