import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class TrackingPage extends StatefulWidget {
  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final List<Map<String, String>> stops = [
    {
      "date": "28 Sept",
      "address": "1901 Thornridge Cir. Shiloh",
      "status": "passé"
    },
    {
      "date": "29 Sept",
      "address": "4140 Parker Rd. Allentown",
      "status": "passé"
    },
    {
      "date": "Maintenant",
      "address": "6391 Elgin St. Celina",
      "status": "actuel"
    },
    {
      "date": "Au 30 Sept",
      "address": "8502 Preston Rd. Inglewood",
      "status": "prochain"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Suivi",
          style: C.headLineStyle2,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // This would be your Map widget (placeholder for now)
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.grey[300], // Placeholder for map background
            child: Center(
              child: Text(
                "Maps",
                style: C.headLineStyle3,
              ),
            ),
          ),
          // Overlay the shipment info over the map
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DS12846758",
                      style: C.headLineStyle3,
                    ),
                    Chip(
                      label: Text(
                        "On the way",
                        style: C.headLineStyle4,
                      ),
                      backgroundColor: Colors.orange,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/driver.png'), // Placeholder for driver's image
                      radius: 25,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Livreur",
                          style: C.headLineStyle4,
                        ),
                        Text(
                          "Modibo Camara",
                          style: C.headLineStyle4,
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Call function here
                      },
                      icon: Icon(Icons.phone),
                      label: Text("Appeler Modibo"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "About 2 hours will come",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 16),
                _buildTimeline(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stops.map((stop) {
        IconData icon;
        Color iconColor;

        switch (stop['status']) {
          case 'passé':
            icon = Icons.check_circle;
            iconColor = Colors.green;
            break;
          case 'actuel':
            icon = Icons.location_on;
            iconColor = Colors.orange;
            break;
          default:
            icon = Icons.radio_button_unchecked;
            iconColor = Colors.grey;
        }

        return ListTile(
          leading: Icon(
            icon,
            color: iconColor,
            size: 30.0,
          ),
          title: Text(
            stop['address']!,
            style: TextStyle(fontSize: 16.0),
          ),
          subtitle: Text(stop['date']!),
        );
      }).toList(),
    );
  }
}
