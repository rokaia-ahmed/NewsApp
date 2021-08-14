import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit.dart';
import 'package:news_app/search_screen.dart';
import 'NewsCubit.dart';
class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
       builder: (context,state){
         var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(
                onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                      ),
                  );
                },
                icon:Icon(Icons.search),
              ),
              IconButton(
                onPressed:(){
                  NewsCubit.get(context).changeAppMode();
                },
                icon:Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            items:cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.deepOrange,
            elevation: 30.0,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
          ) ,

        );
       },

    );
  }

}
