
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/BusinessScreen.dart';
import 'package:news_app/Cubit.dart';
import 'package:news_app/ScienceScreen.dart';
import 'package:news_app/SportsScreen.dart';
import 'dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(icon:
        Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon:
    Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(icon:
    Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
   currentIndex = index;
   if (index==1)
     getSports();
   if (index==2)
     getScience();
   emit(NewsBottomNavState());
  }

  List <dynamic> business =[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apikey':'d8bc302b0f0941e4be8361b807cc45ce'
    }).then((value){
      //print(value.data.toString());
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

}

  List <dynamic> sports =[];

  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'sports',
      'apikey':'d8bc302b0f0941e4be8361b807cc45ce'
    }).then((value){
      //print(value.data.toString());
      sports=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });

  }

  List <dynamic> science =[];

  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'science',
      'apikey':'d8bc302b0f0941e4be8361b807cc45ce'
    }).then((value){
      //print(value.data.toString());
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });

  }

  List <dynamic> search =[];

  void getSearch(value){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/everything', query:{
      'q':'$value',
      'apikey':'d8bc302b0f0941e4be8361b807cc45ce'
    }).then((value){
      //print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }





  bool isDark = false ;
  void changeAppMode(){
  isDark =! isDark ;
  emit(AppChaneModeState());
  }

}