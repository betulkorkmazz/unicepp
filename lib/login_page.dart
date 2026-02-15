import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

// Tasarımındaki ana koyu mavi renk
const Color unicepBlue = Color(0xFF0020A1);

class LoginDetailsScreen extends StatelessWidget {
  const LoginDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: unicepBlue,
      // Geri dönüş butonu için AppBar (Opsiyonel)
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        // Ekran taşmalarını önlemek için
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              // 1. Logo ve Başlık
              const Icon(Icons.school, size: 80, color: Colors.white),
              const Text(
                "ÜniCep",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),

              // 2. Input Alanları (Component Mantığı)
              // E-Posta Alanı
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-Posta',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Şifre Alanı
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 3. Giriş Yap Butonu
              SizedBox(
                width: 150, // Tasarımındaki gibi daha dar bir buton
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: unicepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 4. Kayıt Ol Linki
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesabınız yok mu? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Kayıt Ol sayfasına geçiş
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // 5. Alt İllüstrasyon (Tasarımındaki alt kısım)
              Opacity(
                opacity: 0.8,
                child: Image.network(
                  'https://placeholder.com/bottom_illustration', // Figma'daki alt görselin
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
