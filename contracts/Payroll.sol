pragma solidity ^0.6.0;

contract Payroll {
    address public owner;
    constructor(address _owner) public {
        owner = _owner;
    }

    function send(address payable[] memory to, uint[] memory amount) public payable onlyOwner() {
        require(to.length == amount.length, 'to and amount arrays must have the same length');
        for(uint i = 0; i < to.length; i++) {
            to[i].transfer(amount[i]);
        }
    }
    // declare modifier
    modifier onlyOwner() {
        require(msg.sender == owner, 'only owner can send transfers ');
        _;

    }
}