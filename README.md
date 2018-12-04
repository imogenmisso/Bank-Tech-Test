# Bank Tech Test

A tech test completed in Week 10 at Makers Academy

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


## My Approach
I decided to break this problem down by writing one long feature test which adhered to the specification requirements. I then used this to guide my design and chose to have two classes: account and statement.

I initially decided to have an Account class, which allowed the user to debit or credit her account. It also kept a log of all transactions which was then printed in the Statement class. After refactoring, I decided to separate the Account class out further into a new Transaction class. This ensured that my classes were adhering to the SRP. The Transaction class stores the date, type, amount and remaining balance after a transaction.

## How to install my code
  * `git clone` https://github.com/imogenmisso/Bank-Tech-Test
  * run `bundle`
  * to run the tests: `Rspec`

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

## Testing results
* COVERAGE: 100.00% -- 73/73 lines in 5 files
* 10 examples, 0 failures
