import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/layout/cubit/cubit.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';
import 'package:news_app_flutter/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //ممكن استخدم الطريقه دي ودي معناها اني هجيب الداتا كلها مره واحد اول اما اعمل رن مش مع دوسه البوتم ناف
      //create: (BuildContext context)=>NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),
      create: (BuildContext context)=>NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text('News App'),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items:cubit.bottomItems ,
              onTap: (index){
                cubit.changeBottomNavBarItem(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },

      ),
    );
  }
}
