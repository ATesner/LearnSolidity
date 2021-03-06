pragma solidity ^0.4.0;

import "browser/library.sol";

contract TestLibrary {
    using intExtended for uint;
    
    function testIncrement(uint _base) returns (uint){
        return _base.increment();
    }
}

interface Regulator {
    
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator{
    
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender);
        _;
    }
    
    function Bank(uint amount){
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) ownerFunc {
        value += amount;
    }
    
    function withdraw(uint amount) ownerFunc {
        if(checkValue(amount)){
            value -= amount;
        }
        
    }
    
    function balance() returns (uint){
        return value;
    }
    
    function loan() returns (bool){
        return value > 0;
    }
    
    function checkValue(uint amount) returns (bool) {
        return amount <= value;    
    }
}

contract FirstContract is Bank(10) {
    
    string private name;
    uint private age;
    
    function setName(string _name){
        name = _name;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge(uint _age){
        age = _age;
    }
    
    function getAge() returns (uint) {
        return age;
    }
    
}

contract TestThrows {
    
    function testAssert(){
        assert(false);
    }
    
    function testRequire(){
        require(false);
    }
    
    function testRevert(){
        revert();
    }
    
    function testThrow(){
        throw;
    }
}