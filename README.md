# NFT Smart Contract

This smart contract allows you to create, sell, and buy Non-Fungible Tokens (NFTs) on the Ethereum blockchain. It uses the ERC721 standard and comes with basic functionality for NFT sales.

## Features

- **Mint New NFTs**: Create new NFTs with unique identifiers.
- **List NFTs for Sale**: Set a price and list your NFTs for sale.
- **Buy NFTs**: Purchase NFTs that are listed for sale.
- **Cancel Sales**: Remove NFTs from the sale list.
- **Withdraw Funds**: The owner can withdraw any funds from the contract.
- **View NFTs**: Check which NFTs are owned by a specific user or are available for sale.

## How It Works

### Contract Initialization

The contract is initialized with an owner's address. This owner has special privileges to mint NFTs and withdraw funds.

### Key Functions

1. **Minting NFTs**
   - **Function**: `mintNFT`
   - **Purpose**: Create a new NFT with a unique ID and a URL linking to its metadata.
   - **Usage**: Only the owner can mint new NFTs.
   - **Returns**: The ID of the newly minted NFT.

2. **Listing NFTs for Sale**
   - **Function**: `listTokenForSale`
   - **Purpose**: Put an NFT up for sale by setting its price.
   - **Usage**: NFT owner lists their token for sale.

3. **Buying NFTs**
   - **Function**: `buyToken`
   - **Purpose**: Purchase an NFT that is listed for sale.
   - **Usage**: Buyer sends the required amount of Ether to buy the token.

4. **Canceling Sales**
   - **Function**: `cancelSale`
   - **Purpose**: Remove an NFT from the sale list.
   - **Usage**: NFT owner cancels the sale if they change their mind.

5. **Withdrawing Funds**
   - **Function**: `withdraw`
   - **Purpose**: Owner can withdraw the balance of Ether held in the contract.
   - **Usage**: Only the contract owner can use this function.

6. **Fetching NFTs**
   - **Function**: `fetchUserNFTs`
   - **Purpose**: List all NFTs owned by a specific address.
   - **Usage**: Check what NFTs a user owns.

   - **Function**: `fetchNFTsForSale`
   - **Purpose**: List all NFTs currently available for sale.
   - **Usage**: See which NFTs are up for purchase.

## Development

### Solidity

This contract is written in Solidity, a high-level programming language for writing smart contracts on the Ethereum blockchain. Solidity is designed for developing smart contracts that run on the Ethereum Virtual Machine (EVM).

### Foundry

The contract is developed and tested using **Foundry**, a fast and reliable development environment for Ethereum smart contracts. Foundry includes tools for compiling, testing, and deploying Solidity contracts. It provides a robust and efficient workflow for smart contract development.

