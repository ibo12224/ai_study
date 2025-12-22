import statistics

class Score:
    def __init__(self, name, kor, eng, math):
        self.name = name
        self.kor = kor
        self.eng = eng
        self.math = math
    
    def __str__(self):
        return f"{self.name}\t{self.kor}\t{self.eng}\t{self.math}"
    def __repr__(self):
        return f"{self.name}\t{self.kor}\t{self.eng}\t{self.math}"
    def getData(self):
        return f"{self.name}\t{self.kor}\t{self.eng}\t{self.math}"


class ScoreManager:
    def __init__(self):
        self.scores = []
        
    def inputScore(self):
        while True:
            name=input("이름: ")
            kor=int(input("국어: "))
            eng=int(input("영어: "))
            math=int(input("수학: "))
            
            self.scores.append( Score(name, kor, eng, math) )

            if input("계속 입력하시겠습니까(y/n)? ").lower() != 'y':
                break

    def outputScores(self, scores):
        print("-----------------------------------------")
        print("이름\t국어\t영어\t수학")
        print("-----------------------------------------")
        for sc in scores:
            print(sc)
        print("-----------------------------------------")

    def searchScore(self):
        name=input("검색할 이름을 입력하세요:")
        for sc in self.scores:
            if sc.name==name:
                self.outputScores([sc])
                return 0
        print("검색결과 없음")

    def modifyScore(self):
        name=input("수정할 이름을 입력하세요:")
        for sc in self.scores:
            if sc.name==name:
                sc.name=input(f"이름({sc.name}):")
                sc.kor=input(f"국어({sc.kor}):")
                sc.eng=input(f"영어({sc.eng}):")
                sc.math=input(f"수학({sc.math}):")
                print("수정되었습니다.")
                return 0
        print("검색결과 없음")
    
    def saveScore(self):
        fname=input("저장할 파일명을 입력하세요")
        file=open(fname,"w")
        for sc in self.scores:
            file.write(str(sc)+"\n")

    def statisticsScore(self):
        kor=[]
        eng=[]
        math=[]
        for sc in self.scores:
            kor.append(sc.kor)
            eng.append(sc.eng)
            math.append(sc.math)
        print(f"국어 : 가장큰값:{max(kor)}, 총합:{sum(kor)}, 평균:{statistics.mean(kor)}")
        print(f"영어 : 가장큰값:{max(eng)}, 총합:{sum(eng)}, 평균:{statistics.mean(eng)}")
        print(f"수학 : 가장큰값:{max(math)}, 총합:{sum(math)}, 평균:{statistics.mean(math)}")

def main():
    scmanager=ScoreManager()
    while True:
        print(r"메인메뉴)")
        print("\t1.입력")
        print("\t2.출력")
        print("\t3.검색")
        print("\t4.수정")
        print("\t5.저장")
        print("\t6.통계")
        print("\t7.종료")
        num=int(input("번호를 입력하세요:"))
        if num==1:
            scmanager.inputScore()
            print(scmanager.scores)
        elif num==2:
            scmanager.outputScores(scmanager.scores)
        elif num==3:
            #검색
            scmanager.searchScore()
        elif num==4:
            scmanager.modifyScore()
        elif num==5:
            scmanager.saveScore()
        elif num==6:
            scmanager.statisticsScore()
        else:
            break
        print()

if __name__=="__main__":
    main()