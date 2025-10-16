import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartLocalStorage {
  static const String _cartKey = 'cart_items';

  static Future<void> _saveItems(List<CartItemEntity> items) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = CartItemEntity.encode(items);
    await prefs.setString(_cartKey, encoded);
  }

  static Future<List<CartItemEntity>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cartKey);
    if (data == null) return [];
    return CartItemEntity.decode(data);
  }

  static Future<DataState> addOrUpdateItem({
    required CartItemEntity newItem,
  }) async {
    try {
      final items = await getCartItems();

      final index = items.indexWhere((item) => item.id == newItem.id);

      if (index >= 0) {
        items[index].quantity += newItem.quantity;
      } else {
        items.add(newItem);
      }

      await _saveItems(items);

      return DataSuccess("Product added to cart");
    } catch (e) {
      return DataFailed(Exception("Failed to add to cart"));
    }
  }

  static Future<DataState> updateQuantity({
    required int itemId,
    required int newQuantity,
  }) async {
    try {
      final items = await getCartItems();

      final index = items.indexWhere((item) => item.id == itemId);
      if (index == -1) return DataFailed(Exception("Failed to add to cart"));

      items[index].quantity = newQuantity;

      if (newQuantity <= 0) {
        items.removeAt(index);
      }

      await _saveItems(items);

      return DataSuccess("cart updated");
    } catch (e) {
      return DataFailed(Exception("Failed to update cart"));
    }
  }

  static Future<DataState> removeItem({required int itemId}) async {
    try {
      final items = await getCartItems();
      items.removeWhere((item) => item.id == itemId);
      await _saveItems(items);

      return DataSuccess("cart removed");
    } catch (e) {
      return DataFailed(Exception("Failed to remove cart item"));
    }
  }

  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
