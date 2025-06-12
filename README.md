## 🛠️ MS Office Mini Yardımcı Tool

Bu proje, Microsoft Office için geliştirilmiş basit ama etkili bir `.bat` (Batch) scriptidir.\
Amaç, sistem yöneticilerinin veya teknik destek ekiplerinin Crackli Office lisanslarını temizlemesi, güncellemeleri kontrol etmesi veya devre dışı bırakması gibi işlemleri hızlı ve kolay bir şekilde yapabilmesini sağlamaktır.

---

### 📆 İçerik ve Özellikler

#### 🔹 1 - Office Crack Kalıntılarını Temizle

- Sistemde yüklü olan Office lisanslarını tespit eder.
- Tüm ürün anahtarlarını (`/unpkey`) kaldırır.
- KMS ya da crack kalıntılarını `/rearm` komutuyla temizler.
- Yeni lisans yüklemeden önce sistemi sıfırlar.
- Uygun Office sürümü kurulu değilse uyarı verir.

---

#### 🔹 2 - Office Güncellemelerini Kapat (Disable Etme)

- Office'in kendi arayüzünden güncelleme kapatma işlemi yapılır.
- Aşağıdaki kayıtlar **Regedit** üzerinden uygulanır:
  ```reg
  HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate
    enableautomaticupdates=0
    hideenabledisableupdates=1
    disablescf=1
  ```
- Bu işlem sonrasında:
  - Office güncelleme yapamaz.
  - Kullanıcılar elle açamaz.
  - Arka planda güncelleme çalışmaz.
- Başarılı veya başarısız işlem sonucuna göre mesaj verir.

---

#### 🔹 3 - Office Güncellemelerini Kapat (127.0.0.1 Yönlendirme)

- Office’in güncelleme sunucusuna erişmesini engellemek için `UpdateChannel` değeri sahte bir adrese yönlendirilir.
  ```reg
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration
    UpdateChannel=http://127.0.0.1
  ```
- Office bir güncelleme olduğunu sanır ama hiçbir şey indirmez.
- Sessiz ve etkili bir yöntemdir.
- Uyarı mesajı verir ve yeniden başlatma önerir.

---

#### 🔹 4 - Office Güncellemelerini Tekrar Aktif Et

- Önceki iki yöntemde yapılan değişiklikleri geri alır.
- Güncellemeler tekrar aktif hale getirilir.
  - Regedit kayıtları silinir veya varsayılan değere çekilir.
  - `UpdateChannel`, Microsoft'un gerçek CDN adresine (`https://officecdn.microsoft.com`) yönlendirilir.
- Başarılı ya da başarısız işlem mesajları gösterilir.

---

### 📌 Gereksinimler

- Windows işletim sistemi (7/8/10/11)
- Microsoft Office 2016 veya üzeri sürüm
- **Yönetici (Administrator)** olarak çalıştırılmalıdır

---

### ⚠️ Uyarılar

- Kayıt defterine (regedit) müdahale edildiği için **yönetici izni gereklidir**.
- Yanlış kullanım sistemde sorunlara neden olabilir. Bilinçli kullanınız.
- Office sürümünüz "Office16" dışında ise ilgili dizinleri değiştirmeniz gerekebilir.

---

### ✍️ İmza

Bu araç, bireysel teknik kullanım için sade bir yardımcı araçtır.\
Kodun sonunda yer alan imza:

```
Sertaç Canbey
```

---

### 🧩 Lisans

Bu proje herhangi bir lisans altında dağıtılmamaktadır. Kişisel veya kurumsal ortamda **kendi sorumluluğunuzda** kullanabilirsiniz.

