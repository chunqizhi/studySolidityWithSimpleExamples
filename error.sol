pragma solidity ^0.7.6;

contract Error {
    function testRequire(uint _i) public {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public {
        // Revert is useful when the condition to check is complex
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be grater than 10");
        }
    }

    uint public num;

    function testAssert() public {
        // Assert should only be used to test for internal errors
        // and to check invariants
        assert(num == 0);
    }
}

// another
pragma solidtiy ^0.7.6;

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2 ** 256 - 1;
    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance,"Overflow");

        balance = newBalance;
        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount,"Underflow");

        if (balance <= _amount) {
            revert("Underflow");
        }

        balance -= _amount;
        assert(balance <= oldBalance);
    }
}