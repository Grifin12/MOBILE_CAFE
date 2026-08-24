import 'dart:convert';
import '../models/product.dart';

// API'den geliyormuş gibi simüle edilen JSON verisi (Gün 4)
const String _jsonString = '''
[
  {
    "id": 1,
    "name": "Caramel Macchiato",
    "description": "Zengin espresso, vanilya şurubu ve karamel sosu ile harmanlanmış sütlü lezzet.",
    "price": 95.0,
    "imageUrl": "assets/images/macchiato.png",
    "category": "Sıcak Kahveler"
  },
  {
    "id": 2,
    "name": "Iced Latte",
    "description": "Buzlu sütün içine yavaşça süzülen taze çekilmiş espresso.",
    "price": 85.0,
    "imageUrl": "assets/images/iced_latte.png",
    "category": "Soğuk İçecekler"
  },
  {
    "id": 3,
    "name": "Filtre Kahve",
    "description": "Özenle kavrulmuş çekirdeklerden taze demlenmiş klasik filtre kahve.",
    "price": 60.0,
    "imageUrl": "assets/images/filtre_kahve.png",
    "category": "Sıcak Kahveler"
  },
  {
    "id": 4,
    "name": "Çilekli Limonata",
    "description": "Taze çilek püresi ve limon suyuyla hazırlanan serinletici içecek.",
    "price": 75.0,
    "imageUrl": "assets/images/limonata.png",
    "category": "Soğuk İçecekler"
  },
  {
    "id": 5,
    "name": "San Sebastian",
    "description": "İçi akışkan, üstü yanık orijinal Bask usulü cheesecake.",
    "price": 120.0,
    "imageUrl": "assets/images/cheesecake.png",
    "category": "Tatlılar"
  }
]
''';

class DataService {
  // JSON string'ini çözüp Product listesine dönüştüren metot
  static List<Product> getProducts() {
    List<dynamic> jsonList = jsonDecode(_jsonString);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}

// Basit State Güncelleme simülasyonu için sepet listesi (Gün 5)
class CartState {
  static List<Product> cartItems = [];
}
