import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../utils/Colors.dart';
import 'dart:convert' show utf8;
class AddForm extends StatefulWidget {

  const AddForm( {super.key, });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  String decodeString(String encoded) {
    // Convert the string to a list of UTF-8 encoded bytes
    List<int> bytes = utf8.encode(encoded);

    // Decode the list of UTF-8 encoded bytes back to a string
    return utf8.decode(bytes);

  }
  String replaceUppercaseDiacritics(String input) {
    Map<String, String> diacriticsMap = {
      'À': 'A', 'Á': 'A', 'Â': 'A', 'Ã': 'A', 'Ä': 'A', 'Å': 'A',
      'Ç': 'C',
      'È': 'E', 'É': 'E', 'Ê': 'E', 'Ë': 'E',
      'Ì': 'I', 'Í': 'I', 'Î': 'I', 'Ï': 'I',
      'Ñ': 'N',
      'Ò': 'O', 'Ó': 'O', 'Ô': 'O', 'Õ': 'O', 'Ö': 'O',
      'Ù': 'U', 'Ú': 'U', 'Û': 'U', 'Ü': 'U',
      'Ý': 'Y',
    };

    String result = '';
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if (char == char.toUpperCase() && diacriticsMap.containsKey(char)) {
        result += diacriticsMap[char]!;
      } else {
        result += char;
      }
    }
    return result;
  }
  String encodeString(String originalString) {
    // Encode the original string as UTF-8
    List<int> utf8EncodedBytes = Utf8Encoder().convert(originalString);

    // Convert the UTF-8 encoded bytes to a string
    String utf8EncodedString = String.fromCharCodes(utf8EncodedBytes);

    return utf8EncodedString;
  }
  List<dynamic> selectedImages = [];



  // String removeDiacritics(String str) {
  //   final withDiacritics = 'áàäâãåçéèëêíìïîñóòöôõúùüûýÿ';
  //   final withoutDiacritics = 'aaaaaaceeeeiiiinooooouuuuyy';
  //
  //   for (int i = 0; i < withDiacritics.length; i++) {
  //     str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]);
  //   }
  //
  //   // Replace uppercase accented characters
  //   final withDiacriticsUpper = 'ÁÀÄÂÃÅÇÉÈËÊÍÌÏÎÑÓÒÖÔÕÚÙÜÛÝ';
  //   final withoutDiacriticsUpper = 'AAAAAACEEEEIIIINOOOOOUUUUY';
  //
  //   for (int i = 0; i < withDiacriticsUpper.length; i++) {
  //     str = str.replaceAll(withDiacriticsUpper[i], withoutDiacriticsUpper[i]);
  //   }
  //
  //   return str;
  // }




  // Inscription? inscription;
  TextEditingController loc = TextEditingController();

  // var location = <Location>[];
  List<String> listderoulante=[];

  // getCategorie() async {
  //   try {
  //       var request = http.MultipartRequest('GET', Uri.parse('${Api().url}/getlocation'));
  //
  //       http.StreamedResponse response = await request.send();
  //
  //       if (response.statusCode == 200) {
  //         // Convertir la réponse en chaîne de caractères
  //         String responseString = await response.stream.bytesToString();
  //         print(responseString);
  //         // Analyser la chaîne de caractères JSON
  //         Map<String, dynamic> data = json.decode(responseString);
  //         setState(() {
  //           if (data.containsKey('location')) {
  //             var loc = data['location'];
  //             location = loc
  //                 .map<Location>((json) => Location.fromJson(json))
  //                 .toList();
  //             convertToDropdownList();
  //           }
  //         });
  //       }
  //       else {
  //         print(response.reasonPhrase);
  //       }
  //
  //   } catch (e) {
  //     print(e);
  //   }
  //
  // }
  var now = DateTime.now();
  var formatter = DateFormat('yyyy');

  // convertToDropdownList()async {
  //   setState(() {
  //     listderoulante=location.map((location) => decodeString('${location.wilaya} - ${location.moughataa} - ${location.commune} - ${location.localite}')).toList();
  //   });
  // }

  final FocusNode _focusNode = FocusNode();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // Future<void> saveInscription(Inscription inscription) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Récupérer la liste existante d'inscriptions
  //   String? inscriptionsJsonString = prefs.getString('inscriptions');
  //   List<Inscription> inscriptions = [];
  //
  //   if (inscriptionsJsonString != null) {
  //     List<dynamic> jsonList = json.decode(inscriptionsJsonString);
  //     inscriptions = jsonList.map((json) => Inscription.fromJson(json)).toList();
  //   }
  //
  //   // Ajouter la nouvelle inscription
  //   inscriptions.add(inscription);
  //
  //   // Convertir la liste d'inscriptions en JSON et stocker
  //   String updatedInscriptionsJsonString = json.encode(inscriptions.map((inscription) => inscription.toJson()).toList());
  //   await prefs.setString('inscriptions', updatedInscriptionsJsonString);
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCategorie();
    // Delay the activation of autovalidateMode to avoid initial focus
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(FocusNode());
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _autoValidateMode = AutovalidateMode.onUserInteraction;
        });
      });
    });
    // var decoded = utf8.decode(encoded);
    // print(encodeString('Fièvre jaune'));
  }
  @override
  void dispose() {

    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body:
      // location.isEmpty?Center(
      //     child: LoadingAnimationWidget
      //         .discreteCircle(
      //       color: const Color(0xFF1A1A3F),
      //       secondRingColor: const Color(0xFFEA3799),
      //       thirdRingColor: C.mainColor,
      //       size: 50.sp,
      //     )):
      Padding(
        padding: EdgeInsets.only(right: 16.0,left: 16).w,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    20.verticalSpace,
                    FormBuilderTextField(
                      name: 'nni_prospect',
                      cursorColor: C.mainColor,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // labelText: 'NNI',
                        hintText: 'Numéro d\'identification Nationnal ',
                        label: Row(children: [Text(' NINA',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
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
                        FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                        FormBuilderValidators.minLength( 10, errorText: 'Ce champ doit avoir au moins 10 caractères.'),
                        FormBuilderValidators.maxLength( 10, errorText: 'Ce champ ne peut avoir plus de 10 caractères.'),
                            (val) {
                          if (val != null && int.tryParse(val) != null) {
                            if (int.parse(val) % 97 != 1) {
                              return "Le NNI inséré est incorrect";
                            }
                          }
                          return null;
                        }
                      ]),

                    ),
                    // 20.verticalSpace,
                    // FormBuilderTextField(
                    //   name: 'num_passeport_prospect',
                    //   cursorColor: C.mainColor,
                    //   decoration: InputDecoration(
                    //     labelText: 'Passeport',
                    //     // label:Row(children: [Text(' Passeport',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                    //     hintText: 'Numéro du passeport',
                    //     hintStyle: C.headLineStyle4,
                    //     // focusColor: Colors.pinkAccent,
                    //     labelStyle: C.headLineStyle3,
                    //     // floatingLabelAlignment: FloatingLabelAlignment.center,
                    //     focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1.0, color: Colors.transparent),
                    //         borderRadius:
                    //         BorderRadius.circular(20)),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1.0, color: Colors.transparent),
                    //         borderRadius:
                    //         BorderRadius.circular(20)),
                    //     border: OutlineInputBorder(
                    //         borderRadius:
                    //         BorderRadius.circular(20)),
                    //     errorBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.transparent,
                    //         width: 2,
                    //       ),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.transparent,
                    //         width: 2,
                    //       ),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     filled: true,
                    //     fillColor: C.textColor2,
                    //
                    //   ),
                    //   validator: FormBuilderValidators.compose([
                    //     // FormBuilderValidators.required(
                    //     //     errorText: 'Champ obligatoire'),
                    //         (val) {
                    //       if (_formKey.currentState?.fields['nni_prospect']?.value != null &&
                    //           val != null &&
                    //           _formKey.currentState?.fields['nni_prospect']?.value == val) {
                    //         return "Le numéro de passeport doit être différent du NNI";
                    //       }
                    //       return null;
                    //     }
                    //   ]),
                    //
                    //
                    // ),
                    20.verticalSpace,
                    FormBuilderTextField(
                      name: 'nom_complet_prospect',
                      cursorColor: C.mainColor,
                      decoration: InputDecoration(
                        // labelText: 'Nom et Prénom',
                        label:Row(children: [Text('Nom et Prénom',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                        hintText: 'Nom Complet',
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
                      validator: (valueCandidate) {
                        if (valueCandidate?.isEmpty ?? true) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },

                    ),
                    20.verticalSpace,
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'date_naissance_prospect',
                            cursorColor: C.mainColor,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              // labelText: 'Année Naissance',
                              label:Row(children: [Text('Année ',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                              hintText: 'Année de naissance',
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
                              FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                              FormBuilderValidators.minLength( 4, errorText: 'Minimum 4 chiffres'),
                              FormBuilderValidators.maxLength( 4, errorText: 'Maximun 4 chiffres'),
                              FormBuilderValidators.min(1900, errorText: 'Année non pris en charge'),
                              FormBuilderValidators.max(int.parse(formattedDate), errorText: 'Année invalide'),
                            ]),

                          ),
                        ),

                        20.horizontalSpace,
                        Expanded(
                          child: FormBuilderDropdown(
                            name: 'genre_prospect',
                            borderRadius: BorderRadius.circular(20.r),
                            dropdownColor: C.textColor2,
                            decoration: InputDecoration(
                              // labelText: 'Genre',
                              label:Row(children: [Text('Sexe/Sex',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),

                              // focusColor: Colors.pinkAccent,
                              labelStyle: C.headLineStyle3,
                              // floatingLabelAlignment: FloatingLabelAlignment.center,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: C.textColor),
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
                            items: [
                              DropdownMenuItem(
                                  value: 'feminin', child: Text('F')),
                              DropdownMenuItem(
                                  value: 'masculin', child: Text('M')),

                            ],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText:'Choix obligatoire' ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    20.horizontalSpace,
                    FormBuilderTextField(
                      name: 'nationnaliite',
                      cursorColor: C.mainColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // labelText: 'Année Naissance',
                        label:Row(children: [
                          Text('Nationnalite ',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                        hintText: 'Nationnalite',
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
                        // FormBuilderValidators.minLength( 4, errorText: 'Minimum 4 chiffres'),
                        // FormBuilderValidators.maxLength( 4, errorText: 'Maximun 4 chiffres'),
                        // FormBuilderValidators.min(1900, errorText: 'Année non pris en charge'),
                        // FormBuilderValidators.max(int.parse(formattedDate), errorText: 'Année invalide'),
                      ]),

                    ),





                    20.verticalSpace,
                    FormBuilderTextField(
                      name: 'profession',
                      cursorColor: C.mainColor,
                      decoration: InputDecoration(
                        // labelText: 'Nom et Prénom',
                        label:Row(children: [Text('Occupation/Profession',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                        hintText: 'Occupation',
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
                      validator: (valueCandidate) {
                        if (valueCandidate?.isEmpty ?? true) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },

                    ),
                    20.verticalSpace,
                    FormBuilderTextField(
                      name: 'telephone_prospect',
                      cursorColor: C.mainColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // labelText: 'Télephone',
                        label:Row(children: [Text('Télephone',style: C.headLineStyle3,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                        hintText: 'Numéro de Télephone',
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
                        FormBuilderValidators.numeric(errorText:'Ce champ doit contenir uniquement des chiffres.' ),
                        FormBuilderValidators.minLength( 8, errorText: 'Télephone incorrect'),
                        FormBuilderValidators.maxLength( 8, errorText: 'Télephone incorrect'),

                      ]),

                    ),
                    20.verticalSpace,
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: 'dod',
                            cursorColor: C.mainColor,
                            format: DateFormat("dd-MM-yyyy"),
                                decoration: InputDecoration(
                                // labelText: 'Année Naissance',
                                label:Row(children: [Text('Delivré le ',style: C.headLineStyle3,overflow: TextOverflow.ellipsis,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
                              hintText: 'Date de delivrance',
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

                            ]),

                          ),
                        ),

                        20.horizontalSpace,
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: 'doe',
                            cursorColor: C.mainColor,
                            format: DateFormat("dd-MM-yyyy"),
                            decoration: InputDecoration(
                              // labelText: 'Année Naissance',
                              label:Row(children: [Text('Expire le ',style: C.headLineStyle3,overflow: TextOverflow.ellipsis,),Text(' *',style: C.headLineStyle3.copyWith(color: C.mainColor),)],),
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

                            ]),

                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    selectedImages.isNotEmpty
                        ? Container(
                      height: 200.h,
                      width: 200.h,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                      ),
                      child: Image.file(
                        selectedImages.first, // Display the first selected image
                        fit: BoxFit.cover,
                      ),
                    )
                        : Text('Aucune Image Selectionner'),
                    20.verticalSpace,
                  FormBuilderImagePicker(
                    name: 'images',
                    displayCustomType: (obj) => obj is String ? obj : null, // Handle image display type
                    maxImages: 1, // Number of images allowed to pick
                    onChanged: (val) {
                      setState(() {
                        selectedImages = val?.map((item) => File(item.path)).toList() ?? [];
                      });
                    },
                  ),

                ]),
              ),
              100.verticalSpace,
              Row(
                children: <Widget>[
                  // Expanded(
                  //   child: OutlinedButton(
                  //     onPressed: () {
                  //       _formKey.currentState?.reset();
                  //     },
                  //     // color: Theme.of(context).colorScheme.secondary,
                  //     child: Text(
                  //       'Retour',
                  //       style: TextStyle(
                  //           color: Theme.of(context).colorScheme.secondary),
                  //     ),
                  //   ),
                  // ),
                  // 20.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.black54,
                                  backgroundColor: C.mainColor,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                ),
                      onPressed: () async {
                        // if (_formKey.currentState?.saveAndValidate() ?? false) {
                        //
                        //     var formData = _formKey.currentState?.value;
                        //     // Récupérer les données du formulaire
                        //     var request = http.MultipartRequest('POST', Uri.parse('${Api().url}/inscription'));
                        //     String nom=replaceUppercaseDiacritics(formData?['nom_complet_prospect']);
                        //     print(nom);
                        //     request.fields.addAll({
                        //       'nni_prospect':  formData?['nni_prospect'],
                        //       'num_passeport_prospect': formData?['num_passeport_prospect']??'',
                        //       'nom_complet_prospect': '${encodeString(nom)}',
                        //       'date_naissance_prospect': formData?['date_naissance_prospect'],
                        //       'lieu_naissance_prospect': formData?['lieu_naissance_prospect']??'',
                        //       'genre_prospect': formData?['genre_prospect'],
                        //       'adresse_prospect': formData?['adresse_prospect']??'',
                        //       'telephone_prospect': formData?['telephone_prospect']
                        //     });
                        //
                        //     http.StreamedResponse response = await request.send();
                        //
                        //     if (response.statusCode == 200) {
                        //       // Convertir la réponse en chaîne de caractères
                        //       String responseString = await response.stream.bytesToString();
                        //       // print(responseString);
                        //       // Analyser la chaîne de caractères JSON
                        //       Map<String, dynamic> data = json.decode(responseString);
                        //       if (data.containsKey('data')) {
                        //         var inscriptionData = data['data'];
                        //         inscription =
                        //             Inscription.fromJson(inscriptionData);
                        //       }
                        //       saveInscription(inscription!);
                        //       Navigator.of(context).pop(true);
                        //     }
                        //     else {
                        //       print('++++++++++++${response.reasonPhrase}');
                        //
                        //     }
                        //
                        //
                        // } else {
                        //   debugPrint(_formKey.currentState?.value.toString());
                        //   debugPrint('validation failed');
                        // }
                        // Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        'Enregistrer',
                        style: C.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
