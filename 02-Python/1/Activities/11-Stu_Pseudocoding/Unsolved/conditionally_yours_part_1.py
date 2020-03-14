# Conditionally Yours, Part 1

In this two-part activity, you will pseudocode a solution for identifying whether or not a stock should be purchased, based on the percent increase or decrease in stock price. Then, you will implement your algorithm.

## Background

Harold just returned from a meeting with his supervisor with a huge grin on his face. Thanks to your program, Harold was able to spend more time making decisions about which stocks to buy and sell; he now has the second highest profit earnings for the week.

While on your lunch break together, you start proposing ideas about how the program can be taken to the next level. Harold's ears perk up when you mention that you can add logic that identifies whether or not a stock should be purchased based on the percent increase or decrease in stock price.

Harold knows that this would allow him to focus only on buying and selling; the program would handle all decision making and get him one step closer to securing the title of top trader for weeks to come. You begin considering the requirements for the enhanced program.

For this activity, work with a partner to create pseudocode a program that will:

* Calculate percent increase or decrease in stock price for Netflix.

* Identify a viable percent increase/decrease that will indicate buy or sell action. Assume a 20% increase or decrease in stock price should warrant buy or sell action.

* Use conditional statements to determine whether or not a stock should be purchased or sold:

  Increase = Current Price - Original Price

  Percent Increase = Increase / Original x 100

## Instructions

Using the [starter file](Unsolved/conditionally_yours_part_1.py), complete the following steps:

1. Pseudocode variable declaration.

2. Pseudocode `percent_increase` calculation.

3. Pseudocode `if-else` logic to determine the buy or sell recommendation.

## Hint

Start by writing the logic out in plain language. Then, refine it into pseudocode."""
Conditionally Yours

Pseudocode:

Whether or not to buy a stock, increase or decrease

define open_price, close_price, increase/decrease, percent_increase, recommendation

If Netflix increases by 20%, sell (x) shares

If Netflix decreases by 20%, buy (x) shares


open_price = 420
close_price = 465
 
 increase/decrease = close_price - open_price
 percent_increase = increase/open_price
 recommendation ""
 threshold_to_sell = 20
 threshold_to_buy = -20

 if percent_increase > threshold_to_sell:
    print (sell)
else:
    percent increase > threshold_to_buy:
    print (buy)
elif:
    print(hold)
"""
