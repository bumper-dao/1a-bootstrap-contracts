// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;

import "../BumpMarket.sol";

contract BumpMarketTest is BumpMarket {
    function getStableCoinsDetail(StableCoins _coin)
        public
        view
        returns (StableCoinDetail memory)
    {
        return stableCoinsDetail[keccak256(abi.encodePacked(_coin))];
    }

    function getWhitelistAddresses(address whitelistAddr)
        public
        view
        returns (bool)
    {
        return whitelist[whitelistAddr];
    }

    function overflow() public pure returns (uint256) {
        uint256 max = 2**256 - 1;
        return max + 1;
    }

    // 0 - 1 = 2**256 - 1
    function underflow() public pure returns (uint256) {
        uint256 min = 0;
        return min - 1;
    }
}
