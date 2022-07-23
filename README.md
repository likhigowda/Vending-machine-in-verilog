# Vending Machine with Change System
### Verilog Project

A vending machine is an automated machine that provides items such as snacks, beverages, cigarettes and lottery tickets to consumers after cash, a credit card, or other form of payment is inserted into the machine or otherwise made.

Certain assumptions are madefor this verilog code.
1. The vending has only one type of product i.e., water bottle which costs 15 Rs
2. It accepts only 5 Rs and 10 Rs coins (Denomination)

### State Diagram
![image.png](attachment:image.png)

### State Transitions
#### The product costs 15 Rs.

#### S0 : 0 Rs in Vending Machine –
* If nothing added: Stay on State 0, OUTPUT = 0, CHANGE = 0.
* If 5 Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
* If 10 Rs added: Move to State 2, OUTPUT = 0, CHANGE = 0.

#### S1 : 5 Rs in Vending Machine –
* If nothing added: Here, this means the vending machine waited some time but no money was added signifying an incomplete transaction, thus the vending machine should return back the money added as CHANGE (5 Rs). No bottle given.<br>
Move to State 0, OUTPUT = 0, CHANGE = Rs 5 (01).
* If 5 Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
* If 10 Rs added: Adding 10 Rs means the vending machine now has 15 Rs total thus, a bottle will be returned with no CHANGE.<br>
Move to State 0, OUTPUT = 1, CHANGE = Rs 0.

#### S2 : 10 Rs in Vending Machine –
* If nothing added: Again, incomplete transaction thus vending machine returns the money added as CHANGE (10 Rs). No bottle given.<br>
Move to State 0, OUTPUT = 0, CHANGE = Rs 10 (10).
* If 5 Rs added: Signifies a complete transaction, a bottle is returned  with no CHANGE.<br>
Move to State 0, OUTPUT = 1, CHANGE = Rs 0.
* If 10 Rs added: Here the customer over payed, thus a bottle should be returned but with CHANGE(5 Rs).<br>
Move to State 0, OUTPUT = 1, CHANGE = Rs 5 (01).

## Results

#### Adding 5 Rs three times consecutively
![image.png](attachment:image.png)

#### Adding 5 Rs and then 10 Rs
![image.png](attachment:image.png)

#### Adding 10 Rs two times
![image.png](attachment:image.png)

#### Adding 5 Rs and then nothing
![image.png](attachment:image.png)

#### Adding 10 Rs and then nothing
![image.png](attachment:image.png)
