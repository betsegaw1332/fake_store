import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteLocalStorage {
  static const String _favoriteKey = 'favorite_products';

  static Future<void> _saveFavoriteProduct(
    List<WishlistProductEntity> items,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = WishlistProductEntity.encode(items);
    await prefs.setString(_favoriteKey, encoded);
  }

  static Future<List<WishlistProductEntity>> getFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_favoriteKey);
    if (data == null) return [];
    return WishlistProductEntity.decode(data);
  }

  static Future<DataState> addRemoveFavoriteProduct({
    required WishlistProductEntity productData,
  }) async {
    try {
      final items = await getFavoriteProducts();

      final index = items.indexWhere((item) => item.id == productData.id);

      if (index >= 0) {
        items.removeWhere((item) => item.id == productData.id);
      } else {
        items.add(productData);
      }

      await _saveFavoriteProduct(items);

      return DataSuccess("favorite success");
    } catch (e) {
      return DataFailed(Exception("Failed to set product favorite"));
    }
  }

  static Future<void> clearFavoriteStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoriteKey);
  }
}
