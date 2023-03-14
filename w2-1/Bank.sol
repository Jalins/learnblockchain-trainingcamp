//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Bank {
    address owner;
    uint TotalBalance;
    mapping(address => uint) public balanceOf;

    event DepositEvent(address acc, uint amount);
    event WithdrawEvent(address acc, uint amount);

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "only owner be allow to withdraw");
        _;
    }

    fallback ()  external payable{
        deposit();
    }

    receive ()  external payable{
        deposit();
    }



    function deposit() public payable{
        balanceOf[msg.sender] = msg.value;
        TotalBalance += msg.value; 
        emit DepositEvent(msg.sender, msg.value);
    }

    // 只有合约的拥有者才能调用该函数
    function withdraw() external onlyOwner payable{
        payable(msg.sender).transfer(TotalBalance);
        emit WithdrawEvent(msg.sender, TotalBalance);
    }

    function getBalanceOf() public view returns(uint) {
        uint amount = balanceOf[msg.sender];
        return amount;
    }

}