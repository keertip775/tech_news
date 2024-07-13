
import 'package:ez_snapx/ez_snapx.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_news/controllers/news_controller.dart';
import 'package:tech_news/models/news.dart';
import 'package:tech_news/views/components/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<Article> articles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewsController().getTopHeadlines().then((value) {
      articles = value;
      setState(() {});
    });

 }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Share.share('Download my app');
            },
            icon: Icon(Icons.share),
          )
        ],
        title: Text("Tech news"),
      ),
      body: ListView.builder(
        padding: 16.hp,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              await launch(articles[index].url??"");
              print("hllo");
            },
            child: NewsCard(
            
              title: articles[index].title??"",
              description: articles[index].source?.name??"",
              imageUrl: articles[index].urlToImage??"assets/images/logo.jpg",
            ),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}
