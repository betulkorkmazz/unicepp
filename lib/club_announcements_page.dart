import 'package:flutter/material.dart';
import 'club_announcement_detail.dart'; // Detay sayfası geçişi için gerekli

class ClubAnnouncementsPage extends StatelessWidget {
  const ClubAnnouncementsPage({super.key});

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: unicepBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Kulüp Duyuruları",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.filter_alt_outlined, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          _buildAdArea(), // Reklam/Bilgi Paneli
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _buildClubCard(
                  context,
                  tag: "Eğitim",
                  tagColor: Colors.blue.shade100,
                  date: "2 Haziran 2025, 14:00",
                  clubName: "İnovasyon Kulübü",
                  title: "Figma Eğitimi Düzenliyoruz!",
                  location: "Bartın Üniversitesi Eğitim Fakültesi",
                  attendees: "18 Kişi Katılıyor",
                ),
                _buildClubCard(
                  context,
                  tag: "Gezi",
                  tagColor: Colors.purple.shade100,
                  date: "3 Haziran 2025, 09:00",
                  clubName: "Blockchain Kulübü",
                  title: "BTK Gezisi başvuruları başladı",
                  location: "Ankara",
                  attendees: "92 Kişi Katılıyor",
                ),
                _buildClubCard(
                  context,
                  tag: "Etkinlik",
                  tagColor: Colors.orange.shade100,
                  date: "5 Haziran 2025, 12:00",
                  clubName: "Tiyatro Kulübü",
                  title: "Yeni Oyun Seçmeleri",
                  location: "Bartın Üniversitesi Eğitim Fakültesi",
                  attendees: "55 Kişi Katılıyor",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- ETKİLEŞİMLİ VE YÖNLENDİRMELİ KART BİLEŞENİ ---
  Widget _buildClubCard(
    BuildContext context, {
    required String tag,
    required Color tagColor,
    required String date,
    required String clubName,
    required String title,
    required String location,
    required String attendees,
  }) {
    bool isLiked = false;

    return GestureDetector(
      // KARTA TIKLANINCA DETAY SAYFASINA GİDER
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ClubAnnouncementDetail(clubName: clubName, title: title),
          ),
        );
      },
      child: StatefulBuilder(
        builder: (context, setCardState) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: tagColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      // TIKLANABİLİR KALP İKONU
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : unicepBlue,
                        ),
                        onPressed: () {
                          setCardState(() => isLiked = !isLiked);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: unicepBlue,
                        child: Icon(Icons.groups, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              clubName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(title, style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        attendees,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Daha Fazlası İçin >",
                        style: TextStyle(
                          color: unicepBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
          Icon(Icons.info_outline, size: 30),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              "Reklam Alanı: Kulüp etkinliklerini buradan takip edebilirsiniz.",
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
