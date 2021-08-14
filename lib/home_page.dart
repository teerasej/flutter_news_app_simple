import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/create_news_page.dart';
import 'package:news_app/news_data.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<String> newsItems = ['abc', 'def', 'ghi'];

  Uri webApi = Uri.parse('http://3242504417bb.ngrok.io/news');

  List<NewsData> newsItems = [
    NewsData(id: '1', content: 'abc'),
    NewsData(id: '2', content: 'def'),
    NewsData(id: '3', content: 'ghi')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('click');

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateNewsPage();
            }));
          },
        ),
        body: FutureBuilder(
          future: http.get(webApi),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.hasError) {
              return Text('opps...');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Text('Got data');
            }

            return CircularProgressIndicator();
          },
        )
        // body: ListView.separated(
        //   itemCount: newsItems.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Text(newsItems[index].content),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return Divider();
        //   },
        // )
        );
  }
}
