---
title: "Cấu trúc thư mục của Linux"
date: 2026-04-22 21:51:14 +0700
categories: [Linux, foudamentals]
tags: [linux]
math: false
mermaid: false
pin: false
image:
  path: /assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/cover.png
  alt: Cấu trúc thư mục của Linux
---

## Thư mục gốc (/)

Thư mục gốc là thư mục cấp cao nhất; mọi thứ trong Linux (tệp hoặc thư mục) đều nằm dưới (/).

### /bin

- **Tên đầy đủ:** binaries (nhị phân)
- **Hiện tại:** `/bin` là symlink trỏ đến `/usr/bin`
- **Lịch sử:** Trước đây, do dung lượng ổ đĩa nhỏ, không đủ để chứa các mã lệnh nên chúng được chia ra 2 thư mục. Hiện nay dung lượng lớn hơn nên đã được hợp nhất để đơn giản hóa cấu trúc. Tuy vậy, hầu hết ứng dụng vẫn chạy qua `/bin`; việc xóa thư mục này sẽ gây lỗi, nên `/bin` chủ yếu chứa các symlink trỏ đến `/usr/bin`

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image.png)

### /boot

- Chứa Bootloader
- Chứa những gì cần thiết để khởi động máy tính

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%201.png)

### /dev

- **Tên đầy đủ:** devices
- Là nơi chứa các "tệp tin" đại diện cho thiết bị phần cứng (bàn phím, chuột, usb, ...)
- **Cách hoạt động:** Ai đẩy dữ liệu vào tệp đó thì phần cứng sẽ chạy; phần cứng có thay đổi gì thì dữ liệu sẽ trào ra khỏi tệp đó để phần mềm bắt được

### /etc

- **Tên đầy đủ:** Et Cetera (Vân vân)
- Giống ứng dụng Settings hoặc Control Panel trên Windows; thay vì có giao diện nút bấm thì mọi thứ đều là chữ
- **Ví dụ:** `/etc/passwd` và `/etc/shadow` là nơi lưu danh sách toàn bộ người dùng và mật khẩu. Khi gõ mật khẩu để đăng nhập thì hệ thống sẽ vào đây kiểm tra

### /home

- **Tên đầy đủ:** home directory
- Mỗi user sẽ có một thư mục riêng tư ở đây (ví dụ: `/home/paro/Desktop`, `/home/paro/Documents`)

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%202.png)

### /media

- Chứa dữ liệu mà các thiết bị lưu trữ cắm ngoài (USB, ổ cứng, ...)
- Thường chia sẵn các thư mục nhỏ theo tên tài khoản người dùng (ví dụ: `/media/paro/USB`)

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%203.png)

### /mnt

- **Tên đầy đủ:** mount
- Là một mount point tạm thời - nơi dùng để gắn tạm thời các thiết bị lưu trữ hoặc filesystem vào Linux
- **Ví dụ:** gắn ổ đĩa ngoài USB vào Linux
- Không bắt buộc phải mount vào `/mnt`, đây chỉ là quy ước

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%204.png)

### /opt

- **Tên đầy đủ:** option
- Là nơi chứa phần mềm tùy chọn, thường là các ứng dụng không thuộc hệ thống mặc định
- **Sự khác biệt:** 
  - `/usr`: phần mềm do hệ thống quản lý (apt, yum, ...)
  - `/opt`: phần mềm cài thủ công, bên thứ ba

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%205.png)

### /proc

- **Tên đầy đủ:** Process
- Được tạo bởi kernel theo thời gian thực
- Dùng để nhìn và điều khiển hệ thống runtime
- **Ví dụ:**
  - Mỗi số ở đây là một process ID

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%206.png)

- Xem thông tin CPU

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%207.png)

### /run

- Nơi lưu trạng thái tạm thời của hệ thống và service trong lúc máy đang chạy (trên RAM) và mất khi reboot
- Quan trọng khi cần debug service không chạy, kiểm tra socket (Docker, ...)
- **Ví dụ:** Giúp system biết process nào đang chạy

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%208.png)

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%209.png)

