# MusteriTakipSistemi

1.	Kısa Sistem Açıklaması
    Restoran sahibinin müşterileri ve siparişleri takip edebilmesi için yapılmış bir sistemdir. 
• Müşteri sipariş verir. 
• Restorana gerekli müşteri ve sipariş bilgileri gider. 
• Sipariş hazırlanır. 
• Kurye ile teslim edilir ve ödeme alınır.


1.1	Sistem Gereksinimlerinin Belirlenmesi
Sistem restoran ve müşteri üzerinde dönmektedir. Müşteri bir menüyü beğenir ve sepete ekler siparişi onaylar. Müşteri ve sipariş bilgileri restorana gelir. Sipariş hazırlanır, teslim edilir ve ödeme alınır.

Kullanıcı gereksinimleri;
1) Sistemi sipariş vermeyi sipariş almayı bilen herkes kullanabilir
2) Kullanıcı sisteme gerekli bilgileri girerek kayıt olur. 
3)Kullanıcı beğendiği menüyü sepetine ekler 
4)Kullanıcı siparişi oluşturur. 
5)Kullanıcı kart bilgilerini girer. 
6)Kullanıcı adres bilgilerini girer.
7)Sipariş isteği restorana gelir.
8)Restoran müşteri bilgilerini kaydeder.
9)Restoran siparişi hazırlar.
10)Kurye ile teslim eder ve ödemeyi alır.


1.2	Ana Kısıtlar
Müşterinin girdiği bilgiler gerçek olmalıdır. Restoran sahibinin restoranı olmalıdır. Müşterinin sipariş için yeterince parası olmalıdır.


1.3	Kavramsal Tasarım
Her restoranın adı, adresi, telefonu numarası, sisteme giriş yapabilmesi için id ve şifresi vardır. Her müşterinin adı, soyadı, adresi, telefon numarası, kredi kartı numarası ve sisteme giriş yapabilmesi için id ve şifresi vardır. Menülerin adı fiyatı kategorisi indirim durumu vardır. Müşteri sepetlerinde menü adı menü adedi ve toplam fiyat bulunmaktadır. Kuryelerin adı vardır ve sepet bilgisi ve müşterinin adres bilgisine sahiptir.


1.4	Potansiyel Sistem Kullanıcıları
Müşteri: Sepetine menü ekler sipariş verir.
Restoran/Restoran sahibi: Müşterinin bilgilerini tutar, gelen siparişleri müşterilere ulaştırır.
