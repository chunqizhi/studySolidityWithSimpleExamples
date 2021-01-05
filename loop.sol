pragma solidity ^0.7.6;

contract Loop {
    // for Loop
    for (uint i = 0; i < 10; i++) {
        if (i == 3) {
            // Skip to next iteration with continue
            continue;
        }
        if (i == 5) {
            // Exit Loop with break
            break;
        }
    }

    // while Loop
    uint j;
    while (j < 10) {
        j++;
    }
}