import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สินค้าทั้งหมด 📝'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: Get.back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            final color = Colors.pink.shade100;
            final iconColor = Colors.pink;

            return AnimatedContainer(
              duration: Duration(milliseconds: 300 + index * 80),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.pink.shade50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: color,
                  child: Icon(
                    Icons.favorite_rounded,
                    size: 28,
                    color: iconColor,
                  ),
                ),
                title: Text(
                  "ชื่อสินค้าที่ ${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
                subtitle: Text(
                  "รายละเอียดสินค้า 💗",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.grey,
                ),
                onTap: () {
                  Get.snackbar(
                    'คุณเลือก',
                    'สินค้าที่ ${index + 1}',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.pinkAccent,
                    colorText: Colors.white,
                    borderRadius: 12,
                    margin: const EdgeInsets.all(12),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
