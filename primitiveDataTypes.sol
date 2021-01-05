pragma solidity ^0.7.6;

contract Primitives {
    bool boo = true;

    uint8 u8 = 1;

    uint256 u256 = 456;

    uint u = 123; // uint is an alias for uinit256

    int8 i8 = -1;

    int256 i256 = 456;

    int i = -123; // int is same as int256

    address addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Default values
    bool defaultBool; // false
    uint defaultUint; // 0
    int defaultInt; // 0
    address defaultAddr; // 0x0000000000000000000000000000000000000000
}