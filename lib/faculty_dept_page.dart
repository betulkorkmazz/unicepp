import 'package:flutter/material.dart';

class FacultyDeptPage extends StatelessWidget {
  const FacultyDeptPage({super.key});

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: unicepBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Fakülte / Bölüm",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          children: [
            // 1. Üst ÜniCep Logosu
            _buildLogoHeader(),

            const SizedBox(height: 30),

            // 2. Fakülte Seçim Alanı
            _buildDropdownField(
              label: "Fakülte",
              hint: "Fakülte Seçiniz",
              items: [
                "Mühendislik Fakültesi",
                "Edebiyat Fakültesi",
                "İktisadi ve İdari Bilimler",
              ],
            ),

            const SizedBox(height: 20),

            // 3. Bölüm Seçim Alanı
            _buildDropdownField(
              label: "Bölüm",
              hint: "Bölüm Seçiniz",
              items: [
                "Bilgisayar Mühendisliği",
                "Elektrik-Elektronik",
                "İnşaat Mühendisliği",
              ],
            ),

            const SizedBox(height: 40),

            // 4. Kaydet Butonu
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Kaydetme işlemi burada yapılacak
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Bilgileriniz başarıyla güncellendi!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: unicepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 5. Bilgilendirme Notu
            const Text(
              "Bu bilgiler yalnızca okuduğun kulüp ve topluluklar ile paylaşılır.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ),
      // Profil sekmesinin aktif olduğunu belirtir
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- YARDIMCI BİLEŞENLER ---

  Widget _buildLogoHeader() {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: unicepBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, color: Colors.white, size: 60),
          Text(
            "ÜniCep",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Kampüs artık cebinde",
            style: TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (newValue) {},
        ),
      ],
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