### /sbin

- Khá giống với `/bin`
- Trước đây chứa lệnh dành cho Sysadmin như `fdisk`, `mkfs`, `reboot`, `ifconfig`
- Hiện tại là symlink với `/usr/sbin`

### /srv

- **Tên đầy đủ:** service data
- Chứa dữ liệu mà các service (FTP, Git, web, ...) cung cấp ra ngoài

### /tmp

- **Tên đầy đủ:** Temporary
- Lưu file tạm thời, bị xóa sau khi reboot

### /usr

- **Tên đầy đủ:** Unix System Resources
- Chứa phần lớn chương trình, thư viện và dữ liệu (read-only) dùng chung cho hệ thống

### /var

- **Tên đầy đủ:** Variable
- Là "thùng rác có tổ chức" :) và là nơi tốn dung lượng ổ cứng nhiều nhất nếu không quản lý tốt
- Dữ liệu ở đây thay đổi liên tục khi máy hoạt động

---

## Chi tiết thư mục /usr

### /usr/bin

Chứa hầu hết các lệnh thực thi của người dùng: `ls`, `vim`, `cd`, ...

### /usr/lib

- Kho thư viện (.so) để các chương trình chạy được
- Khi chạy một chương trình, nó không tự chứa hết mọi thứ mà sẽ dùng chung các thư viện từ `/usr/lib`

### /usr/sbin

Lệnh quản trị hệ thống

### /usr/local

- Nơi dành cho những phần mềm tự cài thủ công, tách biệt hoàn toàn với phần mềm cho hệ thống quản lý (apt, dnf, yum, ...)
- Dùng khi compile code
- **Ví dụ:** 
  - Tự build một tool C, tạo program → đặt vào `/usr/local/bin/` → hệ thống coi như lệnh chuẩn
  - Có thể override lệnh hệ thống

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%2010.png)

![image.png](/assets/img/posts/2026-04-22-cau-truc-thu-muc-cua-linux/image%2011.png)

---

## Chi tiết thư mục /var

### /var/log

Các tệp log hệ thống:

- **syslog, message:** Ghi lại mọi sự kiện hệ thống
- **auth.log:** Ghi lại những lần đăng nhập thành công hoặc thất bại
- **kern.log:** Log từ kernel (phát hiện lỗi USB, ổ cứng, ...)

> **Tip:** Nếu máy gặp lỗi, vào đây để xem bug

### /var/spool

Spooling (hàng đợi) - nơi lưu trữ dữ liệu đang chờ xử lý:

- `/var/spool/cron/`: Các tác vụ lập lịch của người dùng
- `/var/spool/mail`: Hộp thư nội bộ của hệ thống
- `/var/spool/cups/`: Lệnh in đang chờ máy in

### /var/tmp

- **Tên đầy đủ:** Temporary
- Khác với `/tmp`, dữ liệu ở đây không bị xóa khi khởi động lại máy

### /var/lib

- `/var/lib/docker/`: Images và container
- `/var/lib/mysql/`: Toàn bộ cơ sở dữ liệu MySQL
- Chứa dữ liệu của các ứng dụng hệ thống

### /var/cache

Dữ liệu được cache lại để tăng tốc độ

---

## Chi tiết thư mục /etc

### /etc/passwd

- Liệt kê username, uid, gid, ...
- Không chứa mật khẩu; trường mật khẩu chỉ là chữ `x`

### /etc/shadow

- Chứa hash mật khẩu đã mã hóa và ngày hết hạn
- Chỉ root mới đọc được

### /etc/group

- Danh sách nhóm người dùng
- Xác định ai là thành viên của nhóm

### /etc/sysctl.conf

Tinh chỉnh tham số kernel: bật/tắt IPv6, tăng số lượng kết nối TCP tối đa, ...
