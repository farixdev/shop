import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /* ---------------------------- FUNCTIONS ---------------------------------*/

  /// Get all orders related to current User
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId == null) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('Orders').where('userId', isEqualTo: userId).get();
      return result.docs.map((document) => OrderModel.fromSnapshot(document)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }

  /// Get all orders for Admin
  Future<List<OrderModel>> fetchAllOrders() async {
    try {
      final result = await _db.collection('Orders').get();
      return result.docs.map((document) => OrderModel.fromSnapshot(document)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  /// Update order status
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      final snapshot = await _db.collection('Orders').where('id', isEqualTo: orderId).get();
      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.update({'status': status.toString()});
      }
    } catch (e) {
      throw 'Something went wrong while updating Order Status. Try again later';
    }
  }
}
