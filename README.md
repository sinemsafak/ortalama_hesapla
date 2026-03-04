# Ders Ortalama Hesaplama Uygulaması

Bu proje **Flutter** kullanılarak geliştirilmiş basit bir **ders ortalaması hesaplama uygulamasıdır**.
Kullanıcı ders ekleyerek her dersin kredi ve not değerine göre genel ortalamayı hesaplayabilir.

---

#  Uygulama Özellikleri

*  Ders ekleme
*  Otomatik ortalama hesaplama
*  Dersleri sola kaydırarak silme
*  Eklenen ders sayısını gösterme
*  Responsive tasarım (ekran döndüğünde bozulmaz)
*  Ders eklenmediğinde bilgilendirme mesajı

---

#  Uygulama Arayüzü

Uygulamada aşağıdaki bileşenler bulunmaktadır:

* Ortalama gösterim alanı
* Ders ekleme alanı
* Eklenen derslerin listesi
* Kaydırarak silme özelliği

Eğer sistemde hiç ders yoksa ekranda şu mesaj gösterilir:

```
Lütfen ders ekleyiniz
```

---

#  Proje Dosya Yapısı

```
lib
│
├── constants
│   └── app_constants.dart
│
├── helper
│   └── data_helper.dart
│
├── model
│   └── ders.dart
│
├── widgets
│   ├── ortalama_app.dart
│   └── ortalama_goster.dart
│
└── main.dart
```

### Dosyaların Görevleri

**main.dart**
Uygulamanın başlangıç noktasıdır.

**model/ders.dart**
Ders modelini içerir.

**helper/data_helper.dart**
Ortalama hesaplama işlemlerini yapar.

**widgets/ortalama_app.dart**
Ana uygulama ekranını oluşturur.

**widgets/ortalama_goster.dart**
Ortalama ve ders sayısını gösteren widgettır.

---


#  Ortalama Hesaplama Mantığı

Ortalama aşağıdaki formül ile hesaplanır:

```
Ortalama = (Ders Kredisi × Ders Notu) toplamı / Toplam Kredi
```

---

#  Kullanılan Teknolojiler

* Flutter
* Dart
* Material Design

---

#  Uygulamayı Çalıştırma

1️⃣ Flutter kurulu olduğundan emin olun.

2️⃣ Projeyi klonlayın:

```bash
git clone https://github.com/kullaniciadi/ortalama_hesapla.git
```

3️⃣ Proje klasörüne girin:

```bash
cd ortalama_hesapla
```

4️⃣ Gerekli paketleri yükleyin:

```bash
flutter pub get
```

5️⃣ Uygulamayı çalıştırın:

```bash
flutter run
```

---

#  Geliştirici

Bu proje Flutter öğrenme sürecinde geliştirilmiştir.

---

#  Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

---

#  Uygulama Görseli
<img width="335" height="753" alt="Ekran görüntüsü 2026-03-04 121310" src="https://github.com/user-attachments/assets/761794b1-1b1f-45fc-a461-aa2ecaa5b7db" />
