import 'package:flutter/material.dart';
// Sayfa geçişleri için gerekli tüm sayfaları import ediyoruz
import 'update_profile_page.dart';
import 'change_phone_page.dart';
import 'change_password_page.dart';
import 'about_me_page.dart';
import 'faculty_dept_page.dart';
import 'class_year_page.dart';
import 'notification_settings_page.dart';
import 'language_settings_page.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: unicepBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profil Ayarları",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          // 1. Hesap Bilgileri Kategorisi
          _buildSettingsSection(context, "Hesap Bilgileri", [
            "Profil Bilgilerini Güncelle",
            "Telefon Numarası Değiştir",
            "Şifreni Değiştir",
          ]),

          // 2. Kullanıcı Bilgileri Kategorisi
          _buildSettingsSection(context, "Kullanıcı Bilgileri", [
            "Hakkımda",
            "Fakülte / Bölüm",
            "Sınıf / Mezuniyet Yılı",
          ]),

          // 3. Tercihler Kategorisi
          _buildSettingsSection(context, "Tercihler", [
            "Bildirim Ayarları",
            "Dil Seçimi",
            "Doğrulanmış Hesap",
          ]),

          // 4. Gizlilik ve Güvenlik Kategorisi
          _buildSettingsSection(context, "Gizlilik ve Güvenlik", [
            "Profil Gizlilik Ayarları",
            "Engellenen Kullanıcılar",
            "Hesabı Dondur / Sil",
          ]),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Dinamik Kategori ve Liste Yapısı
  Widget _buildSettingsSection(
    BuildContext context,
    String sectionTitle,
    List<String> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 8, top: 10),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              int idx = entry.key;
              String text = entry.value;
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 22,
                      color: Colors.grey,
                    ),
                    onTap: () =>
                        _navigate(context, text), // Dinamik Yönlendirme
                  ),
                  if (idx != items.length - 1)
                    Divider(
                      height: 1,
                      color: Colors.grey.shade200,
                      indent: 15,
                      endIndent: 15,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  // Merkezi Navigasyon Mantığı
  void _navigate(BuildContext context, String target) {
    Widget? page;
    switch (target) {
      case "Profil Bilgilerini Güncelle":
        page = const UpdateProfilePage();
        break;
      case "Telefon Numarası Değiştir":
        page = const ChangePhonePage();
        break;
      case "Şifreni Değiştir":
        page = const ChangePasswordPage();
        break;
      case "Hakkımda":
        page = const AboutMePage();
        break;
      case "Fakülte / Bölüm":
        page = const FacultyDeptPage();
        break;
      case "Sınıf / Mezuniyet Yılı":
        page = const ClassYearPage();
        break;
      case "Bildirim Ayarları":
        page = const NotificationSettingsPage();
        break;
      case "Dil Seçimi":
        page = const LanguageSettingsPage();
        break;
    }

    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
    }
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: unicepBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      currentIndex: 4, // Profil sekmesi aktif olduğu için 4
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Başlıklar"),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Sohbet",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Duyuru"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}
