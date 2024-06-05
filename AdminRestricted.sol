Question:
Write a smart contract that allows only the admin to access and call all the functions of the contract.

Hint: use modifiers to restrict access

Solution:
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdminRestricted {
    address public admin;
    uint256 public value;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can access");
        _;
    }

    function setValue(uint256 _value) public onlyAdmin {
        value = _value;
    }

    function getValue() public view onlyAdmin returns (uint256) {
        return value;
    }

    function add(uint256 a, uint256 b) public view onlyAdmin returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) public view onlyAdmin returns (uint256) {
        require(a >= b, "Subtraction result must be positive");
        return a - b;
    }
}
