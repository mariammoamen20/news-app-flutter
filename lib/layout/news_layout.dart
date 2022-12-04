import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/layout/cubit/cubit.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';
import 'package:news_app_flutter/modules/search/search_screen.dart';
import 'package:news_app_flutter/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text('News App'),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              }, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: (){
               cubit.changeDarkMode();
                print('mode changed');
              }, icon: const Icon(Icons.brightness_4_outlined)),
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

    );
  }
}
