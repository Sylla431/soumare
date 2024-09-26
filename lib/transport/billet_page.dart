import 'package:flutter/material.dart';

import '../utils/Colors.dart';

class BilletAcheter extends StatefulWidget {
  @override
  State<BilletAcheter> createState() => _BilletAcheterState();
}

class _BilletAcheterState extends State<BilletAcheter> {
  final List<Map<String, dynamic>> parcels = [
    {
      'id': '#KA08J9192',
      'from': 'Mali',
      'to': 'Tokyo',
      'status': 'Valide',
      'eta': '25 Mar 2024',
      'color': C.green,
      'qte':'x2'
    },
    {
      'id': '#KA0898192',
      'from': 'Segou',
      'to': 'Bamako',
      'status': 'Expirer',
      'eta': '05 Mar 2024',
      'color': C.mainColor,
      'qte':'x2'
    },
    {
      'id': '#GWQ8J9192',
      'from': 'India',
      'to': 'Canada',
      'status': 'Expirer',
      'eta': '28 Feb 2024',
      'color': C.mainColor,
      'qte':'x1'
    },
    {
      'id': '#W8U8J9145',
      'from': 'Canada',
      'to': 'Dubai',
      'status': 'Expirer',
      'eta': '28 Jan 2024',
      'color': C.mainColor,
      'qte':'x1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle:  C.headLineStyle2,
            labelColor: C.mainColor,
            tabs: [
              Tab(text: 'Tout'),
              Tab(text: 'Valide'),
              Tab(text: 'Expirer'),
            ],
            indicatorColor: Colors.yellow,
          ),
        ),
        body: TabBarView(
          children: [
            buildParcelList(),
            buildParcelList(statusFilter: 'Valide'),
            buildParcelList(statusFilter: 'Expirer'),
          ],
        ),
      ),
    );
  }

  // Builds a list of parcels with an optional filter for status
  Widget buildParcelList({String? statusFilter}) {
    List<Map<String, dynamic>> filteredParcels = statusFilter != null
        ? parcels.where((parcel) => parcel['status'] == statusFilter).toList()
        : parcels;

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: filteredParcels.length,
      itemBuilder: (context, index) {
        final parcel = filteredParcels[index];
        return ParcelCard(
          parcelId: parcel['id'],
          from: parcel['from'],
          to: parcel['to'],
          status: parcel['status'],
          eta: parcel['eta'],
          color: parcel['color'],
          qte: parcel['qte'],
        );
      },
    );
  }
}

class ParcelCard extends StatelessWidget {
  final String parcelId;
  final String from;
  final String to;
  final String status;
  final String eta;
  final String qte;
  final Color color;

  ParcelCard({
    required this.parcelId,
    required this.from,
    required this.to,
    required this.status,
    required this.eta,
    required this.color, required this.qte,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parcelId,
                style: C.headLineStyle4.copyWith(color: C.textColor2)
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$from → $to',
                    style: C.headLineStyle5.copyWith(color: C.textColor2)
                ),
                Text('Quantité $qte',style: C.headLineStyle4.copyWith(color: C.textColor2),)
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: $status',
                    style: C.headLineStyle5.copyWith(color: C.textColor2)
                ),
                Text(
                  'Date: $eta',
                    style: C.headLineStyle5.copyWith(color: C.textColor2)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
