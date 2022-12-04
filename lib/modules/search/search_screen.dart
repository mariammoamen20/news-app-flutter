import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/layout/cubit/cubit.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';

import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
      builder: (context,state){
       var list = NewsCubit.get(context).search;
       return Scaffold(
         appBar: AppBar(),
         body: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               TextFormField(
                 controller: searchController,
                 //مع كل change هروح اعمل search
                 onChanged: (value) {
                   NewsCubit.get(context).getSearchData(value);
                 },
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'Search Must Be Not Empty';
                   }
                 },
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.search),
                   label: Text('Search'),
                 ),
               ),
               Expanded(child: articleBuilder(list)),
             ],
           ),
         ),

       );
      },
    );
  }
}
