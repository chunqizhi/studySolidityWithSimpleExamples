pragma solidity ^0.7.6;

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;
    event Log(uint,address, uint);
    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
        emit Log(num, sender, value);
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;
    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified
        (bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
    }
}