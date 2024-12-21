// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Set {
    string public name;

    function setter(string memory _name) external {
        name = _name;
    }
}

contract Get {
    function setting(address _contract, string memory _name) public returns (bytes memory) {
        (bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setter(string)", _name));
        require(!success, "Name not set");
        return data;
    }
}
