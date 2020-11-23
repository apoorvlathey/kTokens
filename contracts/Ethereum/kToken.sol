pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract kToken is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    
    IERC20 public underlyingAToken;
    
    constructor(
        IERC20 aToken, 
        string memory kTokenName, 
        string memory kTokenSymbol, 
        uint8 decimals
    ) public ERC20Detailed(kTokenName, kTokenSymbol, decimals) {
        underlyingAToken = aToken;
    }
    
    function deposit(uint256 depositAmt) external returns (uint256 shares) {
        uint256 prevBal = underlyingAToken.balanceOf(address(this));
        underlyingAToken.safeTransferFrom(
            msg.sender,
            address(this),
            depositAmt
        );
        if(totalSupply() == 0) {
            shares = depositAmt;
        } else {
            shares = depositAmt.mul(totalSupply()).div(prevBal);
        }
        _mint(msg.sender, shares);
    }
    
    function withdraw(uint256 shares) external returns (uint256 withdrawAmt) {
        withdrawAmt = sharePrice().mul(shares).div(uint256(10)**decimals());
        _burn(msg.sender, shares);
        underlyingAToken.safeTransfer(
            msg.sender,
            withdrawAmt
        );
    }
    
    function sharePrice() public view returns(uint256) {
        if(totalSupply() == 0) {
            return 0;
        }
        return underlyingAToken.balanceOf(address(this)).mul(uint256(10)**decimals()).div(totalSupply());
    }
}