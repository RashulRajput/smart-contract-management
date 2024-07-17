# smart-contract-management
---

# AuctionHouse 🏛️

🎉 Welcome to AuctionHouse, your decentralized platform for auctions on Ethereum! 🚀

## Features
- **Create Auctions**: Sellers can list items with start and end times.
- **Place Bids**: Participants bid higher amounts to compete.
- **End Auctions**: Automatically concludes and transfers funds to the highest bidder.

## Usage
1. **Create Auction**:
   - Only the contract owner can initiate auctions.
   - Specify item details and auction duration.

2. **Place Bid**:
   - Participants bid higher amounts than the current highest bid to compete.

3. **End Auction**:
   - Auctions conclude at the specified time.
   - Funds are transferred to the seller upon successful completion.

## Getting Started
- Ensure you have an Ethereum wallet to interact with AuctionHouse.
- Deploy the contract on Remix IDE or testnets for practical use.

## Contract Details
- **Owner**: Address of the contract creator.
- **Auction Count**: Tracks the number of active auctions.
- **Auctions**: Mapping of auction IDs to specific auction details.

---
