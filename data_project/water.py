import requests
import pandas as pd
import numpy as np

url = 'https://apis.data.go.kr/1480523/WaterQualityService/getWaterMeasuringList'
key = 'ePSdJxdLS6tqJrxStuufUYpC2pFIX0nPUGq94RE45W5ipNMft6nTH94Hj63v5fwjjSYjKTINLuo0uaHOAa6rqg=='
params = {
    'serviceKey': key,
    'pageNo': '1',
    'numOfRows': '3000',
    'resultType': 'json',
    'ptNoList': '2022A30,2022A35,2022A40,2022A45,2022A50,2022A60,2022B10,2022B20,2022B30,2022F05,2022F10,2022F20,2022F40,2022F45,2022F60', # 측정소 코드
    'wmyrList': '2022,2023,2024,2025',      # 연도
    'wmodList': '01,02,03,04,05,06,07,08,09,10,11,12'        # 월(01, 02, 03월)
}
class water():
    def waterDF():
        try:
            # 3. API 요청
            response = requests.get(url, params=params, verify=True) # https 대응
            
            if response.status_code == 200:
                data = response.json()
                
                # 4. 데이터 추출 (구조: getWaterMeasuringList -> item)
                items = data.get('getWaterMeasuringList', {}).get('item', [])
                
                if items:
                    df = pd.DataFrame(items)
                    df.set_index('ROWNO',inplace=True)

                    # 5. 주요 수질 항목 한글 이름으로 변경 (보기 좋게)
                    rename_map = {
                        'PT_NM': '총량지점명',
                        'WMCYMD': '일자',
                        'ITEM_TEMP': '수온(℃)',
                        'ITEM_PH': '수소이온농도(ph)',
                        'ITEM_EC': '전기전도도(μS/㎝)',
                        'ITEM_DOC': '용존산소(㎎/L)',
                        'ITEM_BOD': 'BOD(㎎/L)',
                        'ITEM_COD': 'COD(㎎/L)',
                        'ITEM_SS': '부유물질(㎎/L)',
                        'ITEM_TN': '총질소(T-N)(㎎/L)',
                        'ITEM_TP': '총인(T-P)(㎎/L)',
                        'ITEM_TOC': '총유기탄소(TOC)(㎎/L)',
                        'ITEM_AMNT': '유량(㎥/s)'
                        # 'ITEM_CLOA': '클로로필a'
                    }
                    
                    # 2. 필요한 컬럼만 추출하여 새 DF 생성
                    df_analysis = df[list(rename_map.keys())].copy()
                    df_analysis.rename(columns=rename_map, inplace=True)

                    # 3. 데이터 타입 숫자형으로 변환 (연산 가능하게)
                    num_cols = ['수온(℃)', '수소이온농도(ph)', '전기전도도(μS/㎝)', '용존산소(㎎/L)', 'BOD(㎎/L)', 'COD(㎎/L)', '부유물질(㎎/L)', '총질소(T-N)(㎎/L)', '총인(T-P)(㎎/L)', '총유기탄소(TOC)(㎎/L)', '유량(㎥/s)']
                    df_analysis[num_cols] = df_analysis[num_cols].apply(pd.to_numeric, errors='coerce')

                    # # 4. 날짜 데이터 형식 변환 (YYYYMMDD -> datetime)
                    df_analysis['일자'] = pd.to_datetime(df_analysis['일자'], errors='coerce')

                    print("--- 분석 준비 완료: 핵심 수질 지표 ---")
                    print(df_analysis.head())
                else:
                    print("응답은 성공했으나 데이터가 없습니다.")
            else:
                print(f"API 요청 실패: {response.status_code}")

        except Exception as e:
            print(f"오류 발생: {e}")

        df1 = df_analysis[df_analysis['유량(㎥/s)'].notna()]
        df2 = pd.read_csv('data/nakdong_water_quality.csv', encoding='euc-kr')
        waterDF = pd.concat([df1, df2], axis=0)
        waterDF['일자'] = pd.to_datetime(waterDF['일자'], errors='coerce')
        return waterDF
    
    def total_water():
        df2 = pd.read_csv('data/nakdong_water_quality.csv', encoding='euc-kr')
        df2['일자'] = pd.to_datetime(df2['일자'], errors='coerce')
        return df2