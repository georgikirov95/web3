// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

/**
 * @title ERC20
 * @dev Basic implementation of an ERC20 token contract.
 */
contract ERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "myToken";
    string public symbol = "MY_TOKEN";

    /**
     * @notice Transfers tokens to a specified address.
     * @param recipient The address of the recipient.
     * @param amount The amount of tokens to transfer.
     * @return success A boolean value indicating whether the operation succeeded.
     */
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        return true;
    }

    /**
     * @notice Approves another address to spend a specified amount of tokens on behalf of the caller.
     * @param spender The address authorized to spend the tokens.
     * @param amount The maximum amount of tokens that can be spent.
     * @return success A boolean value indicating whether the operation succeeded.
     */

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    /**
     * @notice Transfers tokens from one address to another using an allowance mechanism.
     * @param sender The address of the token owner.
     * @param recipient The address of the recipient.
     * @param amount The amount of tokens to transfer.
     * @return success A boolean value indicating whether the operation succeeded.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        return true;
    }

    /**
     * @notice Mints new tokens and adds them to the caller's balance.
     * @dev Increases the total supply of the token.
     * @param amount The amount of tokens to mint.
     */
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    /**
     * @notice Burns tokens from the caller's balance.
     * @dev Decreases the total supply of the token.
     * @param amount The amount of tokens to burn.
     */
    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
