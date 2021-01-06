// Local
//// Foo.sol
pragma solidity ^0.7.6;

contract Foo {
    string public name = "Foo";
}

//// Import.sol
pragma solidity ^0.7.6;

//// import Foo.sol from current directory
import "./Foo.sol";

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();

    // Test Foo.sol by getting it's name
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}

//External
// You can also import from GitHub by simply copying the url
import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";
