pragma solidity ^0.4.21;

pragma solidity ^0.4.21;

//after  modification
contract toyAuction {
  address public theHighestBidder;
  uint public theHighestBidPrice = 0;
  string public itemName = "My Picture";
  string public bidderName;

  //bidding
  function doBid(string _name) public payable {
    require(msg.value > theHighestBidPrice);
    require(msg.value > 0.1 ether);
    uint refund = theHighestBidPrice;
    address currentBidder = theHighestBidder;

    bidderName = _name;

    theHighestBidder = msg.sender;
    theHighestBidPrice = msg.value;

    currentBidder.transfer(refund);
  }

  //get current status
  function checkBid() public view returns (address, uint, string) {
    return (theHighestBidder, theHighestBidPrice, itemName);
  }
}
