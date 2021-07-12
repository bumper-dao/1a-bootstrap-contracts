// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;
import "../BUMPToken.sol";

contract BUMPTokenTest is BUMPToken {
    function getWhitelistAddresses(address whitelistAddr)
        public
        view
        returns (bool)
    {
        return whitelist[whitelistAddr];
    }
}
