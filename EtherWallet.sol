// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

/**
 * @title EtherWallet
 * @dev A simple wallet contract that allows the contract owner to store and withdraw Ether.
 */
contract EtherWallet {
    address payable public immutable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint amount) external {
        require(msg.sender == owner, "caller is not owner");
        // using msg.sender instead of owner to save some gas.
        payable(msg.sender).transfer(amount);
    }

    function getBalnce() external view returns (uint) {
        return address(this).balance;
    }
}
