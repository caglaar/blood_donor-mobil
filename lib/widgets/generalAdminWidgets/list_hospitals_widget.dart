import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListHospitals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('hospitals').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hospitals found'));
          }

          final hospitals = snapshot.data!.docs;

          return ListView.builder(
            itemCount: hospitals.length,
            itemBuilder: (context, index) {
              final hospital = hospitals[index];
              final hospitalId = hospital['hospitalId'];

              return ListTile(
                title: Text(hospital['name']),
                onTap: () {
                  Navigator.pop(context, hospitalId);
                },
              );
            },
          );
        },
      ),
    );
  }
}
