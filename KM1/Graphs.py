import numpy as np
import matplotlib.pyplot as plt

plt.grid(True)
plt.xlabel('Разрядность')
plt.ylabel('Частота, МГц')
plt.title('Максимальная рабочая частота сумматора от его разрядности')
plt.plot([8,16,32,64,128],[121.12,88.4,86.03,72.07,64.04])
plt.plot([8,16,32,64,128],[152.28,79.37,61.69,41.46,21.61])
plt.show()

plt.grid(True)
plt.xlabel('Разрядность')
plt.ylabel('Количество логических элементов')
plt.title('Зависимость количества логических элементов от разрядности сумматора')
plt.plot([8,16,32,64,128],[29,53,101,203,409])
plt.plot([8,16,32,64,128],[31,53,113,211,436])
plt.show()
