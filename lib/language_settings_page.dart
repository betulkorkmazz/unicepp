import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  static const Color unicepBlue = Color(0xFF0020A1);
  String _selectedLanguage = "Türkçe"; // Varsayılan dil

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: unicepBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Dil Tercihi",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            _buildLogoHeader(),
            const SizedBox(height: 30),

            // Dil Seçenekleri Kartı
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildLanguageOption("Türkçe"),
                  const Divider(height: 1),
                  _buildLanguageOption("English"),
                  const Divider(height: 1),
                  _buildLanguageOption("Deutsch (Demnächst verfügbar)"),
                  const Divider(height: 1),
                  _buildLanguageOption("Français: (Bientôt disponible)"),
                  const Divider(height: 1),
                  _buildLanguageOption("العربية : (قريباً)"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Uygulama arayüzü seçtiğin dile göre otomatik olarak değişecektir",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildLanguageOption(String lang) {
    return RadioListTile<String>(
      title: Text(
        lang,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      value: lang,
      groupValue: _selectedLanguage,
      activeColor: unicepBlue,
      onChanged: (String? value) {
        if (value != null) setState(() => _selectedLanguage = value);
      },
    );
  }

  // LogoHeader ve BottomNav fonksiyonları NotificationSettingsPage ile aynıdır.
  Widget _buildLogoHeader() {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: unicepBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, color: Colors.white, size: 60),
          Text(
            "ÜniCep",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: unicepBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      currentIndex: 4,
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
