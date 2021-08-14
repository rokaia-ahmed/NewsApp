import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit.dart';
import 'NewsCubit.dart';
import 'components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,state) {} ,
      builder:(context,state) {
        var list = NewsCubit.get(context).sports ;
        if (list.length >0) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(list[index],context),
              separatorBuilder:(context,index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ) ,
              itemCount: 15);
        } else {
          return Center(child: CircularProgressIndicator() );
        }
      } ,
    ) ;
  }
}
