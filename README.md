# Bank Tech Test

## My Approach
I decided to break this problem down by writing one long feature test which adhered to the specification requirements. I then used this to guide my design and chose to have two classes: account and statement.

The account class is responsible for keeping a log of all the transactions, and it allows the user to credit or debit her account.

The responsibility of the statement class is to print out all the transactions in the desired format.

## How to install my code
  * `git clone` https://github.com/imogenmisso/Bank-Tech-Test
  * to run the tests: `rspec`

## Implementation in IRB
* `2.5.0 :001 > require './lib/account'
 => true`
* `2.5.0 :002 > require './lib/statement'
 => true`
* `2.5.0 :003 > account = Account.new
 => #<Account:0x00007f89daa1ec60 @balance=0, @transactions=[]>`
* `2.5.0 :004 > account.deposit(10)
 => [["03/12/2018", 10, "", 10]]`
* `2.5.0 :005 > account.deposit(100)
 => [["03/12/2018", 10, "", 10], ["03/12/2018", 100, "", 110]]`
* `2.5.0 :006 > account.withdraw(5)
 => [["03/12/2018", 10, "", 10], ["03/12/2018", 100, "", 110], ["03/12/2018", "", 5, 105]]`
* `2.5.0 :007 > statement = Statement.new(account)
 => #<Statement:0x00007f89da9fefc8 @account=#<Account:0x00007f89daa1ec60 @balance=105, @transactions=[["03/12/2018", 10, "", 10], ["03/12/2018", 100, "",
110], ["03/12/2018", "", 5, 105]], @time="03/12/2018">>`
* `2.5.0 :008 > statement.show
 => "date || credit || debit || balance\n03/12/2018 ||  || 5 || 105\n03/12/2018 || 100 ||  || 110\n03/12/2018 || 10 ||  || 10"`
