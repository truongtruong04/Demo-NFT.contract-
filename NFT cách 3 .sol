// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract N is ERC721, Ownable {
    using Strings for uint256;

    constructor() ERC721("pvt ", "lbr") Ownable(msg.sender) {}
    function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) { 
        _requireOwned(_tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, _tokenId.toString()) :"";
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return "ipfs://Qmcz4kYMirATYCccjpcPSo8eWaZN5WFVoKXHAAGmh1xDcg/";
    }

    function mint(address _to, uint256 _tokenId) external onlyOwner { 
        _mint(_to, _tokenId);
    }
}