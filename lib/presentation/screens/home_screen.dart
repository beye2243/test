// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:test/constnats/strings.dart';

import '../../business_logic/cubit/categorie/categories_cubit.dart';
import '../../data/repository/catagorie_repository.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/service2.jpg"),
            fit: BoxFit.cover
          ),

        ),

        child:  Padding(
          padding: const EdgeInsets.only(top: 600),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(

                child: BlocProvider<CategoryCubit>(
                  create: (context) => CategoryCubit(CategoryRepository()),

                  child: ElevatedButton(

                    onPressed: () {
                     // await phoneAuthCubit.logOut();
                     Navigator.of(context).pushNamed(solisitaire_Screen);

                    },
                    child: const Text(
                      'solisitaire de service',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 50),
                      primary: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),

                    ),
                  ),
                ),
              ),
          SizedBox(width: 10,),
          Center(

          child: BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(CategoryRepository()),

            child: ElevatedButton(

              onPressed: () {
                // await phoneAuthCubit.logOut();
                Navigator.of(context).pushNamed(prestation_Screen);

              },
              child: const Text(
                'perstation de service',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(110, 50),
                primary: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),

              ),
            ),
          ),
      )
            ],
          ),
        ),

      ),
    );

  }
}



