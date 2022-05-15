//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NftEcomBlock is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public nftCost = 0.05 ether;
    uint256 public maxnftSupply = 100;
    bool public onlyWhitelisted = true;
    address[] public whitelistedAddresses;
    mapping(address => uint256) public nftAllowed;

    constructor(string memory _name, string memory _symbol)
        // string memory _initBaseURI
        ERC721(_name, _symbol)
    {
        // setBaseURI(_initBaseURI);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    // mint function
    function mint(uint256 _mintAmount) public payable {
        // uint256 supply = totalSupply();
        // require(_mintAmount > 0, "You need to mint at least 1 NFT");
        // require(supply + _mintAmount <= maxSupply, "max NFT limit exceeded");
        // require(isWhiteListed(msg.sender), "You are not whitelisted");
        // uint256 MintedCount = addressMintedBalance[msg.sender];
        // require(MintedCount + _mintAmount <= nftPerAddressLimit, "NFT allowe to mint per address exceeded");
    }
}
