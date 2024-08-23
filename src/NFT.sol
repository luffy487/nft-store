// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    uint private _tokenIds;
    address public owner;

    struct TokenSale {
        uint256 price;
        bool isForSale;
    }

    mapping(uint256 => TokenSale) public tokenSales;

    modifier isOwner() {
        require(msg.sender == owner, "You must be the owner");
        _;
    }

    modifier isTokenOwner(uint256 _tokenId) {
        require(
            msg.sender == ownerOf(_tokenId),
            "You must be the owner of the token"
        );
        _;
    }

    modifier isTokenForSale(uint256 _tokenId) {
        require(tokenSales[_tokenId].isForSale, "Token is not for sale");
        _;
    }

    constructor(address _owner) ERC721("One Piece", "OP") {
        owner = _owner;
    }

    function mintNFT(string memory tokenURI) public isOwner returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    function listTokenForSale(
        uint256 _tokenId,
        uint256 _price
    ) public isTokenOwner(_tokenId) {
        require(_price > 0, "Price must be greater than zero");
        tokenSales[_tokenId] = TokenSale({price: _price, isForSale: true});
        approve(address(this), _tokenId);
    }

    function cancelSale(uint256 _tokenId) public isTokenOwner(_tokenId) {
        tokenSales[_tokenId].isForSale = false;
    }

    function buyToken(
        uint256 _tokenId
    ) public payable isTokenForSale(_tokenId) {
        TokenSale memory sale = tokenSales[_tokenId];
        require(msg.value >= sale.price, "Insufficient payment");
        address seller = ownerOf(_tokenId);
        tokenSales[_tokenId].isForSale = false;
        _transfer(seller, msg.sender, _tokenId);
        payable(seller).transfer(sale.price);
        if (msg.value > sale.price) {
            payable(msg.sender).transfer(msg.value - sale.price);
        }
    }

    function withdraw() public isOwner {
        payable(owner).transfer(address(this).balance);
    }

    function getSalePrice(
        uint256 _tokenId
    ) public view returns (uint256 price) {
        TokenSale memory sale = tokenSales[_tokenId];
        return sale.price;
    }

    function fetchUserNFTs(
        address user
    ) public view returns (uint256[] memory) {
        uint256[] memory userNFTs = new uint256[](_tokenIds);
        uint256 counter = 0;
        for (uint256 i = 1; i <= _tokenIds; i++) {
            if (ownerOf(i) == user) {
                userNFTs[counter] = i;
                counter++;
            }
        }
        uint256[] memory result = new uint256[](counter);
        for (uint256 j = 0; j < counter; j++) {
            result[j] = userNFTs[j];
        }
        return result;
    }

    function fetchNFTsForSale() public view returns (uint256[] memory) {
        uint256[] memory nftsForSale = new uint256[](_tokenIds);
        uint256 counter = 0;
        for (uint256 i = 1; i <= _tokenIds; i++) {
            if (tokenSales[i].isForSale) {
                nftsForSale[counter] = i;
                counter++;
            }
        }
        uint256[] memory result = new uint256[](counter);
        for (uint256 j = 0; j < counter; j++) {
            result[j] = nftsForSale[j];
        }

        return result;
    }
}
