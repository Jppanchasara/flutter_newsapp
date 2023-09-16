import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newsapp/Utilities/layout_utility.dart';
import 'package:newsapp/contoller/favoriteComtroller.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/newsDateild.dart';
import 'package:newsapp/utills/class.dart';

class NewsCardWidget extends StatelessWidget {
  final Articles articles;

  const NewsCardWidget({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    final DisplayFunction displayFunction = Get.put(DisplayFunction());
    final favoritrController favoritecontroller = Get.put(favoritrController());
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetails(
                            articles: articles,
                          )));
            },
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.network(articles.urlToImage.toString()
                      //"https://images.pexels.com/photos/404280/pexels-photo-404280.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                      ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      articles.source!.name.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.title.toString(),
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    layoutUtils.iconText(
                        Icon(Icons.timer_outlined),
                        Text(
                          articles.publishedAt.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                    Obx(() => InkWell(
                        onTap: () {},
                        child: favoritecontroller.favorite.isTrue
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
