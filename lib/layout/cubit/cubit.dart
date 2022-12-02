import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';
import 'package:news_app_flutter/modules/science/science_screen.dart';
import 'package:news_app_flutter/modules/settings/settings_screen.dart';
import 'package:news_app_flutter/modules/sports/sports_screen.dart';

import '../../modules/business/business_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_center_sharp,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_basketball,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings'),
  ];

  List<Widget>screens =const [
    BusinessScreen(),
     SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0 ;
  void changeBottomNavBarItem(int index){
    currentIndex = index;
    emit(AppBottomNavigationBarStat());
  }
}
