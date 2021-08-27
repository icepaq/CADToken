// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./EIP20.sol";



contract CADToken is EIP20 {
    
    
    address private owner = msg.sender;
    uint256 private supply = 0;
    
    mapping (address => uint256) bank;
    
    mapping (address => mapping (address => uint256 )) approved; // For approve function
    
    function mint(uint256 _amount) public {
        supply += _amount;
        bank[msg.sender] += _amount;
    }
    
    function totalSupply() public view returns(uint256) {
        return supply;
    }
    
    function balanceOf(address _owner) public view returns(uint256) {
        return bank[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns(bool) {
        require(bank[msg.sender] >= _value);
        
        
        bank[msg.sender] -= _value;
        bank[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(bank[_from] >= _value);
        require(approved[_from][_to] >= _value);
        
        bank[_from] -= _value;
        bank[_to] += _value;
        
        approved[_from][_to] -= _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(bank[msg.sender] >= _value);
        approved[msg.sender][_spender] = _value;
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return approved[_owner][_spender];
    }
}