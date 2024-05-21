import 'package:e_blood_donor/service/hospital_services/update_stock_service.dart';
import 'package:flutter/material.dart';

class UpdateStockProvider with ChangeNotifier {
  final UpdateStockService _service;
  Map<String, int> _bloodStocks = {};

  UpdateStockProvider({required String hospitalId}) : _service = UpdateStockService(hospitalId: hospitalId);

  Map<String, int> get bloodStocks => _bloodStocks;

  Future<void> fetchBloodStocks() async {
    try {
      _bloodStocks = await _service.getBloodStocks();
      print('Fetched blood stocks: $_bloodStocks');
      notifyListeners();
    } catch (e) {
      print('Error fetching blood stocks in provider: $e');
    }
  }

  Future<void> updateStock(String bloodGroup, int newStock) async {
    try {
      await _service.updateBloodStock(bloodGroup, newStock);
      _bloodStocks[bloodGroup] = newStock;
      notifyListeners();
    } catch (e) {
      print('Error updating stock in provider: $e');
    }
  }
}
