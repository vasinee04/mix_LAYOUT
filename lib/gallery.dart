import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = <String>[
      "assets/images/ui1.png",
      "assets/images/ui2.png",
      "assets/images/ui3.png",
      "assets/images/ui4.png",
      "assets/images/ui5.png",
      "assets/images/ui6.png",
      "assets/images/ui7.png",
      "assets/images/ui8.png",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery by Vasinee 💖'),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 205, 222),
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imageList[index], fit: BoxFit.cover),
              );
            },
          ),

          // ปุ่ม Back กว้างเต็มจอ อยู่ชิดล่างสุด มี margin ซ้าย-ขวาเล็กน้อย
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 50, // กำหนดความสูงปุ่ม
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  label: const Text(
                    'กดย้อนกลับ',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
