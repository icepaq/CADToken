// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract EIC20 {
    function name() public view returns(string memory) {
        return "CAD Token";
    }
    
    function symbol() public view returns(string memory) {
        return "CADT";
    }
    
    function decimals() public view returns(uint8) {
        return 0;
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
}