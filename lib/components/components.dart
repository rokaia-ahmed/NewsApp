import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/webView_screen.dart';

Widget buildArticleItem( article,context) =>InkWell(
  onTap: (){
    Navigator.push(
        context,
         MaterialPageRoute(
             builder: (context)=> WebViewScreen(article['url'])),
    );
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120.0,
          height:120.0 ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text('${article['title']} ',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder(list,context,{isSearch =false}){
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
    return isSearch ? Container() : Center(child: CircularProgressIndicator() );
  }
}