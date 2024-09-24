import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/colis/send_colis_form.dart';
import 'package:soumare/colis/tracking_colis.dart';

import '../utils/Colors.dart';

class ShipmentHistoryPage extends StatefulWidget {
  @override
  State<ShipmentHistoryPage> createState() => _ShipmentHistoryPageState();
}

class _ShipmentHistoryPageState extends State<ShipmentHistoryPage> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> shipments = [
    {
      "status": "En cours",
      "statusColor": Colors.green,
      "statusText": "En cours",
      "deliveryId": "#NEJ20089934122231",
      "price": "10 000F",
      "date": "Sep 20, 2023",
      "from": "Segou",
      "image": Icons.inventory,
    },
    {
      "status": "en attente",
      "statusColor": Colors.orange,
      "statusText": "En Attente",
      "deliveryId": "#NEJ20089934122232",
      "price": "100.000F",
      "date": "Sep 20, 2023",
      "from": "Lome",
      "image": Icons.inventory,
    },
    {
      "status": "chargement",
      "statusColor": Colors.blue,
      "statusText": "Chargement",
      "deliveryId": "#NEJ20089934122233",
      "price": "50 000F",
      "date": "Sep 20, 2023",
      "from": "Segou",
      "image": Icons.inventory,
    },
  ];
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Historique des colis",style: C.headLineStyle2,),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              _buildTab("Tout", C.mainColor, 12),
              _buildTab("Livré", C.green, 5),
              _buildTab("En cours", C.green.withOpacity(0.5), 3),
              _buildTab("En Attente", Colors.orange, 4),
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                _buildShipmentListView(),
                _buildShipmentListView(), // Completed (use filtered data)
                _buildShipmentListView(), // In Progress (use filtered data)
                _buildShipmentListView(), // Pending (use filtered data)
              ],
            ),
            Positioned(
              // top: 0,
              bottom: 15.h,
              right: 15.w,
              child: Container(
                width: 250.w,
                child: FloatingActionBubble(// Menu items
                  items: <Bubble>[
                  ],
                  // animation controller
                  animation: _animation,

                  // // On pressed change animation state
                  // onPress: () => _animationController.isCompleted
                  //     ? _animationController.reverse()
                  //     : _animationController.forward(),
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ShippingCalculatorPage();
                    },));
                  },
                  // Floating Action button Icon color
                  iconColor: C.mainColor,
                  // Flaoting Action button Icon
                  iconData: Icons.add,
                  backGroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Tab _buildTab(String label, Color color, int count) {
    return Tab(
      child: Row(
        children: [
          Text(label),
          SizedBox(width: 8.w),
          CircleAvatar(
            backgroundColor: color,
            radius: 10.r,
            child: Text(
              count.toString(),
              style: C.headLineStyle5.copyWith(color: C.textColor2,fontSize: 12.sp)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentListView() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: shipments.length,
      itemBuilder: (context, index) {
        final shipment = shipments[index];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage(),)),
          child: Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                shipment["image"],
                size: 40.0,
              ),
              title: Text(
                "Arrivée aujourd'hui !",
                style: C.headLineStyle4.copyWith(color: C.textColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Votre livraison, ${shipment["deliveryId"]} de ${shipment["from"]}, arrive aujourd'hui !",
                    style: C.headLineStyle5,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        shipment["price"],
                        style: C.headLineStyle5,),
                      SizedBox(width: 8),
                      Text(
                        shipment["date"],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Chip(
                label: Text(
                  shipment["statusText"],
                  style: C.headLineStyle5.copyWith(color: shipment["statusColor"]),
                ),
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
          
                ),
          
              ),
            ),
          ),
        );
      },
    );
  }
}