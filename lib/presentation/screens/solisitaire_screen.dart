import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/theme_helper.dart';
import '../widgets/header_widget.dart';

class SolisitaireScreen extends StatefulWidget {
  const SolisitaireScreen({Key? key}) : super(key: key);

  @override
  State<SolisitaireScreen> createState() => _SolisitaireScreenState();
}

class _SolisitaireScreenState extends State<SolisitaireScreen> {
  final _formKey = GlobalKey<FormState>();
  final items = ["Electriciter","plombier","profeseur"];
  String? value ;
  bool checkedValue = false;
  bool checkboxValue = false;

  DropdownMenuItem<String> buildMenuItems(String item ) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontSize:15 ,color: Colors.grey[600] ),
    ),
  ) ;
  void showCarDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    showDialog(
        context: context,
        builder: (BuildContext context) {
      final mobilHeight = MediaQuery.of(context).size.height * 0.25;
      final webHeight = MediaQuery.of(context).size.height * 0.5;
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        children: [
      Container(
      height: kIsWeb ? webHeight : mobilHeight,
        margin: EdgeInsets.all(8.0),
        color: Colors.grey,
        child: kIsWeb
            ? Image(
          image: NetworkImage(_file.path),
          fit: BoxFit.cover,
        )
            : Image(
          image: FileImage(_file),
          fit: BoxFit.cover,
        ),
      ),
        ],
    );
        });
        }


        @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                onPressed: (){
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Nom', 'Entrez votre nom '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(" address E-mail", "Entrez votre Email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "entrez un adresse email valider ";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Telephone",
                                "Entrez votre numro de telephone"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "entrez un numero de telephone email valider";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('localisation', 'Entrez votre localisation '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30.0),
                        Container(

                          height: 50 ,
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey,width:1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:value,
                              isExpanded: true,
                              iconSize: 35,
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                              items: items.map(buildMenuItems).toList() ,
                              onChanged: (value)=> setState(() => this.value = value),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),

                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //       MaterialPageRoute(
                              //           builder: (context) => ProfilePage()
                              //       ),
                              //           (Route<dynamic> route) => false
                              //   );
                              }



                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );




  }
}
