import 'package:flutter/material.dart';

class ClubAnnouncementDetail extends StatelessWidget {
  final String clubName;
  final String title;

  const ClubAnnouncementDetail({
    super.key,
    required this.clubName,
    required this.title,
  });

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: unicepBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Icon(Icons.school, color: Colors.white, size: 30),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.menu, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAdArea(), // Reklam Alanı
            // Kulüp Chip ve Etkileşim Butonları
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  _buildClubChip(clubName),
                  const Spacer(),
                  _buildInteractionButtons(),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ANA AFİŞ ALANI (Positioned hatası burada düzeltildi)
            _buildMainBanner(),

            const SizedBox(height: 20),

            // İÇERİK METNİ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "🔔 İnovasyon Kulübü olarak arayüz tasarımına ilgi duyan tüm öğrenci arkadaşlarımız için özel bir Figma Eğitimi düzenliyoruz!\n\n📌 Bu eğitimde;\n• Figma ile tasarım yapmanın temelleri\n• Wireframe ve prototip oluşturma\n• Mobil uygulama arayüzü oluşturma...",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // BAŞVURU ALANI
            _buildApplicationSection(),

            const SizedBox(height: 25),

            // ALT BİLGİLER
            _buildFooterInfo(),

            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(), // Alt Menü
    );
  }

  // --- COMPONENTLER ---

  Widget _buildMainBanner() {
    return Container(
      width: double.infinity,
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: unicepBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Tasarımdaki Metinler
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "FIGMA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "İLE ARAYÜZ TASARIMI (UI/UX) EĞİTİMİ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // DÜZELTİLMİŞ POSITIONED WIDGET
            Positioned(
              bottom: 10,
              right: 10,
              child: Opacity(
                opacity: 0.2,
                child: Icon(Icons.school, size: 80, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Telefon Numaranı gir...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: unicepBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            ),
            child: const Text(
              "Başvur",
              style: TextStyle(color: unicepBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Diğer yardımcı widgetlar (AdArea, ClubChip, InteractionButtons, FooterInfo, BottomNav)
  // bir önceki tasarımınla aynı şekilde kalabilir.
  Widget _buildAdArea() => Container(
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: const Row(
      children: [
        Icon(Icons.error_outline),
        SizedBox(width: 10),
        Expanded(child: Text("Reklam Alanı", style: TextStyle(fontSize: 11))),
      ],
    ),
  );
  Widget _buildClubChip(String name) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        const Icon(Icons.groups, size: 16, color: unicepBlue),
        const SizedBox(width: 5),
        Text(
          name,
          style: const TextStyle(
            color: unicepBlue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
  Widget _buildInteractionButtons() {
    bool isLiked = false; // Beğeni durumunu takip eden değişken
    int likeCount = 8; // Başlangıç beğeni sayısı

    return StatefulBuilder(
      builder: (context, setLikeState) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                setLikeState(() {
                  isLiked = !isLiked; // Tıklanınca durumu değiştir
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isLiked
                      ? Colors.red.withOpacity(0.1)
                      : Colors.transparent,
                  border: Border.all(
                    color: isLiked ? Colors.red : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: isLiked ? Colors.red : Colors.black87,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${isLiked ? likeCount + 1 : likeCount} Beğeni",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isLiked ? Colors.red : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.share, size: 22, color: Colors.black87),
          ],
        );
      },
    );
  }

  Widget _buildFooterInfo() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 14),
            Text(" Bartın Üniversitesi", style: TextStyle(fontSize: 10)),
          ],
        ),
        Text("2 Haziran 2025, 14:00", style: TextStyle(fontSize: 10)),
        Row(
          children: [
            Icon(Icons.people_outline, size: 14),
            Text(" 18 Kişi Katılıyor", style: TextStyle(fontSize: 10)),
          ],
        ),
      ],
    ),
  );
  Widget _buildBottomNav() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: unicepBlue,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "Başlıklar"),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: "Sohbet",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Duyuru"),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Profil",
      ),
    ],
  );
}
