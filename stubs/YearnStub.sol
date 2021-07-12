// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity 0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YearnStub is ERC20 {
    using SafeMath for uint256;

    uint256 currSharePrice;
    address internal usdc;

    constructor(uint256 _currSharePrice, address _usdc)
        public
        ERC20("yUSDC", "yUSDC")
    {
        currSharePrice = _currSharePrice;
        usdc = _usdc;
    }

    function deposit(uint256 amount) external returns (uint256) {
        uint256 yusdcAmount = amount.div(currSharePrice);
        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, yusdcAmount);
    }

    function deposit(uint256 amount, address recipient)
        external
        returns (uint256)
    {
        uint256 yusdcAmount = amount.div(currSharePrice);
        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
        _mint(recipient, yusdcAmount);
    }

    function withdraw(uint256 maxShares)
        external
        returns (uint256 usdcToTransfer)
    {
        uint256 currBalance = balanceOf(msg.sender);
        require(maxShares <= currBalance, "Not enough balance to withdraw");

        usdcToTransfer = maxShares.mul(currSharePrice);
        //Burn YUSDC token
        _burn(msg.sender, maxShares);
        IERC20(usdc).transferFrom(address(this), msg.sender, usdcToTransfer);
    }

    function pricePerShare() external view returns (uint256) {
        return currSharePrice;
    }

    function setCurrentSharePrice(uint256 _newSharePrice)
        external
        returns (uint256)
    {
        currSharePrice = _newSharePrice;
        return currSharePrice;
    }
}
