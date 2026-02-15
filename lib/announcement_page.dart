import 'package:flutter/material.dart';
import 'club_announcements_page.dart';
import 'local_announcements_page.dart';
import 'events_page.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold ve AppBar kaldırıldı; home_page'in ana AppBar'ı ile uyumlu çalışması için
    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. Üst Reklam/Bilgilendirme Alanı
          _buildAdArea(),

          const SizedBox(height: 10),

          // 2. Kategori Kartları ve Navigasyon
          _buildCategoryCard(
            context,
            "Kulüp Duyuruları",
            const ClubAnnouncementsPage(),
          ),
          _buildCategoryCard(
            context,
            "Yerel Duyurular",
            const LocalAnnouncementsPage(),
          ),
          _buildCategoryCard(context, "Etkinlikler", const EventsPage()),

          const SizedBox(height: 20),

          // 3. İstatistik Paneli (En Aktif Hesaplar)
          _buildActiveAccountsPanel(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Dinamik Yönlendirme Yapan Kategori Kartı
  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    Widget targetPage,
  ) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            // İlgili kategori sayfasına geçiş yapar
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveAccountsPanel() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20),
              SizedBox(width: 5),
              Text(
                "En Aktif Hesaplar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildActiveInfo(
            "👑 Kulüp: İnovasyon Kulübü",
            "🚩 15 duyuru • 💬 120 yorum",
          ),
          const Divider(),
          _buildActiveInfo(
            "🏛️ Yerel Duyurucu: Bartın Belediyesi",
            "📣 12 duyuru • 👀 890 görüntüleme",
          ),
          const SizedBox(height: 15),
          const Text(
            "Sen de kulübünle duyuru paylaş,\nhaftaya burada yer al!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveInfo(String title, String stats) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          stats,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildAdArea() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Icon(Icons.error_outline, size: 35),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reklam Alanı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Burada işletme reklamları veya kulüp duyuruları olacak",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
