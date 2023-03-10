// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import  "hardhat/console.sol";

contract Counter {
    uint public counter ;
    address public owner;

    constructor(uint _counter){
        counter = _counter;
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "only owner is allowed!");
        _;
    }

    function count() external onlyOwner{
        counter =  counter + 1;
        console.log("current use is: ",msg.sender);
    }

    function add(uint _num) external {
        counter = counter + _num;
    }

    function getCounter() external view returns(uint){
        return counter;
    }
}