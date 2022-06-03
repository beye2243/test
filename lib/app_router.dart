// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test/presentation/screens/home_screen.dart';
import 'package:test/presentation/screens/otp_screen.dart';
import 'package:test/presentation/screens/personneDetail_Screen.dart';
import 'package:test/presentation/screens/personne_screen.dart';
import 'package:test/presentation/screens/prestation_Screen.dart';
import 'package:test/presentation/screens/solisitaire_screen.dart';


import 'business_logic/cubit/categorie/categories_cubit.dart';
import 'business_logic/cubit/phone_auth/phone_auth_cubit.dart';

import 'constnats/strings.dart';
import 'data/models/catagorie.dart';
import 'data/models/characters.dart';
import 'data/repository/catagorie_repository.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/login_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  late CategoryRepository categoryRepository;
  late CategoryCubit charactersCubit;



  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
    categoryRepository = CategoryRepository();
    charactersCubit = CategoryCubit(categoryRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {


      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: HomeScreen(),
          ),
        );

      case prestation_Screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CategoryCubit(CategoryRepository()),
            child: PresationScreen(),
          ),
        );
      case solisitaire_Screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CategoryCubit(CategoryRepository()),
            child: SolisitaireScreen(),
          ),
        );

      case personne_Screen:
        final categorie = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CategoryCubit(CategoryRepository()),
            child: PersonneScreen(
              categorie: categorie ,
            ),
          ),
        );

      // case personneDetail_Screen:
      //   final categorie = settings.arguments as Category;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) =>
      //           CategoryCubit(CategoryRepository()),
      //       child: PersonneDetailScreen(
      //         categorie: categorie,
      //       ),
      //     ),
      //   );





    }
  }
}
