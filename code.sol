// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuctionHouse {
    address private owner;
    uint public auctionCount;
    mapping (uint => Auction) public auctions;

    struct Auction {
        address seller;
        uint startTime;
        uint endTime;
        uint highestBid;
        address highestBidder;
        string itemDescription;
    }

    constructor() {
        owner = msg.sender;
        auctionCount = 0;
    }

    function createAuction(string memory _itemDescription, uint _startTime, uint _endTime) public {
        require(msg.sender == owner, "Only the owner can create auctions");
        Auction memory newAuction = Auction(msg.sender, _startTime, _endTime, 0, address(0), _itemDescription);
        auctions[auctionCount] = newAuction;
        auctionCount++;
    }

    function bid(uint _auctionId, uint _amount) public {
        require(_auctionId < auctionCount, "Auction does not exist");
        Auction storage auction = auctions[_auctionId];
        require(block.timestamp >= auction.startTime && block.timestamp <= auction.endTime, "Auction is not active");
        require(_amount > auction.highestBid, "Bid is not higher than the current highest bid");
        auction.highestBid = _amount;
        auction.highestBidder = msg.sender;
    }

    function endAuction(uint _auctionId) public {
        require(_auctionId < auctionCount, "Auction does not exist");
        Auction storage auction = auctions[_auctionId];
        require(block.timestamp > auction.endTime, "Auction is still active");
        if (auction.highestBid > 0) {
            payable(auction.seller).transfer(auction.highestBid);
        }
        delete auctions[_auctionId];
    }

    function getAuction(uint _auctionId) public view returns (address, uint, uint, uint, address, string memory) {
        require(_auctionId < auctionCount, "Auction does not exist");
        Auction storage auction = auctions[_auctionId];
        return (auction.seller, auction.startTime, auction.endTime, auction.highestBid, auction.highestBidder, auction.itemDescription);
    }
}
