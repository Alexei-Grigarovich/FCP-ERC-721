// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract Flokicyberpunk is ERC721, ERC721Pausable, Ownable, ERC721Burnable
{
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("FlokiCyberPunk", "FCP")
        Ownable(initialOwner)
    {}

    function pause() public onlyOwner
    {
        _pause();
    }

    function unpause() public onlyOwner
    {
        _unpause();
    }

    function safeMint() public
    {
        require(balanceOf(msg.sender) == 0, "You already have this token");

        uint256 _tokenId = _nextTokenId++;
        _safeMint(msg.sender, _tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory)
    {
        _requireOwned(tokenId);

        return "https://bafybeifry2eduygysfs3mfhenx7aeqcgckpnxta63njvl4mfh7bd457ldm.ipfs.nftstorage.link/nft.json";
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}
