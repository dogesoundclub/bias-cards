pragma solidity ^0.5.6;

import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/math/SafeMath.sol";
import "./klaytn-contracts/utils/Address.sol";
import "./BiasCards.sol";

contract BiasCardsTransfer is Ownable {
    using SafeMath for uint256;
    using Address for address;

    BiasCards public cards = BiasCards(0x542e98A99B5A0aAa0D4Ddfd9Ae582a1b05008Ac8);

    function transferMany(address[] calldata tos, uint256[] calldata ids) external {
        uint256 length = ids.length;
        for (uint256 i = 0; i < length; i = i.add(1)) {
            if (!tos[i].isContract()) {
                cards.safeTransferFrom(msg.sender, tos[i], ids[i], 1, "");
            }
        }
    }
}
