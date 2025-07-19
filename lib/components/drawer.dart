import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'เมนูหลัก',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('หน้าแรก 🌸'),
            onTap: () {
              Navigator.pop(context); // ปิด Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: const Text('แกลเลอรี่ 🌸'),
            onTap: () {
              Navigator.pushNamed(context, '/gallery');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: const Text('รายการสินค้า 🌸'),
            onTap: () {
              Navigator.pushNamed(context, '/product');
            },
          ),
        ],
      ),
    );
  }
}