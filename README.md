# 🚀 PyServer

**PyServer** adalah server HTTP ringan berbasis Python3 yang bisa langsung jalan hanya dengan satu perintah. Dirancang untuk kecepatan, kesederhanaan, dan keamanan dasar lewat fitur **Basic Authentication opsional**.

Cocok digunakan untuk:
- Hosting file lokal secara cepat
- Share file di jaringan
- Uji coba aplikasi web
- Keperluan pentesting atau demonstrasi internal

---

## ✨ Fitur

- ⚡ **Instalasi cepat satu baris**
- 🔐 **Opsi Basic Auth (username & password)**
- 🪶 **Tanpa dependensi tambahan** — cukup Python 3
- 📁 **Serving direktori lokal secara otomatis**
- 🛠️ **Konfigurasi fleksibel via command line**

---

## 📦 Instalasi Cepat

Jalankan:

```bash
sudo curl https://raw.githubusercontent.com/andknownmaly/pyserver/refs/heads/main/just_run.sh | bash
````

🧹 Untuk uninstall cepat:

```bash
sudo curl https://raw.githubusercontent.com/andknownmaly/pyserver/refs/heads/main/bye.sh | bash
```

---

## 🔧 Instalasi Manual (All-in-One Setup)

1. Ambil script installer:

```bash
curl https://raw.githubusercontent.com/andknownmaly/pyserver/refs/heads/main/setup.sh > pyser_setup.sh
```

2. Beri izin eksekusi:

```bash
chmod +x pyser_setup.sh
```

3. Jalankan:

```bash
sudo bash pyser_setup.sh
```

---

## 🚀 Menjalankan Server

### Tanpa Autentikasi:

```bash
python3 pyserver.py --port 8080
```

🔗 Akses: [http://localhost:8080](http://localhost:8080)

---

### Dengan Basic Auth:

```bash
python3 pyserver.py --port 9090 --user admin --password rahasia
```

🔐 Saat diakses, browser akan meminta login:

* **Username:** `admin`
* **Password:** `rahasia`

---

## ⚙️ Parameter Lengkap

| Parameter    | Deskripsi                                             | Default |
| ------------ | ----------------------------------------------------- | ------- |
| `--port`     | Port HTTP yang digunakan                              | `8000`  |
| `--user`     | Username untuk Basic Auth (aktif jika password diisi) | `None`  |
| `--password` | Password untuk Basic Auth                             | `None`  |

---

## 🧠 Cara Kerja Singkat

* Jika **username dan password** diberikan, server akan meminta otentikasi Basic.
* Validasi dilakukan dengan mencocokkan header `Authorization` dari browser.
* File akan disajikan dari direktori tempat kamu menjalankan server.

---

## 🤝 Kontribusi

Pull request dan issue sangat diterima!
Jika kamu ingin menambahkan fitur seperti upload, logging, atau UI sederhana — yuk berkontribusi!

---

## 🧑‍💻 Pengembang

Made with Stress by [@andknownmaly](https://github.com/andknownmaly)
