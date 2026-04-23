---
title: "Basic Shell Commands"
date: 2026-04-23 20:10:40 +0700
categories: [Linux, Shell]
tags: [linux, commands]
math: false
mermaid: false
pin: false
image:
  path: /assets/img/posts/2026-04-23-basic-shell-commands/cover.png
  alt: Linux file permissions example with ls -la output
---

| Lệnh | Gốc tiếng Anh | Ý nghĩa | Ví dụ |
| --- | --- | --- | --- |
| help | help | Tra mô tả, cú pháp, cách dùng của một lệnh cụ thể | `help cd`, `help -d pwd`, `help -s pwd` |
| man | manual | Xem trang hướng dẫn của một lệnh cụ thể | `man ls`, `man echo`, `man pwd` |
| ls | list | Liệt kê file, thư mục | `ls -l`, `ls -a`, `ls -t` |
| mkdir | make directory | Tạo thư mục mới | `mkdir paro` |
| rmdir | remove directory | Xóa thư mục | `rmdir paro` |
| cd | change directory | Chuyển sang thư mục đích | `cd paro`, `cd /`, `cd ~` |
| touch | touch | Tạo file rỗng hoặc cập nhật thời gian sửa đổi file mà không thay đổi nội dung | `touch a.py`, `touch b.ipynb` |
| mv | move | Di chuyển file, thư mục | `mv bao.py bao/` |
| cp | copy | Copy file và thư mục | `cp a.py ~/Documents` |
| find | find | Tìm file, thư mục theo điều kiện | `find /home/usr -name "*.txt"` |
| grep | global regular expression print | Tìm mẫu văn bản trong file hoặc đầu ra lệnh khác | `ls -l \| grep ".txt"` |
| rm | remove | Xóa file, thư mục (có -r) | `rm -r directory`, `rm a.txt` |
| cat | concatenate | In nội dung file ra terminal | `cat glove.py`, `cat glove.py > a.txt` |
| head | head | Xem vài dòng đầu của file | `head glove.py` |
| less | less | In ra nội dung file theo từng trang, phù hợp cho dữ liệu dài | `less /var/log/syslog` |
| clear | clear | Xóa màn hình terminal | `clear` |
| tail | tail | Xem vài dòng cuối, `-f` để xem real-time | `tail -f /var/log/syslog` |
| df | disk free | Xem dung lượng đĩa còn trống | `df -h` |
| du | disk usage | Xem kích thước thư mục | `du -sh /var` |
| history | history | Xem lịch sử lệnh đã chạy | `history` |
| alias | alias | Tạo bí danh cho lệnh dài | `alias ll="ls -la"` |
| ps | process status | Xem tiến trình đang chạy | `ps aux` |
| kill | kill | Kết thúc tiến trình theo PID | `kill <pid>` |
| chmod | change mode | Đổi quyền truy cập thư mục, file | `chmod 755 script.sh` |
| wget/curl | | Tải file hoặc gọi API | `wget https://example.com/file` |
| reboot/shutdown | | Khởi động lại hoặc tắt máy | `sudo shutdown now` |

## Quyền trong Linux

Có 3 quyền: **read**, **write**, **execute**

Có 3 nhóm quyền:
- **user/owner (u)** — chủ sở hữu file
- **group (g)** — nhóm người dùng sở hữu file
- **others (o)** — những người còn lại

Xem quyền của một file hay thư mục: `ls -la`

![Linux file permissions breakdown example showing drwxr-xr-x notation](/assets/img/posts/2026-04-23-basic-shell-commands/image.png)

Chuỗi quyền thường có 10 ký tự, ví dụ:

```
drwxr-xr-x
```

- Ký tự đầu tiên cho biết **loại đối tượng**: `d` là directory, `-` là file thường, `l` là symbolic link.
- 3 ký tự tiếp theo là quyền của **owner**.
- 3 ký tự tiếp theo là quyền của **group**.
- 3 ký tự cuối là quyền của **others**.

### Cú pháp `chmod`

**Dạng ký hiệu:** `chmod [who][+/-/=][rwx] file`

| Ký hiệu | Ý nghĩa |
| --- | --- |
| `+` | Thêm quyền |
| `-` | Bớt quyền |
| `=` | Gán quyền chính xác (xoá quyền cũ, đặt lại) |

Ví dụ:

```bash
chmod u+x script.sh     # thêm quyền thực thi cho owner
chmod g-w file.txt      # rút quyền ghi của group
chmod go=r file.conf    # chỉ cho group và others quyền đọc
```

**Dạng số:** `chmod 755 file` → 7 cho owner, 5 cho group, 5 cho others

| Số | Quyền |
| --- | --- |
| 4 | read (r) |
| 2 | write (w) |
| 1 | execute (x) |

Ví dụ hay gặp:

```bash
chmod 755 file   # toàn quyền cho owner; read + execute cho group và others
chmod 644 file   # read + write cho owner; read cho group và others
chmod 700 file   # chỉ owner có toàn quyền
```
