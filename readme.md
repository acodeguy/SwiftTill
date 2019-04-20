# SwiftTill
## Till Tech Test
Create a cash register for a coffee shop that accepts a JSON file as input and spits out a receipt of all the items, including tax and the total amount due.

## Technologies
- Apple Xcode 10.2
- Swift 5
- Cocoapods (SwiftyJSON)

## Using the Code
- Clone this repo: ```git clone git@github.com:acodeguy/SwiftTill.git```
- Install Cocoapods: ```gem install cocoapods```
- Install necessary Pods: ```cd SwiftTill; pod install```
- Open the ```SwiftTill.xcworkspace``` workspace in Xcode

## Testing
Tested with XCTest


## User Stories
```
As a user
So that I can keep build a customer's receipt
I want to be able to add items to the receipt
```
```
As a user
So that I can generate receipts quickly
I want to be able to add multiples of an item in one go
```
```
As a user
So that I can add items quickly to a bill
I want the item's price to be added automatically
```
```
As a user
So that I can charge customers
I want to be able to generate receipts
```
```
As a user
So that I can charge the correct amount
I want to be able to calculate the total
```
```
As a user
So that all taxes are paid
I want to be able to calculate the tax
```

## Version 2
```
As a user
So that I can close a check
I want to be able to accept payment
```
```
As a user
So that I do not overcharge customers
I want to be able to give change when necessary
```
```
As a user
So that I can promote customer loyalty
I would like to be able to offer a 5% discount on orders over 50
```
```
As a user
So that I can reward the purchases of muffins
I'd like to be able to offer 10% discounts on them
```

## Version 3
Implement a user interface that can actually be used as a till.
```
As a user
So that I can create a receipt quickly
I want to be able to use an interface
```
