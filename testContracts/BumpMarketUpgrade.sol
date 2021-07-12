// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;

import "../BumpMarket.sol";

contract BumpMarketUpgrade is BumpMarket {
    uint256 public newVariable;

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

    ///@notice This is the function to set value of new state variable added in new upgrade
    ///@param _newVariable Is new value for newVariable state variable
    function setNewVariable(uint256 _newVariable) public {
        newVariable = _newVariable;
    }
}
