

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

   
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    */
    function withdraw(uint amount, address payable recipient) public {

        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        require(address(this).balance >= amount, "Insufficient funds!");

        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
            }

        recipient.transfer(amount);

        lastWithdrawAmount = amount;

        contractBalance = address(this).balance;
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        contractBalance = address(this).balance;
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        accountOne = account1;
        accountTwo = account2;
    }

    function() external payable {}
}
