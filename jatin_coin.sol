// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JatinCoin{
      address public owner;
      uint public totalSupply;
      mapping (address => uint) public balance;
      string public name= "JatinCoin";
      string public symbol = "JC";


     constructor(){
        owner = msg.sender;
     }

     function mint(uint amount) public{
        require(msg.sender==owner);
        balance[msg.sender]+=amount;
        totalSupply+= amount;
     }

     function mintTo(uint amount , address to) public{
        require(msg.sender==owner);
        balance[to]+=amount;
        totalSupply+= amount;
     } 

     function transfer (address to, uint amount ) public {
        require(balance[msg.sender]>amount);
        balance[msg.sender]-=amount;
        balance[to] +=amount;

     }

     function burn (uint amount)public {
        require(balance[msg.sender]>amount);
        balance[msg.sender]-=amount;
        totalSupply-=amount;
     }
}
///without ERC_20