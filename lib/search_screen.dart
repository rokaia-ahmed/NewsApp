import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit.dart';
import 'package:news_app/NewsCubit.dart';
import 'package:news_app/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var list =NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller:searchController ,
                      validator:
                          (  value){
                        if(value!.isEmpty){
                          return 'search must not be empty ';
                        }
                        return null;
                      } ,
                      onChanged: (value){
                       NewsCubit.get(context).getSearch(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: articleBuilder(list, context,isSearch:true, ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
