// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Stake.sol";

contract TestContract is Test {
    Stake c;

    function setUp() public {
        c = new Stake();
    }

    function testStake() public {
        uint amount = 2 ether;
        c.stake{value: amount}();
        assertEq(c.totalStaked(), amount);
    }

function testUnstake() public {
    uint256 amount = 2 ether;
    address user = address(0x123); // simulate an EOA

    // Fund the user with ETH
    vm.deal(user, 10 ether);

    // Make user call stake
    vm.prank(user);
    c.stake{value: amount}();

    // Make the same user call unstake
    vm.prank(user);
    c.unstake(amount);

    // Assert totalStaked is now 0
    assertEq(c.totalStaked(), 0);
}

}
