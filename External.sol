pragma solidity ^0.4.0;

contract externalContract {
    function externalCall(string x) external returns (uint) {
        return 123;
    }
    
    function publicCall(string x) public returns (uint) {
        return 123;
    }
}