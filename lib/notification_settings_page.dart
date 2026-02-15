import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  static const Color unicepBlue = Color(0xFF0020A1);

  // Bildirim durumlarını tutan değişkenler
  bool _newMessage = true;
  bool _announcement = true;
  bool _clubEvent = true;
  bool _systemUpdate = false;

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
          "Bildirim Ayarları",
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

            // Bildirim Seçenekleri Kartı
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildNotificationSwitch(
                    "Yeni Mesaj Bildirimi",
                    _newMessage,
                    (val) => setState(() => _newMessage = val),
                  ),
                  const Divider(height: 1),
                  _buildNotificationSwitch(
                    "Duyuru bildirimi",
                    _announcement,
                    (val) => setState(() => _announcement = val),
                  ),
                  const Divider(height: 1),
                  _buildNotificationSwitch(
                    "Kulüp etkinlik bildirimi",
                    _clubEvent,
                    (val) => setState(() => _clubEvent = val),
                  ),
                  const Divider(height: 1),
                  _buildNotificationSwitch(
                    "Sistem güncellemeleri",
                    _systemUpdate,
                    (val) => setState(() => _systemUpdate = val),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Bildirim tercihleriniz anında kaydedilir ve uygulama davranışı buna göre şekillenir",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildNotificationSwitch(
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      value: value,
      activeColor: unicepBlue,
      onChanged: onChanged,
    );
  }

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
