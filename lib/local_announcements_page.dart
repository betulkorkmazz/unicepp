import 'package:flutter/material.dart';

class LocalAnnouncementsPage extends StatelessWidget {
  const LocalAnnouncementsPage({super.key});

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
          "Yerel Duyurular",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildLocalEventCard(
            agency: "Bartın Belediyesi",
            title: "Çilek Festivali Başlıyor!",
            date: "31 Mayıs - 5 Haziran 2025",
            imageText: "Kültür Sanat ve\nÇilek Festivali",
            attendees: "18 Kişi Katılıyor",
          ),
          _buildLocalEventCard(
            agency: "Bartın Valiliği",
            title: "Halk Günü Toplantısı",
            date: "10 Haziran 2025, 10:00",
            imageText: "Vatandaşla Buluşma\nToplantıları",
            attendees: "45 Kişi Katılıyor",
          ),
        ],
      ),
    );
  }

  Widget _buildLocalEventCard({
    required String agency,
    required String title,
    required String date,
    required String imageText,
    required String attendees,
  }) {
    bool isLiked = false; // Her kartın kendi beğeni durumu

    return StatefulBuilder(
      builder: (context, setCardState) {
        return Card(
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.account_balance,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  agency,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setCardState(() => isLiked = !isLiked);
                  },
                ),
              ),
              // Büyük Renkli Afiş Alanı
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade100),
                    bottom: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                child: Center(
                  child: Text(
                    imageText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Bartın'da her yıl geleneksel olarak düzenlenen etkinlikler kapsamında bu hafta sonu...",
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    const Divider(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          attendees,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
