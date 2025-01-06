// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

/**
 * @title Ownable
 * @dev A simple contract to establish and manage ownership.
 *
 * Features:
 * - Assigns the deployer as the initial owner.
 * - Restricts access to specific functions using the `onlyOwner` modifier.
 * - Allows transferring ownership to a new address.
 */
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {}

    function anyoneCanCallThisFunc() external {}
}
