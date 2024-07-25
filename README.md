Flutter Admin Paneli

Bu proje, Flutter kullanarak modern bir admin paneli geliştirmeyi amaçlamaktadır. Admin paneli, kullanıcı girişi, tema değişikliği, kullanıcıları inceleme ve günlük verileri alma gibi özelliklere sahiptir.

Özellikler

	•	Kullanıcı Girişi: Kullanıcıların giriş yaparak admin paneline erişim sağlamasına olanak tanır.
	•	Tema Değişikliği: Kullanıcılar, panelin görünümünü değiştirmek için farklı temalar arasında geçiş yapabilir.
	•	Kişileri İnceleme: Yönetici, kayıtlı kullanıcıları inceleyebilir ve yönetebilir.
	•	Günlük Verileri Alma: Sistem günlüklerini görüntüleme ve analiz etme imkanı sunar.

Mimari

Proje, Clean Architecture yaklaşımı ile geliştirilmiştir. Bu, projenin daha sürdürülebilir, test edilebilir ve ölçeklenebilir olmasını sağlar.

Proje Yapısı

	•	core: Diğer projelerde de yeniden kullanılabilecek uygulamaya özgü olmayan kodlar.
	•	feature: Uygulamanın özellik setlerini temsil eder. Her özellik, data, domain ve presentation olmak üzere alt klasörlere ayrılmıştır.
	•	bloc: Durum yönetimi için gerekli olan bloklar ve olaylar.
	•	structure: Uygulamanın genel yapısını ve düzenini belirten dosyalar.
	•	service: Uygulamanın ihtiyaç duyduğu dış hizmetlerle iletişimi sağlar.
	•	view: Kullanıcı arayüzü ile ilgili tüm widgetlar ve ekranlar.

Kullanılan Paketler

	•	Durum Yönetimi
	•	flutter_bloc: Flutter için BLoC durum yönetimi kütüphanesi.
	•	Fonksiyonel Programlama
	•	dartz: Dart için fonksiyonel programlama kütüphanesi.
	•	equatable: Nesnelerin kolayca karşılaştırılması için yardımcı kütüphane.
	•	bloc_concurrency: BLoC için eşzamanlılık destekleri.
	•	Ağ İletişimi ve Depolama
	•	shared_preferences: Basit verilerin kalıcı olarak saklanmasını sağlar.
	•	http: HTTP istekleri için kullanılan kütüphane.
	•	Diğer
	•	cupertino_icons: iOS tarzı ikon seti.
	•	get_it: Bağımlılık enjeksiyonu için kullanılan kütüphane.
	•	intl: Uluslararasılaştırma ve tarih/saat formatlama.
