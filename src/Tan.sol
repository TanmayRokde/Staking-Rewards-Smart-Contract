// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.13;
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Tan is ERC20{
    address stakingContract;
    address owner;

    constructor(address _stakingContract) ERC20("Tan", "TAN") {
        owner = msg.sender;
        stakingContract = _stakingContract;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == stakingContract);
        _mint(to, amount);
    }

    function updateStakingContract(address _stakingContract) public {
        require(msg.sender == owner);
        stakingContract = _stakingContract;
    }
}