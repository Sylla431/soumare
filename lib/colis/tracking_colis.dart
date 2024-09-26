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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0).r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            
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
                          "En route",
                          style: C.headLineStyle4.copyWith(color: C.textColor2),
                        ),
                        backgroundColor:C.mainColor,
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
                        label: Text("Appeler Modibo",style: C.headLineStyle4.copyWith(color: C.textColor2),),
                        style: ElevatedButton.styleFrom(
                          // primary: C.mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Environ 2 heures",
                    style: C.headLineStyle4,
                  ),
                  SizedBox(height: 16),
                  _buildTimeline(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Expanded(
      child:ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
              iconColor = C.mainColor;
              break;
            default:
              icon = Icons.radio_button_unchecked;
              iconColor = C.mainColor;
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
      ),
    );
  }
}
