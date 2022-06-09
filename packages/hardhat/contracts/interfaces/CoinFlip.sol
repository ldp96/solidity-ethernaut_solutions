// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

interface CoinFlip {

    function flip(bool _guess) external returns(bool);
}