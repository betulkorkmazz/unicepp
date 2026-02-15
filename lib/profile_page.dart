import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. Üst Kısım: Kapak Fotoğrafı ve Tam Hizalanmış Profil Resmi
          _buildProfileHeader(),

          // Profil resmi dışarı taştığı için altına yeterli boşluk bırakıyoruz
          const SizedBox(height: 60),

          // 2. Kullanıcı Bilgileri
          const Text(
            "Kullanıcı Adı",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Bartın Üniversitesi Öğrencisi",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),

          const SizedBox(height: 20),

          // 3. İstatistikler (Gönderi, Takipçi, Takip)
          _buildStatsRow(),

          const SizedBox(height: 20),

          // 4. Profili Düzenle Butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                child: const Text(
                  "Profili Düzenle",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // 5. İçerik Sekmeleri (Gönderiler / Beğeniler)
          _buildTabbedContent(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none, // Resmin alttan taşabilmesi için şart
      children: [
        // Kapak Fotoğrafı Alanı
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: unicepBlue,
            // Buraya kendi kapak görselini image: DecorationImage ile ekleyebilirsin
          ),
        ),
        // PROFİL RESMİ: Kaymayı önlemek için Positioned ile sabitlendi
        Positioned(
          top: 130, // 180 yüksekliğin 130. biriminde başlayarak aşağı sarkar
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: unicepBlue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: "Gönderi", value: "12"),
        _StatItem(label: "Takipçi", value: "340"),
        _StatItem(label: "Takip", value: "156"),
      ],
    );
  }

  Widget _buildTabbedContent() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: unicepBlue,
            labelColor: unicepBlue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Gönderiler"),
              Tab(text: "Beğeniler"),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                _buildPostList(),
                const Center(child: Text("Henüz bir beğeni yok.")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: const Icon(Icons.image, color: unicepBlue),
          title: Text("Örnek Gönderi ${index + 1}"),
          subtitle: const Text("Bu gönderi profil akışında görünür."),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
