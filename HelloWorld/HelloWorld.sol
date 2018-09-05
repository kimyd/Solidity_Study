pragma solidity ^0.4.21;


contract HelloWorld {
  string myString;
  function saveString(string _contents) public {
    myString = _contents;
  }

  function viewString() public view returns(string) {
    return myString;
  }
}

