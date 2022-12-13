<h1> Banking App <h1> 
<div>
A tech test to practice code quality.
<h5>
<a href='https://github.com/kwatts949/banking_app/blob/main/README.md#Specification'> Specification </a> <span> · </span>
<a href='https://github.com/kwatts949/banking_app/blob/main/README.md#Installation'> Installation </a><span> · </span>
<a href='https://github.com/kwatts949/banking_app/blob/main/README.md#Running-locally'> Running locally</a><span> · </span>
<a href='https://github.com/kwatts949/banking_app/blob/main/README.md#Testing'> Testing </a><span> · </span>
<a href='https://github.com/kwatts949/banking_app/blob/main/README.md#Process'> Process </a>  
<h5>
</div>

# Specification

- You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

# Installation

Clone this repo.

In terminal (Mac), run:

```
$ cd banking_app
$ bundle install
```

# Running locally

Go to project directory:

```
$ cd banking_app/lib
```

Require main file:

```
$ irb -r ./account.rb
```

To create a new account:

```
$ account = Account.new
```

To make a deposit:

```
$ account.deposit(Transaction.new(500, '12-12-2022'))
```

To make a withdrawal:

```
$ account.withdraw(Transaction.new(400, '12-12-2022'))
```

To print a statement:

```
$ account.print_statement
```

Example output: <br>

<div align='center'>
<img src="/resources/app_output.png" width="600" height="250" />
</div>

# Testing

To run the tests:

```
$ cd banking_app
$ rspec
```

# Process

<h4>User Stories</h4>
<a href='https://github.com/kwatts949/banking_app/wiki/User-Stories'> You can view the list of user stories here </a>
<h4>Thought Process</h4>
<a href='https://github.com/kwatts949/banking_app/wiki/Thought-Process'> You can view my thought process & details of how I broke the problem down here </a>
<h4>Diagram</h4>
<a href='https://github.com/kwatts949/banking_app/wiki/Diagram'> You can view a diagram solution here </a>
