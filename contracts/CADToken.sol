// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./EIC20.sol";

contract CADToken is EIC20 {
    address private owner = msg.sender;
    uint256 private supply = 0;
    
    mapping (address => uint256) bank;
    
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
    
    // Unfinished
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(bank[_from] >= _value);
        //require(approved[_from] == msg.sender);
        
        bank[_from] -= _value;
        bank[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    // Unfinished
    function approve(address _spender, uint256 _value) public returns (bool success) {
        
    }
    
    // Unfinished
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        
    }

}