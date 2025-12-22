import pymysql
def main():
    try:
        db = pymysql.connect(host="127.0.0.1", user='root' ,
                        passwd='1234',database='test')
        cur = db.cursor()
        sql = """create table if not exists product(
        pname varchar(50) primary key,
        pnum int,
        pdate date
        )"""
        cur.execute(sql)

        while(True):
            pname=input("제품명:")
            pnum=int(input("수량:"))
            pdate=input("생산일: ")
            if pdate not in '-':
                pdate="2000-01-01"
            sql = "insert into product values (%s, %s, %s)"
            cur.execute(sql, (pname, pnum, pdate))
            com=input("계속 입력하시겠습니까(y/n)?")
            if com.upper()=='N':
                break

        sql=f"select * from product"
        cur.execute( sql )
        fdata = cur.fetchall()
        print("-"*30)
        print("제품명\t수량\t생산일")
        print("-"*30)
        for a,b,c in fdata:
            print(f"{a}\t{b}\t{c}")
        print("-"*30)
        db.commit()
    except Exception as err:
        print('에러', err)


if __name__=="__main__":
    main()



