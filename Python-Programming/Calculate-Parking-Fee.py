def solution(E, L):
    # แปลงสตริงเวลาให้กลายเป็นตัวเลขชั่วโมงและนาที
    E_hours, E_minutes = map(int, E.split(':'))
    L_hours, L_minutes = map(int, L.split(':'))

    # คำนวณระยะเวลาที่จอดรถ
    parked_hours = L_hours - E_hours
    parked_minutes = L_minutes - E_minutes

    # ปัดเศษนาที
    if parked_minutes > 0:
        parked_hours += 1

    # คำนวณราคาจอดรถ
    total_price = 0

    # ค่าเข้าจอดรถ
    total_price += 2

    # ค่าจอดรถ 1 ชั่วโมงแรก
    if parked_hours >= 1:
        total_price += 3

    # ค่าจอดรถเกิน 1 ชั่วโมงแรก
    if parked_hours > 1:
        total_price += 4 * (parked_hours - 1)  # คิดค่าจอดชั่วโมงละ 4 บาท

    return total_price

# ตัวอย่างการใช้งาน
E = input("เวลาเข้าจอดรถ (HH:MM): ")
L = input("เวลาออกจอดรถ (HH:MM): ")

result = solution(E, L)
print(f"ราคารวมของค่าจอดรถ: {result} บาท")
