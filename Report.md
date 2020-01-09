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

Mảng 90 phần tử.

```
input_sort.txt
--------------

90
145 593 578 868 918 83 815 250 752 729 667 299 789 960 62 781 343 694 42 630 80 703 56 573 921 201 337 240 80 42 332 730 28 571 711 600 524 130 267 332 550 617 981 879 491 813 597 247 258 48 883 733 152 173 899 851 271 187 51 137 266 529 552 647 743 465 158 760 319 39 394 243 784 840 882 617 701 28 580 105 379 458 584 650 74 199 868 504 692 984
```

```
Console log
-----------

Quicksort mini MIPS program
Open file from: ./input_sort.txt
So luong phan tu: 90
145 593 578 868 918 83 815 250 752 729 667 299 789 960 62 781 343 694 42 630 80 703 56 573 921 201 337 240 80 42 332 730 28 571 711 600 524 130 267 332 550 617 981 879 491 813 597 247 258 48 883 733 152 173 899 851 271 187 51 137 266 529 552 647 743 465 158 760 319 39 394 243 784 840 882 617 701 28 580 105 379 458 584 650 74 199 868 504 692 984
Load file complete
Open file from: ./output_sort.txt
Save file complete
```

```
output_sort.txt
---------------

28 28 39 42 42 48 51 56 62 74 80 80 83 105 130 137 145 152 158 173 187 199 201 240 243 247 250 258 266 267 271 299 319 332 332 337 343 379 394 458 465 491 504 524 529 550 552 571 573 578 580 584 593 597 600 617 617 630 647 650 667 692 694 701 703 711 729 730 733 743 752 760 781 784 789 813 815 840 851 868 868 879 882 883 899 918 921 960 981 984  
```



Ngoài ra nhóm có viết thêm một đoạn script test gen bằng C++ để hỗ trợ tìm bug.



---



# Lời cảm ơn
Để hoàn thiện được đồ án này, không thể nhắc tới sự hướng dẫn từ những thầy cô ở HCMUS. Gửi lời cảm ơn chân thành đến:

-   Thầy **Lê Quốc Hòa**, giảng viên phụ trách bộ môn Kiến Trúc Máy Tính và Hợp Ngữ và là người trực tiếp hướng dẫn đồ án
-   Cô **Chung Thùy Linh**, giảng viên hướng dẫn thực hành.

Một lời cảm ơn nữa đến những người đồng đội đã cùng nhau thực hiện và hoàn thiện đồ án này cho tới thời điểm cuối cùng.

> Chúc mọi người có nhiều sức khỏe và thành công trong công việc.

