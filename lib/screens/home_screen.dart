import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Tümü', 'icon': Icons.menu_book, 'color': Colors.brown},
    {'name': 'Sıcak Kahveler', 'icon': Icons.coffee, 'color': Colors.orange},
    {'name': 'Soğuk İçecekler', 'icon': Icons.ac_unit, 'color': Colors.blue},
    {'name': 'Tatlılar', 'icon': Icons.cake, 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barista Pro', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, size: 30),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/cart');
                    setState(() {});
                  },
                ),
                if (CartState.cartItems.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color(0xFFD4A373),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${CartState.cartItems.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hoşgeldiniz,',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text(
                'Günün kahvesini\nseçmeye hazır mısın?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.1),
              ),
              const SizedBox(height: 30),
              
              // Banner Area
              GestureDetector(
                onTap: () {
                  // Tüm ürünlere git
                  Navigator.pushNamed(context, '/product-list', arguments: 'Tümü');
                },
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5E3C), Color(0xFFD4A373)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B5E3C).withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Icon(Icons.coffee, size: 150, color: Colors.white.withOpacity(0.2)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Özel Teklif!',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tüm Tatlılarda\n%20 İndirim',
                              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kategoriler',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/product-list', arguments: 'Tümü'),
                    child: const Text('Tümünü Gör', style: TextStyle(color: Color(0xFF8B5E3C), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Kategoriler Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product-list', arguments: cat['name']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: cat['color'].withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(cat['icon'], color: cat['color'], size: 32),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            cat['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
