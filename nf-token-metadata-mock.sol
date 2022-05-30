// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./tokens/nf-token-metadata.sol";
import "./ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract NFTokenMetadataMock is
  NFTokenMetadata,
  Ownable
{

  //mapping (uint256 => string) internal imageHashMap;

  event textualContentLog(uint indexed _tokenId, string content);

  /**
   * @dev Contract constructor.
   * @param _name A descriptive name for a collection of NFTs.
   * @param _symbol An abbreviated name for NFTokens.
   */
  constructor(
    string memory _name,
    string memory _symbol
  )
  {
    nftName = _name;
    nftSymbol = _symbol;
  }

  /*
  function getImageHash(uint256 _tokenId) view external returns (string memory)
  {
    return imageHashMap[_tokenId];
  }
  */

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    //string calldata _imageHash,
    string calldata _textualContent,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);

    //imageHashMap[_tokenId] = _imageHash;
    emit textualContentLog(_tokenId, _textualContent);
  }

  /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }

}

