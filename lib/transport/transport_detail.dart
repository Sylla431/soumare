import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/transport/confirm_achat.dart';

import '../utils/Colors.dart';

class TransportDetail extends StatefulWidget {
  const TransportDetail({super.key});

  @override
  State<TransportDetail> createState() => _TransportDetailState();
}

class _TransportDetailState extends State<TransportDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image and Details Section
            Stack(
              children: [
                Container(
                  height: 0.4.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/jumbo.jpg'), // Add your image here
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 20.w,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {
                      // Favorite action
                    },
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sylla Airline',
                        style:C.headLineStyle1.copyWith(color: C.textColor2)
                      ),
                      Text(
                        'Tokyo',
                        style: C.headLineStyle4.copyWith(color: C.textColor2)
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '250.000F',
                        style: C.headLineStyle2.copyWith(color: C.textColor2)
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      
            // About Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: C.headLineStyle2
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Parangtritis is located around 28 km (17 miles) from Yogyakarta. '
                        'This is the ideal distance to come for a day trip to take a break out of... '
                        'Read more',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
      
                  // Image Carousel
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSmallImage('assets/images/airT.jpg'),
                        _buildSmallImage('assets/images/airT.jpg'),
                        _buildSmallImage('assets/images/airT.jpg'),
                        _buildSmallImage('assets/images/airT.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      
            // Package Facilities
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service en plus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildFacilityIcon(Icons.directions_bus, 'Transport'),
                      20.horizontalSpace,
                      _buildFacilityIcon(Icons.restaurant, 'Dejeuner'),
                    ],
                  ),
                ],
              ),
            ),
      
            // Bottom Button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0).r,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmAchat(),));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: C.mainColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Reserver maintenant - ',
                        style: C.headLineStyle3.copyWith(color: C.textColor2)
                    ),
                    Text(
                      '250.000F',
                      style: C.headLineStyle4.copyWith(color: C.textColor2)
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      
      ),
    );
  }
}
// Helper method to build small images in the carousel
Widget _buildSmallImage(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    ),
  );
}

// Helper method to build facility icons with labels
Widget _buildFacilityIcon(IconData iconData, String label) {
  return Column(
    children: [
      Icon(iconData, size: 40.sp, color: C.mainColor),
      SizedBox(height: 8.h),
      Text(label, style: TextStyle(color: Colors.grey[600])),
    ],
  );
}
