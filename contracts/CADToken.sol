// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./EIP20.sol";



contract CADToken is EIP20 {
    
    struct ApprovalsType { // For approvals function. User (spender) and amount user is allowed to widthdraw (amount).
        address spender;
        uint256 amount;
    }
    
    
    address private owner = msg.sender;
    uint256 private supply = 0;
    
    mapping (address => uint256) bank;
    
    mapping (address => ApprovalsType[]) approved; // For approve function
    
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
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        approved[msg.sender].push(ApprovalsType(_spender, _value));
        
        return true;
    }
    
    // Unfinished
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        ApprovalsType[] memory approvals = approved[_owner];
        
        uint256 amount = 0;
        
        for (uint256 i = 0; i < approvals.length; i++) {
            if (approvals[i].spender == _spender) {
                amount = approvals[i].amount;
            }
        }
        
        return amount;
    }
}