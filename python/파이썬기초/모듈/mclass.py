class Student:
    def __init__(self,a,b,c):
        self.name=a
        self.age=b
        self.addr=c
    def show(self):
        print('이름',self.name)
        print('나이',self.age)
        print('주소',self.addr)