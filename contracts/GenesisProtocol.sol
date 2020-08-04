pragma solidity ^0.4.0;

import "./ERC20Detailed.sol";
import "./library/SafeMath.sol";
import "./library/SafeMathInt.sol";
import "./Brake.sol";

contract GenesisProtocol is ERC20Detailed, Brake {

    uint256 private constant DECIMALS = 18;
    uint256 private constant MAX_UINT256 = ~uint256(0);
    uint256 private constant INITIAL_SUPPLY = 50 * 10**6 * 10**DECIMALS;

    function initialize(address owner_) public initializer {
        ERC20Detailed.initialize("Genesis Protocol", "GNP", uint8(DECIMALS));
        Ownable.initialize(owner_);

        rebasePaused = false;
        tokenPaused = false;

        _totalSupply = INITIAL_SUPPLY;
        _gonBalances[owner_] = TOTAL_GONS;
        _gonsPerPiece = TOTAL_GONS.div(_totalSupply);

        emit Transfer(address(0x0), owner_, _totalSupply);
    }
}
