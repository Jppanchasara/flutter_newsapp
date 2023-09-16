import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/widget/news_cart_widget.dart';

class NewsScreen extends StatefulWidget {
  String url;
   NewsScreen({required this.url,super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<Newsmodel> getNewsApi() async {
    final response = await http.get(Uri.parse(widget.url));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Newsmodel.fromJson(data);
    } else {
      return Newsmodel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Newsmodel>(
                  future: getNewsApi(),
                  builder: (context, Snapshot) {
                    if (Snapshot.hasData) {
                      return ListView.builder(
                          itemCount: Snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            return NewsCardWidget(
                              articles: Snapshot.data!.articles![index],
                            );
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 5,
                      ));
                    }
                  }))
        ],
      ),
    );
  }
}
