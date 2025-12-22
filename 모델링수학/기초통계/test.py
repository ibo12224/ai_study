import numpy as np
from scipy.stats import norm

mu_0 = 100 #귀무가설의 참을 위한 모집합
sigma = 5 #표준편차
n = 50 #표본크기
x_bar = 101.5 #표본 평균
alpha = 0.05 #유의값

std_error = sigma / np.sqrt(n)
#np.sqrt(n) 표본크기의 제곱근 5
#sigma 표준편차
#즉 표준오차를 구하는 공식
z_score = (x_bar - mu_0) / std_error
#z값을 구하는 공식 (표본 평균-모집합용 값)/
p_value = 2 * (1 - norm.cdf(abs(z_score)))

z_critical_two = norm.ppf(1 - alpha/2)

print(f"표준 오차 (Standard Error): {std_error:.3f} g")
print(f"계산된 검정 통계량 Z-score: {z_score:.3f}")
print(f"계산된 **P-값 (P-value)**: **{p_value:.4f}**")

print("\n## 2. P-값 기반 최종 결론")
print(f"P-값: {p_value:.4f}")
print(f"유의수준 (alpha): {alpha:.4f}")

if p_value < alpha:
    print(f" {p_value:.4f} < {alpha:.4f} 이므로, 귀무가설 **기각**")
    print("해석: 과자 무게는 통계적으로 유의미하게 100g과 **다르다**고 결론 내릴 수 있습니다.")
else:
    print(" 귀무가설 기각 **실패**")
    print("해석: 과자 무게가 100g과 다르다고 볼 통계적 증거가 충분하지 않습니다.")