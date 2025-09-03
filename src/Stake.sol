// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract Stake {
    uint256 public totalStaked;
    mapping(address => uint256) public stakedAmount;

    constructor(){

    }

    function stake() public payable{
        require(msg.value > 0, "Amount must be greater than 0");
        totalStaked += msg.value;
        stakedAmount[msg.sender] += msg.value;
    }

    function unstake(uint256 _amount) public {
        require(stakedAmount[msg.sender] >= _amount, "Insufficient staked amount");
        totalStaked -= _amount;
        stakedAmount[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
 }
