# Về báo cáo

**Đồ án 2: "Thực hành lập trình hợp ngữ MIPS"**
Môn `CSC10005`: Kiến trúc máy tính và hợp ngữ
Khoa CNTT – CTĐA, Trường ĐH KHTN – ĐHQG TP.HCM
`2019-12-06 ~ 2019-12-28`

Nhóm gồm 2 thành viên (thuộc lớp `18CLC6`):

-   `18127221`: Bùi Văn Thiện (GitHub: [@84436](https://github.com/84436))
-   `18127231`: Đoàn Đình Toàn (GitHub: [@t3bol90](https://github.com/t3bol90))



---



# Về đồ án

| Công việc                           | Thành viên thực hiện |
| ----------------------------------- | :------------------: |
| Thiết lập đồ án (GitHub repo, v.v.) |      Văn Thiện       |
| Làm BT 1 (`Array.asm`)              |      Văn Thiện       |
| Làm BT 2 (`QuickSort.asm`)          |      Đình Toàn       |
| Viết báo cáo                        | Đình Toàn, Văn Thiện |



### Tổng quan

-   Mức độ hoàn thiện: 100%
-   Môi trường lập trình: **MARS 4.5** (Java) trên Windows 10 và Ubuntu 18.04.3 LTS



### Về `.macro`, `.eqv` và `.include`

Đồ án này tận dụng 3 chỉ thị đặc biệt:

-   Cặp `.macro` và `.end_macro`: định nghĩa 1 từ khóa tương ứng với một block code, có thể kèm theo các tham số đầu vào hoặc không
-   `.eqv`: tương tự như `.macro`, nhưng chỉ đối với 1 dòng code/1 giá trị và không có tham số đầu vào. Tương tự như `#define` trong C.
-   `.include`: Thêm toàn bộ nội dung file được chỉ định vào nơi bản thân `.include` được gọi. Tương tự như `#include` trong C.

Vì các chỉ thị trên chỉ có từ MARS **phiên bản 4.3 hoặc mới hơn**, nên đồ án mặc định yêu cầu phải được chạy trên phiên bản MARS nói trên.



---



# Demo

Phần demo này sẽ ghi lại console log và nội dung các file input/output (nếu có) khi chạy các bài với dữ liệu mẫu tương ứng.



### Bài 1 (`Array.asm`)

Mảng 10 phần tử: $\{ 14, 5, 2, 3, 7, 4, 9, 20, 13, 15 \}$


```
Console log
-----------

[1 of 3] Enter array size (strictly positive)
Array size = 10

[2 of 3] Enter each elements in array (strictly positive)
a[0] = 14
a[1] = 5
a[2] = 2
a[3] = 3
a[4] = 7
a[5] = 4
a[6] = 9
a[7] = 20
a[8] = 13
a[9] = 15

[3 of 3] Choose a function from the menu.
1 : List all elements
2 : Get sum of all elements
3 : List primes only
4 : Find maximum element
5 : Find an element
0 : Exit

> Enter a choice [0-5]: 1
List (all):
14 5 2 3 7 4 9 20 13 15

> Enter a choice [0-5]: 2
Sum = 92

> Enter a choice [0-5]: 3
List (primes only):
5 2 3 7 13

> Enter a choice [0-5]: 4
Max = 20

> Enter a choice [0-5]: 5
Enter a number: 7
Number found at index 4

> Enter a choice [0-5]: 5
Enter a number: 8
Number not found

> Enter a choice [0-5]: 0
Goodbye.
```



### Bài 2 (`QuickSort.asm`)

Mảng 10 phần tử: $\{ 25, 29, 41, 11, 18, 43, 13, 39, 1, 6 \}$

```
input_sort.txt
--------------

10
25 29 41 11 18 43 13 39 1 6
```

```
Console log
-----------

< TODO: console log >
```

```
output_sort.txt
---------------

1 6 11 13 18 25 29 39 41 43 
```



---



# Lời cảm ơn
Để hoàn thiện được đồ án này, không thể nhắc tới sự hướng dẫn từ những thầy cô ở HCMUS. Gửi lời cảm ơn chân thành đến:

-   Thầy **Lê Quốc Hòa**, giảng viên phụ trách bộ môn Kiến Trúc Máy Tính và Hợp Ngữ và là người trực tiếp hướng dẫn đồ án
-   Cô **Chung Thùy Linh**, giảng viên hướng dẫn thực hành.

Một lời cảm ơn nữa đến những người đồng đội đã cùng nhau thực hiện và hoàn thiện đồ án này cho tới thời điểm cuối cùng.

> Chúc mọi người có nhiều sức khỏe và thành công trong công việc.

