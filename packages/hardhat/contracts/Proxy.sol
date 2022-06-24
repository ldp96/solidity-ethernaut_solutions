// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

interface PuzzleProxy {

    function proposeNewAdmin(address _newAdmin) external ;

}


interface PuzzleWallet{
    function multicall(bytes[] calldata data) external payable;
    function setMaxBalance(uint256 _maxBalance) external;

    function addToWhitelist(address addr) external;

    function deposit() external payable;
    

    function execute(address to, uint256 value, bytes calldata data) external payable;

}

