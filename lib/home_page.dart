import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/services/xyz.dart';
import 'package:newsapp/widget/news_cart_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs.add(tab("All News"));
    tabs.add(tab("Technology"));
    tabs.add(tab("Business"));
    tabs.add(tab("Entertainment"));
    tabs.add(tab("Sports"));
    tabs.add(tab("Helth"));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Zenzzen-News app',
            style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.redAccent,
          ),
          actions: const <Widget>[
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        body: TabBarView(children: [
          NewsScreen(url: 'https://newsapi.org/v2/top-headlines?country=in&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0',),
          NewsScreen(url:'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0' ),
          NewsScreen(url: 'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0'),
          NewsScreen(url: 'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0'),
          NewsScreen(url: 'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0'),
          NewsScreen(url: 'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=312bc0a90c91498ca7fa9315bdbd7fc0'),

        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(HomePage());
            Get.snackbar('Refresh sucessfully', 'news is updated');
          },
          child: Icon(
            Icons.backup_outlined,
            color: Colors.black,
          ),
        ),
        //body: TabBarView(children: tabs.map((model) => NewsScreen()).toList()),
      ),
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
