import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class ConfirmAchat extends StatefulWidget {
  const ConfirmAchat({super.key});

  @override
  State<ConfirmAchat> createState() => _BilletAcheterState();
}
String selectedDate = 'Sep 24, 2024';
String selectedSeat = '16h00';
int ticketCount = 1;
final double ticketPrice = 250000.0;
class _BilletAcheterState extends State<ConfirmAchat> {

  @override
  Widget build(BuildContext context) {
    double totalPrice = ticketPrice * ticketCount;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Acheter des Tickets',style: C.headLineStyle1.copyWith(color: C.textColor2),),
        centerTitle: true,
        backgroundColor: C.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ticket Information
            Text(
              'Ticket pour Tokyo',
              style: C.headLineStyle2
            ),
            SizedBox(height: 10),
            Text(
              'Yogyakarta, Indonesia',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),

            // Date Picker
            _buildDropdownSection('Selectionner une Date', ['Sep 24, 2024', 'Oct 01, 2024', 'Oct 08, 2024'], selectedDate, (value) {
              setState(() {
                selectedDate = value!;
              });
            }),

            20.verticalSpace,

            // Seat Selection
            _buildDropdownSection('Selectionner l\'heure', ['16h00', '20h00', '22h00', '10h00'], selectedSeat, (value) {
              setState(() {
                selectedSeat = value!;
              });
            }),

            SizedBox(height: 20),

            // Ticket Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nombre de Ticket',
                  style: C.headLineStyle3
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: C.mainColor),
                      onPressed: () {
                        setState(() {
                          if (ticketCount > 1) ticketCount--;
                        });
                      },
                    ),
                    Text(
                      '$ticketCount',
                      style: C.headLineStyle3
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle, color: C.mainColor),
                      onPressed: () {
                        setState(() {
                          ticketCount++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),

            // Payment Summary
            Text(
              'Resumer',
              style: C.headLineStyle2
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prix du Ticket', style: C.headLineStyle3),
                Text('${ticketPrice.toStringAsFixed(2)} F', style: C.headLineStyle3),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${totalPrice.toStringAsFixed(2)} F', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),

            Spacer(),

            // Confirm Purchase Button
            ElevatedButton(
              onPressed: () {
                // Perform purchase action here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: C.mainColor,
              ),
              child: Center(
                child: Text(
                  'Confirmer L\'achat - ${totalPrice.toStringAsFixed(2)} F',
                  style: C.headLineStyle2.copyWith(color: C.textColor2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Helper method to build a dropdown section
  Widget _buildDropdownSection(String label, List<String> options, String selectedValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          value: selectedValue,
          icon: Icon(Icons.arrow_downward, color: C.mainColor),
          isExpanded: true,
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
