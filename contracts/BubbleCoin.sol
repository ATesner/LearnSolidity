pragma solidity ^0.4.11;

contract BubbleCoin {

    string public constant symbol = "MFT";
    string public constant name = "My First token";
    uint8 public constant decimals = 18;

    uint private constant supply = 1000;
    mapping (address => uint) private balances;
    mapping(address => mapping(address => uint)) private allowed;
    
    function BubbleCoin(){
        balances[msg.sender] = supply;
    }
    
    //ERC20
    function totalSupply() constant returns (uint totalSupply){
        return supply;
    }
    
    function balanceOf(address _owner) constant returns (uint balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value && _value > 0){
            
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            return true;
        }else{
            return false;
        }
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success){
        
        if(balances[_from] >= _value && _value > 0 && allowed[_from][msg.sender] >= _value){
             
             balances[_from] -= _value;
             allowed[_from][msg.sender] -= _value;
             balances[_to] += _value;
             
             return true;
        }else{
            return false;
        }
    }
    
    function approve(address _spender, uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value){
            allowed[msg.sender][_spender] = _value;
            return true;
        } else {
            return false;
        }
    }
    
    function allowance(address _owner, address _spender) constant returns (uint remaining){
        
        return allowed[_owner][_spender];
    }
    
    /*event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
    
*/
}