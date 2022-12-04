import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(articles, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  articles['urlToImage'] ?? "",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      articles['title'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    articles['publishedAt'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget articleBuilder(list) => ConditionalBuilder(
      //ليه بعمل الكوندشن كده ومبعملش الكوندكش على اللودينج علشان لما اللودينج بيدي ايرور بس انه مبيحلقش يجيب الداتا علشان تتعرض
      condition: list.isNotEmpty,
      builder: (BuildContext context) => ListView.separated(
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          itemCount: list.length,
          separatorBuilder: (context, index) => Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              )),
      fallback: (BuildContext context) =>
          const Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
