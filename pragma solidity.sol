pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/interfaces/IERC721Receiver.sol";

contract ArtePeruano is ERC721, IERC721Receiver {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    struct Art {
        string title;
        string artist;
        string uri; // URI that points to the art image
        uint256 price; // Price of the NFT
    }

    mapping(uint256 => Art) public arts;

    event ArtCreated(uint256 indexed tokenId, string title, string artist, uint256 price);

    constructor() ERC721("ArtePeruano", "ART") {}

    function createArt(string memory title, string memory artist, string memory uri, uint256 price) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
        arts[tokenId] = Art(title, artist, uri, price);
        emit ArtCreated(tokenId, title, artist, price);
    }

    function buyArt(uint256 tokenId) public payable {
        require(_exists(tokenId), "Este arte no existe.");
        require(msg.value >= arts[tokenId].price, "No se ha enviado suficiente Ether.");
        require(ownerOf(tokenId) != msg.sender, "No puedes comprar tu propio arte.");
        
        // Transfer the token
        address owner = ownerOf(tokenId);
        _transfer(owner, msg.sender, tokenId);
        
        // Transfer the funds to the seller
        payable(owner).transfer(msg.value);
    }

    function getArtDetails(uint256 tokenId) public view returns (Art memory) {
        require(_exists(tokenId), "Este arte no existe.");
        return arts[tokenId];
    }

    // This function allows the contract to receive NFTs
    function onERC721Received(address, address from, uint256, bytes memory) public pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}