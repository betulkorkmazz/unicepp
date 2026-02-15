import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0020A1),
        title: const Text(
          "Hakkımda",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _buildLogoHeader(),
            const Text(
              "Hakkında",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 5,
              maxLength: 300,
              decoration: InputDecoration(
                hintText: "Kendinden bahset...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSaveButton(),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Bu alan profilinde görünür. Argo kullanımı kesinlikle yasaktır.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Ortak Bileşenler (Logo, Buton) aşağıda tanımlanmıştır.
  Widget _buildLogoHeader() => Container(
    height: 120,
    width: 120,
    margin: const EdgeInsets.only(bottom: 25),
    decoration: BoxDecoration(
      color: const Color(0xFF0020A1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Icon(Icons.school, color: Colors.white, size: 60),
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
}
