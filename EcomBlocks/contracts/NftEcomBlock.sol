//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NftEcomBlock is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public pricePerNft = 0.05 ether;
    uint256 public maxSupply = 100;
    bool public onlyWhitelisted = true;
    mapping(address => uint8) private whiteListedAddresses;

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
        uint256 tsupply = totalSupply();
        require(
            _mintAmount <= whiteListedAddresses[msg.sender],
            "Exceeded max available to purchase"
        );
        require(_mintAmount > 0, "You need to mint at least One NFT");
        require(tsupply + _mintAmount <= maxSupply, "NFT supply exceeded");
        require(
            pricePerNft * _mintAmount <= msg.value,
            "Ether value sent is not correct"
        );
    }

    //setting  whitelist addresses and number of token they can mint
    function setwhiteListedAddresses(
        address[] calldata addresses,
        uint8 numAllowedToMint
    ) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            whiteListedAddresses[addresses[i]] = numAllowedToMint;
        }
    }
}
