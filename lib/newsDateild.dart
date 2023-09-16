import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/Utilities/layout_utility.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/utills/class.dart';

class NewsDetails extends StatelessWidget {
  final Articles articles;
  const NewsDetails({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
 DisplayFunction displayFunction = Get.put(DisplayFunction());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                articles.urlToImage.toString()
                //"https://images.pexels.com/photos/404280/pexels-photo-404280.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: newsDetailSection(),
          )
        ],
      ),
    );
  }

  Widget newsDetailSection() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row1(),
          layoutUtils.iconText(Icon(Icons.timer_outlined),
              Text(articles.publishedAt.toString())),
          SizedBox(
            height: 15,
          ),
          Text(
            articles.title.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            child: Divider(
              endIndent: 0,
              color: Colors.grey,
              thickness: 2,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Content',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text('        ' + articles.content.toString()),
              SizedBox(
                height: 15,
              ),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text('        ' + articles.description.toString()),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      articles.author == null
                          ? '+ Add'
                          : articles.author.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
              )
            ],
          ),

          // Expanded(
          //     child: Html(style: {
          //   "p": Style(color: Colors.grey, fontSize: FontSize.larger)
          // }, data: "<p></p>"))
        ],
      ),
    );
  }

  Widget Row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            child: Text(
              articles.source!.name.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              Obx(() =>IconButton(onPressed: () {}, icon: Icon(Icons.mode_night_sharp)),)
              ,
              IconButton(
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark(useMaterial3: true));
                  },
                  icon: Icon(Icons.save_outlined))
            ],
          ),
        )
      ],
    );
  }
}
