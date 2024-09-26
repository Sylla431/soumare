import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/transport/transport_detail.dart';

import '../utils/Colors.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({super.key});

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  final List<Map<String, String>> surfingSpots = [
    {
      'title': 'Diarra Transport',
      'location': 'Kayes',
      'image': 'assets/images/bus.jpg',
      'date et heure': '20/03/2024 16h00'
      // Add your images in assets
    },
    {
      'title': 'Air Niono',
      'location': 'Tombouctou',
      'image': 'assets/images/bus.jpg',
      'date et heure': '10/02/2024 02h00'
    },
    {
      'title': 'kangala Airline',
      'location': 'Tokyo',
      'image': 'assets/images/airT.jpg',
      'date et heure': '30/12/2024 10h00'
    },
    {
      'title': 'Kangala Airlines',
      'location': 'Afrique du Sud',
      'image': 'assets/images/airT.jpg',
      'date et heure': '20/03/2024 20h00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explorer,\nVoyager, découvrir.',
                    style: C.headLineStyle1
                  ),
                  Image(image: AssetImage('assets/images/transport.png', ), width: 80.w,)
                ],
              ),
              SizedBox(height: 4),
              // Text(
              //   'Best time Mei - Juli',
              //   style: TextStyle(
              //     color: Colors.grey[600],
              //     fontSize: 16,
              //   ),
              // ),
              20.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: surfingSpots.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 16.0).r,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              surfingSpots[index]['image']!,
                              height: 80.w,
                              width: 80.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            surfingSpots[index]['title']!,
                            style: C.headLineStyle2
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(surfingSpots[index]['location']!,style: C.headLineStyle4,),
                              Text(surfingSpots[index]['date et heure']!,style: C.headLineStyle4,),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => TransportDetail(),));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
