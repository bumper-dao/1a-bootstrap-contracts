// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;

import "../BUSDC.sol";

contract BUSDCUpgrade is BUSDC {
    uint256 public newVariable;

    ///@notice This is the function to set value of new state variable added in new upgrade
    ///@param _newVariable Is new value for newVariable state variable
    function setNewVariable(uint256 _newVariable) public {
        newVariable = _newVariable;
    }
}
