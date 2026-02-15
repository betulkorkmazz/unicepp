import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0020A1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profil Bilgilerini Güncelle",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _buildLogoHeader(),
            _buildInputField("Ad"),
            _buildInputField("Kullanıcı Adı"),
            _buildDropdownField("Cinsiyet"),
            _buildDateField("Doğum Tarihi"),
            _buildInputField("Mail Adresi"),
            const Text(
              "Mail adresini değiştirirseniz öğrenci özellikleriniz kaybolabilir!",
              style: TextStyle(color: Colors.red, fontSize: 11),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildLogoHeader() => Container(
    height: 120,
    width: 120,
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: const Color(0xFF0020A1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.school, color: Colors.white, size: 50),
        Text(
          "ÜniCep",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );

  Widget _buildInputField(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    ),
  );

  Widget _buildDropdownField(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: const [],
      onChanged: (val) {},
    ),
  );

  Widget _buildDateField(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: const OutlineInputBorder(),
      ),
    ),
  );

  Widget _buildSaveButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0020A1),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {},
      child: const Text(
        "Kaydet",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xFF0020A1),
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
