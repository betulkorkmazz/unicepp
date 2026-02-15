import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

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
          "Etkinlikler",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildEventItem(
            "Genel",
            "İstanbul Büyükşehir Belediyesi",
            "180 bin Öğrenciye Burs Ödemesi Tamamlandı.",
            "İstanbul",
          ),
          _buildEventItem(
            "Eğitim",
            "Gençlik ve Spor Bakanlığı",
            "Ücretsiz Yazılım Kampı Başvuruları Başladı!",
            "Türkiye Geneli",
          ),
          _buildEventItem(
            "Etkinlik",
            "Ankara Büyükşehir Belediyesi",
            "Dünya Çevre Günü Bisiklet Turu",
            "Ankara / Mogan",
          ),
          _buildEventItem(
            "Burs",
            "Vakıflar Genel Müdürlüğü",
            "Yükseköğrenim Burs Sonuçları Açıklandı",
            "Ankara",
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(
    String tag,
    String organizer,
    String desc,
    String location,
  ) {
    bool isLiked = false;

    return StatefulBuilder(
      builder: (context, setEventState) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: unicepBlue,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // AKTİF BEĞENİ BUTONU
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setEventState(() => isLiked = !isLiked);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  organizer,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const Spacer(),
                    const Text(
                      "Daha Fazlası İçin >",
                      style: TextStyle(
                        color: unicepBlue,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
