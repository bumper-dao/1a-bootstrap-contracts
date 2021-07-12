// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;
import "../BUMPToken.sol";

contract BUMPTokenUpgrade is BUMPToken {
    function newMethod() public pure returns (uint256) {
        return 100;
    }
}
