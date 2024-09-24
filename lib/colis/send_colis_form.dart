import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../utils/Colors.dart';

class ShippingCalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregistrer un colis',style: C.headLineStyle2,),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Destination Section
              Text(
                "Destination",
                style: C.headLineStyle4.copyWith(color: C.textColor)
              ),
              16.verticalSpace,
              // Sender location input
              FormBuilderTextField(
                name: 'sender',
                cursorColor: C.mainColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // labelText: 'Télephone',
                  label:Row(children: [Text('Adresse de l\'envoyeur',style: C.headLineStyle3,)],),
                  hintText: 'Adresse de l\'envoyeur',
                  prefixIcon: Icon(Icons.send,color: C.mainColor,),
                  hintStyle: C.headLineStyle4,
                  // focusColor: Colors.pinkAccent,
                  labelStyle: C.headLineStyle3,
                  // floatingLabelAlignment: FloatingLabelAlignment.center,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: C.textColor2,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText:'Champ obligatoire' ),
                  // FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                  // FormBuilderValidators.minLength( 8, errorText: 'Télephone incorrect'),
                  // FormBuilderValidators.maxLength( 8, errorText: 'Télephone incorrect'),

                ]),

              ),
              16.verticalSpace,
              // Receiver location input
              FormBuilderTextField(
                name: 'destination',
                cursorColor: C.mainColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // labelText: 'Télephone',
                  label:Row(children: [Text('Adresse du receveur',style: C.headLineStyle3,)],),
                  hintText: 'Adresse du receveur',
                  prefixIcon: Icon(Icons.location_on,color: C.mainColor,),
                  hintStyle: C.headLineStyle4,
                  // focusColor: Colors.pinkAccent,
                  labelStyle: C.headLineStyle3,
                  // floatingLabelAlignment: FloatingLabelAlignment.center,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: C.textColor2,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText:'Champ obligatoire' ),
                  // FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                  // FormBuilderValidators.minLength( 8, errorText: 'Télephone incorrect'),
                  // FormBuilderValidators.maxLength( 8, errorText: 'Télephone incorrect'),

                ]),

              ),
              16.verticalSpace,
              // Approx weight input
              FormBuilderTextField(
                name: 'poid',
                cursorColor: C.mainColor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // labelText: 'Télephone',
                  label:Row(children: [Text('Poids approximative',style: C.headLineStyle3,)],),
                  hintText: 'Poids du colis',
                  prefixIcon: Icon(Icons.scale,color: C.mainColor,),
                  hintStyle: C.headLineStyle4,
                  // focusColor: Colors.pinkAccent,
                  labelStyle: C.headLineStyle3,
                  // floatingLabelAlignment: FloatingLabelAlignment.center,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: C.textColor2,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText:'Champ obligatoire' ),
                  // FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                  // FormBuilderValidators.minLength( 8, errorText: 'Télephone incorrect'),
                  // FormBuilderValidators.maxLength( 8, errorText: 'Télephone incorrect'),

                ]),

              ),
             32.verticalSpace,
              // Packaging Section
              Text(
                "Packet",
                style: C.headLineStyle4.copyWith(color: C.textColor)
              ),
              8.verticalSpace,
              // Dropdown for packaging
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.inventory),
                ),
                value: "Boite", // Default value
                items: [
                  DropdownMenuItem(value: "Boite", child: Text("Boite",style: C.headLineStyle3,)),
                  DropdownMenuItem(value: "Envelope", child: Text("Envelope",style: C.headLineStyle3,)),
                  // DropdownMenuItem(value: "Crate", child: Text("Crate")),
                ],
                onChanged: (value) {
                  // Handle value change
                },
              ),
              32.verticalSpace,
              // Categories Section
              Text(
                "Categories",
                style: C.headLineStyle4.copyWith(color: C.textColor)
              ),
              SizedBox(height: 8),
              // Grid of categories
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                children: [
                  _buildCategoryChip("Documents"),
                  _buildCategoryChip("Verres"),
                  _buildCategoryChip("Liquide"),
                  _buildCategoryChip("Nourriture"),
                  _buildCategoryChip("Electronique"),
                  _buildCategoryChip("Produit"),
                  _buildCategoryChip("Autres"),
                ],
              ),
              32.verticalSpace,
              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Calculate action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    primary: C.mainColor, // Button color
                  ),
                  child: Text(
                    "Enregistrer",
                    style: C.headLineStyle4.copyWith(color: C.textColor2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return OutlinedButton(
      onPressed: () {
        // Handle chip click
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(label,style: C.headLineStyle4,),
    );
  }
}

