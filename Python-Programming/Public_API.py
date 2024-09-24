import requests
import pandas as pd

# URL ของ API
url = "https://api.coingecko.com/api/v3/coins/markets"

# กำหนดจำนวนหน้าและจำนวนเหรียญต่อหน้า
total_pages = 5  # จำนวนหน้าที่ต้องการดึงข้อมูล
coins_per_page = 10  # จำนวนเหรียญต่อหน้า

# สร้างลิสต์เก็บข้อมูลทั้งหมด
all_data = []

# ใช้ for loop เพื่อดึงข้อมูลจากหลายหน้า
for i in range(1, total_pages + 1):
    params = {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': coins_per_page,
        'page': i,
        'sparkline': 'false'
    }

    # ส่ง request ไปยัง API
    response = requests.get(url, params=params)

    if response.status_code == 200:
        # แปลงข้อมูลที่ได้รับเป็น JSON
        data = response.json()
        all_data.extend(data)  # เพิ่มข้อมูลลงในลิสต์
    else:
        print(f"Error: {response.status_code} on page {i}")

# สร้าง DataFrame จากข้อมูลทั้งหมด
df = pd.DataFrame(all_data)

# แสดง DataFrame
print(df.head())

# เลือกแสดงคอลัมน์ที่ต้องการ
selected_columns = ['id', 'symbol', 'name', 'current_price', 'market_cap', 'total_volume']
df_selected = df[selected_columns]
print(df_selected)

# Read CSV File
import pandas as pd
pd.read_csv('coins_data.csv')

# แสดง DataFrame
df.head(10)

# เลือกแสดงคอลัมน์ที่ต้องการ
selected_columns = ['id', 'symbol', 'name', 'current_price', 'market_cap', 'total_volume']
df_selected = df[selected_columns]
df_selected
