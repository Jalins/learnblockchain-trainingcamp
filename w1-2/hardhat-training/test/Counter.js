const { ethers } = require("hardhat");
const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Counter", function () {

  async function deployCounter(){
    const [owner, otherAccount] = await ethers.getSigners();
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy(0);

    return {owner, otherAccount, counter}
  }


  // 部署者可以调用count方法
  it("owner can invoke count function", async function () {
    const { counter } = await loadFixture(deployCounter);
    const [owner] = await ethers.getSigners();

    await counter.connect(owner).count();
    expect(await counter.getCounter()).to.equal(1);
  });

  // 其他账户不能调用count方法
  it("revert error if called from another account", async function () {
    const { counter, otherAccount } = await loadFixture(deployCounter);

    await expect(counter.connect(otherAccount).count()).to.be.revertedWith("only owner is allowed!");
  })
});