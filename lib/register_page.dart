import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: unicepBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const Icon(Icons.school, size: 80, color: Colors.white),
                const Text(
                  "ÜniCep",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Input Componentler
                _buildTextField("E-Posta"),
                const SizedBox(height: 15),
                _buildTextField("Kullanıcı Adı"),
                const SizedBox(height: 15),
                _buildTextField("Şifre", obscureText: true),
                const SizedBox(height: 15),
                _buildTextField("Tekrar Şifre", obscureText: true),
                const SizedBox(height: 15),

                // Dropdown Simülasyonu
                _buildDropdownField("Öğrencilik Durumu"),
                const SizedBox(height: 15),
                _buildDropdownField("Üniversite Seçiniz"),

                const SizedBox(height: 30),

                // Kayıt Ol Butonu
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: unicepBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Kayıt Ol",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "ÜniCep ailesine katılarak üniversite hayatını\npaylaşmaya hemen başla 🎉",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 20),
                const Text(
                  "iletisimunicep@gmail.com",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Ortak Input Tasarımı (Component)
  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Ortak Dropdown Tasarımı (Component)
  Widget _buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hint),
          isExpanded: true,
          items: [], // Buraya seçenekler eklenebilir
          onChanged: (value) {},
        ),
      ),
    );
  }
}
