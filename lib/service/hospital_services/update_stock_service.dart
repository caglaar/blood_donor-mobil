import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateStockService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String hospitalId;

  UpdateStockService({required this.hospitalId});

  Future<Map<String, int>> getBloodStocks() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('hospitals')
          .where('hospitalId', isEqualTo: hospitalId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('Hospital not found: $hospitalId');
        throw Exception("Hospital not found");
      }

      DocumentSnapshot doc = querySnapshot.docs.first;
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      print('Fetched data: $data');

      return {
        'apStock': data['apStock'] ?? 0,
        'anStock': data['anStock'] ?? 0,
        'bpStock': data['bpStock'] ?? 0,
        'bnStock': data['bnStock'] ?? 0,
        'abpStock': data['abpStock'] ?? 0,
        'abnStock': data['abnStock'] ?? 0,
        'opStock': data['opStock'] ?? 0,
        'onStock': data['onStock'] ?? 0,
      };
    } catch (e) {
      print('Error fetching blood stocks: $e');
      rethrow;
    }
  }

  Future<void> updateBloodStock(String bloodGroup, int newStock) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('hospitals')
          .where('hospitalId', isEqualTo: hospitalId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("Hospital not found");
      }

      DocumentSnapshot doc = querySnapshot.docs.first;

      await _firestore.collection('hospitals').doc(doc.id).update({bloodGroup: newStock});
    } catch (e) {
      print('Error updating blood stock: $e');
      rethrow;
    }
  }
}
