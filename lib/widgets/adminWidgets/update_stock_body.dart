import 'package:e_blood_donor/providers/hospitalProvider/update_stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_blood_donor/models/users_models/admin_model.dart'; // AdminModel sınıfını import ettiğimizden emin olalım

class UpdateStockPage extends StatelessWidget {
  final AdminModel admin;

  UpdateStockPage({required this.admin});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateStockProvider(hospitalId: admin.hospitalId)..fetchBloodStocks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blood Stocks'),
        ),
        body: Consumer<UpdateStockProvider>(
          builder: (context, provider, _) {
            if (provider.bloodStocks.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: provider.bloodStocks.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text('Stock: ${entry.value}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (entry.value > 0) {
                            provider.updateStock(entry.key, entry.value - 1);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          provider.updateStock(entry.key, entry.value + 1);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
