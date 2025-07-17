import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to get orders based on the orderType ('Rush' or 'Reserve')
  Stream<QuerySnapshot> getOrdersByType(String orderType) {
    return orders.where('orderType', isEqualTo: orderType).snapshots();
  }

  Future<void> addToCustomCollection(Map<String, dynamic> cakeItem) async {
    await _db.collection('custom').add({
      'CakeName': cakeItem['CakeName'],
      'addons': cakeItem['addons'],
      'category': cakeItem['category'] ?? 'Custom',
      'description': cakeItem['description'] ?? 'This is a custom cake made with custom ingredients by the user.',
      'imagepath': cakeItem['imagepath'],
      'modelpath': cakeItem['modelpath'] ?? '',
      'price': cakeItem['price'],
    });
  }
}
