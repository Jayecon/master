import matplotlib.pyplot as plt
import numpy as np

# x 값의 범위를 -1에서 6으로 설정
x = np.linspace(0, 6, 400)

# y 값들을 정의
y1 = x
y2 = np.sqrt(np.maximum(0, x))  # x가 음수일 때 sqrt(x)는 정의되지 않으므로 최대값 0을 사용

# 그래프를 그립니다.
plt.figure(figsize=(8, 6))
plt.plot(x, y1, label=r'$y=x$', color='blue')
plt.plot(x, y2, label=r'$y=\sqrt{x}$', color='red')

# 그래프 제목과 레이블을 추가
plt.title('Graphs of $y=x$ and $y=\\sqrt{x}$')
plt.xlabel('x')
plt.ylabel('y')

# 범례를 추가
plt.legend()

# 그리드 추가
plt.grid(True)

# 그래프를 화면에 출력
plt.show()

