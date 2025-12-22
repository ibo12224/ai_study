def yun(year):
    if year%4==0 and year%100!=0 or year%400==0:
        return("윤년입니다")
    else:
        return("윤년이 아닙니다")

def yy(year):
    animallist = ['원숭이', '닭', '개', '돼지', '쥐', '소', '호랑이', '토끼', '용', '뱀', '말', '양']
    return f"{year}년은 {animallist[year % 12]}띠입니다."

def mm(money,price):
    change = money - price
    c={}
    for coin in [500, 100, 50, 10]:
        count = change // coin
        change %= coin #change = change % coin
        if count > 0:
            c[coin]=change
    return c