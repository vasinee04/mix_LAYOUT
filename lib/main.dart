import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gallery.dart';
import 'product.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Vasinee App 💖',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.pinkAccent),
        fontFamily: 'ComicSans', // ถ้ามีฟอนต์น่ารัก เพิ่มได้ที่นี่
      ),
      initialRoute: '/', 
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/gallery', page: () => const GalleryPage()),
        GetPage(name: '/product', page: () => const ProductPage()),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _btnController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _btnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _btnController,
      curve: Curves.easeOutBack,
    );
    _btnController.forward();
  }

  @override
  void dispose() {
    _btnController.dispose();
    super.dispose();
  }

  Widget _buildCuteButton({
    required VoidCallback onTap,
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconColor,
  }) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) => _btnController.reverse(),
        onTapUp: (_) {
          _btnController.forward();
          onTap();
        },
        onTapCancel: () => _btnController.forward(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.6),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                bgColor.withOpacity(0.9),
                bgColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: iconColor),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: iconColor,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ใช้ AppBar แบบโปร่งแสงไล่โทนสีชมพูหวาน ๆ
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade200.withOpacity(0.9),
                  Colors.pinkAccent.shade100.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.shade300.withOpacity(0.6),
                  blurRadius: 15,
                  offset: const Offset(0, 7),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'My Lovely App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: 32,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.pinkAccent,
                  )
                ],
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF0F5), Color(0xFFFFC1D9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCuteButton(
                onTap: () => Get.toNamed('/gallery'),
                icon: Icons.image_outlined,
                label: "ไปยังแกลเลอรี่ 🖼️",
                bgColor: Colors.pinkAccent,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 28),
              _buildCuteButton(
                onTap: () => Get.toNamed('/product'),
                icon: Icons.list_alt_rounded,
                label: "ไปยังรายการสินค้า 📋",
                bgColor: Colors.pink.shade400,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
