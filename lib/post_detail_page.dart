import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final String userName;
  final String content;

  const PostDetailPage({
    super.key,
    required this.userName,
    required this.content,
  });

  static const Color unicepBlue = Color(0xFF0020A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: unicepBlue,
        elevation: 0,
        title: const Text(
          "Gönderi Detayı",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 1. ANA GÖNDERİ ALANI
          _buildMainPost(),

          // 2. YORUM YAZMA VE GÖNDERME ALANI
          _buildCommentInput(),

          // 3. ETKİLEŞİMLİ YORUMLAR LİSTESİ
          Expanded(
            child: ListView(
              children: [
                CommentItem(
                  user: "Murat Süleymanoğlu",
                  comment: "Ben gelirim!",
                  time: "1 saat önce",
                  likes: 8,
                ),
                CommentItem(
                  user: "Emre Ok",
                  comment: "Beni forvete yaz!",
                  time: "3 saat önce",
                  likes: 5,
                ),
                CommentItem(
                  user: "Berrin Sürücü",
                  comment: "Taraftar olarak oradayım :)",
                  time: "3 saat önce",
                  likes: 12,
                ),
                CommentItem(
                  user: "Betül Korkmaz",
                  comment: "Defansa beni yazabilirsin",
                  time: "5 saat önce",
                  likes: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainPost() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: unicepBlue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "Bartın Üniversitesi Öğrencisi",
                    style: TextStyle(color: unicepBlue, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Text(
                "20:56 | 30 Mayıs 2025",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Spacer(),
              Text(
                "@unicepapp",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(width: 10),
              Text(
                "4 Yorum | 8 Beğeni",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Yorum ekleyin...",
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: unicepBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Gönder", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// YORUMLARIN BEĞENİLEBİLMESİ İÇİN AYRI BİR STATEFUL WIDGET OLUŞTURDUK
class CommentItem extends StatefulWidget {
  final String user;
  final String comment;
  final String time;
  final int likes;

  const CommentItem({
    super.key,
    required this.user,
    required this.comment,
    required this.time,
    required this.likes,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isLiked = false; // Beğeni durumu kontrolü

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 20, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                widget.user,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              const Text(
                "Öğrenci",
                style: TextStyle(color: Color(0xFF0020A1), fontSize: 9),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 5),
            child: Text(widget.comment, style: const TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 12),
            child: Row(
              children: [
                Text(
                  widget.time,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const Spacer(),
                const Icon(Icons.reply, size: 18, color: Colors.black87),
                const SizedBox(width: 4),
                const Text("2", style: TextStyle(fontSize: 12)),
                const SizedBox(width: 15),
                // TIKLANABİLİR KALP İKONU
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked; // Beğeni durumunu değiştir
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: isLiked ? Colors.red : Colors.black87,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${isLiked ? widget.likes + 1 : widget.likes}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
