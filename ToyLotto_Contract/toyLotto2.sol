pragma solidity ^0.4.21;

contract toyLotto{

  uint public numOfLotto;
  mapping (uint => address) public lottoToOwner;  
  address public winnerAddress;
  uint public winnerLottoId;
  uint public winnerReward;
  
  uint public lottoPrice = 0.1 ether;
  uint public lottoFee = 0.01 ether;

  address public owner;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function buyLotto() payable public {
    require(numOfLotto < 3);
    require(msg.value == lottoPrice);

    for(uint i=0 ; i<numOfLotto ; i++){
      require(msg.sender != lottoToOwner[i]);
    }
    lottoToOwner[numOfLotto++] = msg.sender;
    winnerReward = winnerReward + lottoPrice;
  }

  function drawLotto() public {
    require(numOfLotto == 3);
    uint timeStamp = block.timestamp;

    winnerLottoId = timeStamp % 3;
    winnerAddress = lottoToOwner[winnerLottoId];

    uint winnerAmount = winnerReward - lottoFee;
    winnerAddress.transfer(winnerAmount);

    numOfLotto = 0;
    winnerReward = 0;
  }

  function withdrawFee() public onlyOwner {
    require(address(this).balance > 0);
    uint payment = address(this).balance;
    owner.transfer(payment);
  }

  function checkWinner() public view returns(address, uint) {
    return (winnerAddress, winnerLottoId);
  }

}
