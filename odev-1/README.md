# odev-1

Bu ödevde __blog__ veri tabanı ve veritanında __users__, __posts__, __categories__, __comments__ tabloları bulunmaktadır.

- Belirtilen tabloların hepsinde tablo ismine ait id bilgisi __PRIMARY KEY__'dir.
- Tablolar arasında __FOREIGN KEY__ ile referans verilerek ilişki kurulmuştur.
- Veriler [Mockaroo](https://www.mockaroo.com/) sitesinden alınmıştır.


| __users__    | __posts__   | __categories__ | __comments__ |
| ------------ | ----------- | -------------- | ------------ |
|user_id       |post_id      |category_id     |comment_id    |
|username      |user_id      |name            |post_id       |
|email         |category_id  |creation_date   |user_id       |
|creation_date |title        |                |comment       |
|is_active     |content      |                |creation_date |
|              |view_count   |                |is_confirmed  |
|              |creation_date|                |              |
|              |is_published |                |              |



> ### "users" Tablosunda:

- __username__ ve __email__ bilgisi __UNIQUE__ ve __NOT NULL__'dır.
- Minimum 2 kullanıcı bulunmaktadır.


> ### "posts" Tablosunda:

- __title__ bilgisi en fazla 50 karakter alabilmektedir.
- __user__ ve __category__ bilgisi olmadan kayıt yapılamamaktadır.
- Farklı kategorilerde, farklı görüntülenme sayılarında ve farklı
başlıklarda minimum 50 gönderi bulunmaktadır.


> ### "categories" Tablosunda:

- Her bir kategori ismi __UNIQUE__ ve __NOT NULL__'dır.
- Minimum 3 kategori bulunmaktadır.


> ### "comments" Tablosunda:

- __post__ bilgisi olmadan kayıt yapılamamaktadır.
- Tüm yorumların __comment__ bilgisi olmak zorundadır.
- Farklı gönderilere ait, farklı kullanıcılara ait veya kullanıcısı
olmayan toplam minimum 250 yorum bulunmaktadır.
