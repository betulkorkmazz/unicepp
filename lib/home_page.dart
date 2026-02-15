import 'package:flutter/material.dart';
import 'post_detail_page.dart';
import 'announcement_page.dart';
import 'profile_page.dart';
import 'profile_settings_page.dart'; // Ayarlar sayfası eklendi

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color unicepBlue = Color(0xFF0020A1);
  int _currentTab = 0; // Alt menü kontrolü
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // Sağdan açılan yan menü
      endDrawer: _buildSideMenu(context),
      appBar: AppBar(
        backgroundColor: unicepBlue,
        leading: IconButton(
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
          onPressed: () => setState(() => _isSearching = !_isSearching),
        ),
        title: _isSearching
            ? const TextField(
                style: TextStyle(color: Colors.white),
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "ÜniCep'te ara...",
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              )
            : const Icon(Icons.school, color: Colors.white, size: 30),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => _showNotifications(context),
          ),
          // Yan menü tetikleyici
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      // Sekmeler arası geçişlerde durumu koruyan yapı
      body: IndexedStack(
        index: _currentTab,
        children: [
          _buildHomeFeed(), // İndeks 0: Akış
          const Center(child: Text("Başlıklar Ekranı")),
          const Center(child: Text("Sohbet Ekranı")),
          const AnnouncementPage(), // İndeks 3: Duyuru Merkezi
          const ProfilePage(), // İndeks 4: Kullanıcı Profili
        ],
      ),
      floatingActionButton: _currentTab == 0
          ? FloatingActionButton(
              backgroundColor: unicepBlue,
              onPressed: () => _showCreatePostModal(context),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            )
          : null,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- YAN MENÜ TASARIMI ---
  Widget _buildSideMenu(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: unicepBlue),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: unicepBlue),
            ),
            accountName: Text(
              "Kullanıcı Adı",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("ogrenci@bartin.edu.tr"),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Profilim"),
            onTap: () {
              Navigator.pop(context);
              setState(() => _currentTab = 4); // Profil sekmesine geç
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Ayarlar"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileSettingsPage(),
                ),
              ); // Ayarlar sayfasına git
            },
          ),
          const Divider(),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("Çıkış Yap", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- ANASAYFA AKIŞI ---
  Widget _buildHomeFeed() {
    return Column(
      children: [
        _buildAdArea(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              _buildTab("Bartın Üniversitesi", true),
              _buildTab("Yerel Gönderiler", false),
              _buildTab("Diğer", false),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildPostCard(
                "Raşit Canbulat",
                "Kampüste birlikte futbol oynayalım mı?",
                12,
                3,
              ),
              _buildPostCard(
                "Murat Süleymanoğlu",
                "Bugünkü öğle yemeği menüsü!",
                8,
                2,
              ),
              _buildPostCard("Mehmet Emre Ök", "ÜniCep muhteşem!", 45, 10),
            ],
          ),
        ),
      ],
    );
  }

  // --- ALT NAVİGASYON ---
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: unicepBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      currentIndex: _currentTab,
      onTap: (index) => setState(() => _currentTab = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Başlıklar"),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Sohbet",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Duyuru"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profil",
        ),
      ],
    );
  }

  // --- ETKİLEŞİMLİ GÖNDERİ KARTI ---
  Widget _buildPostCard(String name, String content, int likes, int comments) {
    bool isLiked = false;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PostDetailPage(userName: name, content: content),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setCardState) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: unicepBlue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () => _showPostOptions(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(content),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () => setCardState(() => isLiked = !isLiked),
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      label: Text("${isLiked ? likes + 1 : likes}"),
                    ),
                    const Icon(Icons.chat_bubble_outline, color: unicepBlue),
                    const Icon(Icons.share_outlined, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- MODALLAR ---
  void _showCreatePostModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Yeni Gönderi Paylaş",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Ne düşünüyorsun?",
                border: InputBorder.none,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Paylaş"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SizedBox(
        height: 300,
        child: Center(child: Text("Bildirimler Yakında!")),
      ),
    );
  }

  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Engelle"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.visibility_off),
            title: const Text("Gizle"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAdArea() => Container(
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: const Row(
      children: [
        Icon(Icons.campaign, color: Colors.orange),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Duyurular burada yer alır.",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
  Widget _buildTab(String label, bool active) => Padding(
    padding: const EdgeInsets.only(left: 10),
    child: ChoiceChip(
      label: Text(label),
      selected: active,
      selectedColor: unicepBlue,
      labelStyle: TextStyle(color: active ? Colors.white : Colors.black),
    ),
  );
}
