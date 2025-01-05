// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    uint256 public constant MAX_SUPPLY = 100;
    uint256 public constant price = 0.00001 ether;
    uint256 public totalSupply;

    event NFTCreated(uint256 indexed tokenId, address indexed owner);

    constructor(
        address initialOwner
    ) ERC721("Indian Curry", "INC") ERC721URIStorage() Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT(
        string memory tokenURI
    ) external payable returns (uint256) {
        require(tokenCounter <= MAX_SUPPLY, "Maximum supply reached");
        require(msg.value == price, "Incorrect price");

        uint256 newTokenId = tokenCounter;
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter++;
        totalSupply++;
        emit NFTCreated(newTokenId, msg.sender);

        return newTokenId;
    }
}
