pragma solidity ^0.4.0;

library intExtended {
    
    function increment(uint _self) returns (uint){
        return _self + 1;
    }
    function decrement(uint _self) returns (uint) {
        return _self - 1;
    }
    
}