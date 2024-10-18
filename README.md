# PowerShell ile Kullanıcı Yetkilerini Değiştirme

## Kullanım Talimatları:

1. # PowerShell'i Yönetici Olarak Çalıştırın:*
   - PowerShell'i bulun ve "Yönetici olarak çalıştır" seçeneği ile başlatın.

2. # Dizine Geçiş:*
   - Betiğin kayıtlı olduğu dizine gidin:
     
     cd 'Tool_bulunduğu_dizin'
     

3. # Tool Çalıştırma:*
   - Aşağıdaki komutla betiği çalıştırın:
     
     .\yetki.ps1
     

4. # Kullanıcı Adı Değiştirme:*
   - Tool, 'rootayyildiz' adlı kullanıcıyı yönetici yapacaktır. Farklı bir kullanıcı adı eklemek isterseniz, betik içindeki $username değişkenini değiştirin:
     powershell
     $username = "yeni_kullanici_adi"
     

5. # İşlemler:*
   - Tool çalıştırıldığında, kullanıcı yönetici grubuna eklenmeye çalışılır, ayrıcalık yükseltme denemesi yapılır ve belirli bir sistem servisinin başlangıç türü değiştirilir.


