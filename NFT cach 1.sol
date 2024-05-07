// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("MyToken", "MTK")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
    return "ipfs://Qmcrk96exwhLH3j8xJUpn7hz3fHGcoQr7rJPaFeW3hr4y1/";
}
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = ++_nextTokenId;
        _safeMint(to, tokenId);
    }
}