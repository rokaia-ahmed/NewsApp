import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Cubit.dart';
import 'package:news_app/NewsCubit.dart';
import 'package:news_app/NewsLayout.dart';
import 'package:news_app/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
           create:(context)=>NewsCubit()..getBusiness()..getScience()..getSports()..changeAppMode(),
       ),

      ],
      child: BlocConsumer<NewsCubit,NewsState>(
       listener:(context,state){} ,
        builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.white,
             appBarTheme:AppBarTheme(
               titleTextStyle: TextStyle(
                 color:Colors.black ,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
               iconTheme: IconThemeData(
                 color: Colors.black,
               ),
               backwardsCompatibility:false ,
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: Colors.white,
                 statusBarIconBrightness: Brightness.dark,
               ),
               backgroundColor: Colors.white,
               elevation: 0.0,
             ) ,
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange,
               elevation: 20.0,
               backgroundColor:Colors.white ,
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.w600,
                 color: Colors.black,
               ),
             ),
           ),
           darkTheme: ThemeData(
             scaffoldBackgroundColor: HexColor('333739'),
             primarySwatch: Colors.deepOrange,
             appBarTheme:AppBarTheme(
               titleTextStyle: TextStyle(
                 color:Colors.white ,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
               iconTheme: IconThemeData(
                 color: Colors.white,
               ),
               backwardsCompatibility:false ,
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: HexColor('333739'),
                 statusBarIconBrightness: Brightness.light,
               ),
               backgroundColor:HexColor('333739') ,
               elevation: 0.0,
             ) ,
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange,
               unselectedItemColor: Colors.grey,
               elevation: 20.0,
               backgroundColor:HexColor('333739') ,
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.w600,
                 color: Colors.white,
               ),
             ),
           ),
           themeMode: NewsCubit.get(context).isDark? ThemeMode.dark :ThemeMode.light,
           home: NewsLayout(),
         );
        },
      ),
    );
  }
}


