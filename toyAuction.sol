pragma solidity ^0.4.21;

pragma solidity ^0.4.21;

//before modification
contract toyAuction {
  address public theHighestBidder;
  uint public theHighestBidPrice = 0;
  string public itemName = "My Picture";

  //bidding
  function doBid() public payable {
    require(msg.value > theHighestBidPrice);
    uint refund = theHighestBidPrice;
    address currentBidder = theHighestBidder;

    theHighestBidder = msg.sender;
    theHighestBidPrice = msg.value;

    currentBidder.transfer(refund);
  }

  function checkBid() public view returns (address, uint, string) {
    return (theHighestBidder, theHighestBidPrice, itemName);
  }
}
