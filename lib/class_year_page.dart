import 'package:flutter/material.dart';

class ClassYearPage extends StatelessWidget {
  const ClassYearPage({super.key});

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
          "Sınıf / Mezuniyet Yılı",
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
            _buildLogoHeader(),
            const SizedBox(height: 30),

            // Sınıf Seçimi
            _buildDropdownField(
              label: "Sınıf",
              hint: "Sınıfınızı Seçiniz",
              items: [
                "Hazırlık",
                "1. Sınıf",
                "2. Sınıf",
                "3. Sınıf",
                "4. Sınıf",
                "Mezun",
              ],
            ),

            const SizedBox(height: 20),

            // Mezuniyet Yılı Seçimi
            _buildDropdownField(
              label: "Tahmini Mezuniyet Yılı",
              hint: "Yıl Seçiniz",
              items: ["2026", "2027", "2028", "2029", "2030"],
            ),

            const SizedBox(height: 40),

            // Kaydet Butonu
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Akademik bilgileriniz güncellendi!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: unicepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- ORTAK BİLEŞENLER ---
  Widget _buildLogoHeader() => Container(
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

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required List<String> items,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 10),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: items
            .map((val) => DropdownMenuItem(value: val, child: Text(val)))
            .toList(),
        onChanged: (newValue) {},
      ),
    ],
  );

  Widget _buildBottomNav() => BottomNavigationBar(
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
