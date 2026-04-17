# AI Engineer Blog - Chirpy Starter

Đây là bộ blog cá nhân đã cá nhân hóa cho:

- Blog name: **AI Engineer Blog**
- GitHub: **nvbao117**
- Email: **vubaonguyen2809@gmail.com**

## Chạy local

```bash
bundle install
bundle exec jekyll s
```

Mở tại:

```bash
http://127.0.0.1:4000
```

## Deploy GitHub Pages

1. Tạo repo GitHub mới
2. Push toàn bộ source lên branch `main`
3. Vào **Settings → Pages**
4. Chọn **Source = GitHub Actions**
5. Chờ workflow chạy xong

## Nếu dùng repo user site

Repo nên đặt là:

```bash
nvbao117.github.io
```

Khi đó `_config.yml` hiện đã đúng:

```yml
url: "https://nvbao117.github.io"
baseurl: ""
```

## Nếu dùng repo project site

Ví dụ repo tên `ai-engineer-blog` thì sửa lại:

```yml
url: "https://nvbao117.github.io"
baseurl: "/ai-engineer-blog"
```

## Nơi chỉnh nội dung

- `_config.yml`: tên blog, mô tả, avatar
- `_tabs/about.md`: trang giới thiệu
- `_posts/`: bài viết
- `_data/contact.yml`: icon liên hệ sidebar
