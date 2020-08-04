pragma solidity ^0.4.26;

import "./Ownable.sol";

contract Brake is Ownable {
    event LogRebasePaused(bool paused);
    event LogTokenPaused(bool paused);


    //controls.
    bool public rebasePaused;
    bool public tokenPaused;


    modifier whenRebaseNotPaused() {
        require(!rebasePaused);
        _;
    }

    modifier whenTokenNotPaused() {
        require(!tokenPaused);
        _;
    }


    /**
     * @dev Pauses or unpauses the execution of rebase operations.
     * @param paused Pauses rebase operations if this is true.
     */
    function setRebasePaused(bool paused) external onlyOwner {
        rebasePaused = paused;
        emit LogRebasePaused(paused);
    }

    /**
     * @dev Pauses or unpauses execution of ERC-20 transactions.
     * @param paused Pauses ERC-20 transactions if this is true.
     */
    function setTokenPaused(bool paused) external onlyOwner {
        tokenPaused = paused;
        emit LogTokenPaused(paused);
    }
}
