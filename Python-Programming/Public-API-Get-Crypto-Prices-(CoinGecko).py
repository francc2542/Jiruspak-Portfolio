import requests
import csv
from time import sleep

# สร้างลิสต์เพื่อเก็บข้อมูลเหรียญ
coins = []

# URL สำหรับ API ของ CoinGecko
base_url = 'https://api.coingecko.com/api/v3/coins/markets'
params = {
    'vs_currency': 'usd',  # แสดงราคาในสกุลเงิน USD
    'order': 'market_cap_desc',  # เรียงลำดับตามมูลค่าตลาด
    'per_page': 10,  # จำนวนเหรียญที่ต้องการดึงข้อมูล
    'page': 1,  # หน้าแรก
    'sparkline': 'false'  # ไม่ใช้ sparkline
}

response = requests.get(base_url, params=params)
response_js = response.json()

# ตรวจสอบว่าการตอบกลับมีข้อมูลหรือไม่
if response.status_code == 200:
    for coin in response_js:
        coin_id = coin["id"]
        name = coin["name"]
        current_price = coin["current_price"]
        result = [coin_id, name, current_price]
        coins.append(result)
else:
    print(f"Error retrieving data: {response_js.get('message', 'Unknown error')}")

# หยุด 2 วินาทีก่อนทำการบันทึกข้อมูล
sleep(2)

print(coins)

# เขียนข้อมูลลงในไฟล์ CSV
header = ["Coin ID", "Name", "Current Price (USD)"]
with open("coins_data.csv", "w", newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(coins)

# Read CSV File
import pandas as pd
pd.read_csv('coins_data.csv')
