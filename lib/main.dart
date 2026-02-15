import 'package:flutter/material.dart';
import 'login_page.dart'; // login_page.dart dosyasını import ediyoruz
import 'register_page.dart';

void main() => runApp(const UniCepApp());

class UniCepApp extends StatelessWidget {
  const UniCepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ÜniCep',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Tasarımındaki ana koyu mavi renk
  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: unicepBlue, // Arka plan rengi
      body: SafeArea(
        child: SingleChildScrollView(
          // Taşma hatasını çözen kaydırma özelliği
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ), // Auto Layout Spacing
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40), // Üstten boşluk
                // 1. ÜniCep Logo ve Yazısı
                Column(
                  children: [
                    const Icon(
                      Icons.school,
                      size: 80,
                      color: Colors.white,
                    ), // Logo ikonu
                    const SizedBox(height: 10),
                    const Text(
                      "ÜniCep",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // 2. Orta İllüstrasyon Alanı
                Container(
                  height: 200, // Boyutu taşmayı önlemek için sabitlendi
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://placeholder.com/illustration',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: const Icon(
                    Icons.people_alt,
                    size: 150,
                    color: Colors.blueAccent,
                  ), // Görsel yerine geçici ikon
                ),

                const SizedBox(height: 60),

                // 3. Giriş Yap Butonu (Component Mantığı)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // LoginDetailsScreen sayfasına yönlendirme
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginDetailsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25), // Butonlar arasındaki ideal boşluk
                // 4. Kayıt Ol Butonu
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // 5. Alt Bilgi
                const Text(
                  "iletisimunicep@gmail.com",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
