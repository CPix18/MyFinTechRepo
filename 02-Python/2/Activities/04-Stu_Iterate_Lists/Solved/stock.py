count = 0 
total = 0
average = 0
minimum = 0 
maximum = 0


profitable_days = []
unprofitable_days = []


trading_pnl = [-224,  352, 252, 354, -544,
                -650,   56, 123, -43,  254,
                 325, -123,  47, 321,  123,
                 133, -151, 613, 232, -311 ]


for day_pnl in trading_pnl:
    
   
    total += day_pnl
    count += 1
    
  
    if minimum == 0:
        minimum = day_pnl
    elif day_pnl < minimum:
        minimum = day_pnl
    elif day_pnl > maximum:
        maximum = day_pnl
    
    #Logic to determine profitable vs. unprofitable days
    if day_pnl > 0:
        profitable_days.append(day_pnl)
    elif day_pnl <= 0:
        unprofitable_days.append(day_pnl)

        
average = round(total / count, 2)


profitable_count = len(profitable_days)
unprofitable_count = len(unprofitable_days)


percent_profitable = profitable_count / count * 100
percent_unprofitable = unprofitable_count / count * 100