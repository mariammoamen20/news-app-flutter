import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';
import 'package:news_app_flutter/modules/science/science_screen.dart';
import 'package:news_app_flutter/modules/settings/settings_screen.dart';
import 'package:news_app_flutter/modules/sports/sports_screen.dart';
import 'package:news_app_flutter/shared/network/remote/dio_helper.dart';

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

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  void changeBottomNavBarItem(int index) {
    currentIndex = index;
    if (index == 1) {
      //بجيب الدتا بتاعت السبورت مع الدوسه بتاعت البوتم ناف
      getSportsData();
    }
    if (index == 2) {
      //بجيب الدتا بتاعت السينس مع الدوسه بتاعت البوتم ناف
      getScienceData();
    }
    emit(AppBottomNavigationBarStat());
  }

  //عملت ليست فاضيه وهتتملي بالداتا اللي راجعه
  List<dynamic> business = [];

  void getBusinessData() {
    emit(AppNewsGetBusinessLoadingState());
    if(business.isEmpty){
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '8606b4b05fdb4a99a3e944b172293a8a'
      }).then((value) {
        //هنا انا مليت الليست بالداتا اللي عندي اللي هي ليست بالارتكيلز
        business = value.data['articles'];
        print(business[0]['title']);
        emit(AppNewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(AppNewsGetBusinessErrorState(error.toString()));
      });
    }else {
      emit(AppNewsGetBusinessSuccessState());
    }

  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(AppNewsGetSportsLoadingState());
    //هنا بقوله لو الليست فاضيه روح لملها واعمل ايمت لسكسس
    if (sports.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '8606b4b05fdb4a99a3e944b172293a8a'
      }).then((value) {
        //هنا انا مليت الليست بالداتا اللي عندي اللي هي ليست بالارتكيلز
        sports = value.data['articles'];
        //print(business[0]['title']);
        emit(AppNewsGetSportsSuccessState());
      }).catchError((error) {
        emit(AppNewsGetSportsErrorState(error.toString()));
      });
    }
    //لو مش فاضيه وفيها داتا خلاص روح اعمل امت لسكسس بس متجبش الداتا مره تانيه
    //فا هو اول مره هيدخل في if علشان الليست هتبقى فاضيه بعد كده هيدخل في ال else بس لان الليست اتملت ومبقتش فاضيه
    else {
      emit(AppNewsGetSportsSuccessState());
    }
  }

  List<dynamic> sciences = [];

  void getScienceData() {
    emit(AppNewsGetScienceLoadingState());
    if (sciences.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '8606b4b05fdb4a99a3e944b172293a8a'
      }).then((value) {
        sciences = value.data['articles'];
        emit(AppNewsGetScienceSuccessState());
      }).catchError((error) {
        emit(AppNewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(AppNewsGetScienceSuccessState());
    }
  }
}
