pragma solidity ^0.7.6;

import "./constructor.sol";

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    // This is called an event. You can emit events from your function and they are logged into the transaction log. In our case, this will be useful for tracing function calls
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }
    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    // Try:
    // - Call D.foo and check the transaction logs
    // 注意：调用 D.foo 的时候，会调用最远的派生重载函数 C.foo，
    // 但是会绕过 B.foo，主要因为它甚至不知道 B 的存在，这个问题使用 super 就可以解决了
    // Although D inherits A, B and C, it only called C and then A
    // - Call D.bar and check the transaction logs
    // D called C, then B, and finally A
    // Although super was called twice (by B and C) it only called A once
    // 参考链接： https://solidity-cn.readthedocs.io/zh/develop/contracts.html?highlight=super#index-14
    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}