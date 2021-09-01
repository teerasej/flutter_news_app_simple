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
  Uri webApi = Uri.parse('http://c8d8b4dc6a7d.ngrok.io/news');

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

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CreateNewsPage();
              }),
            ).then((value) {
              setState(() {});
            });
          },
        ),
        body: FutureBuilder(
          future: http.get(webApi),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.hasError) {
              return Text('opps... ${snapshot.error.toString()}');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              var jsonFromAPI = snapshot.data?.body as String;
              var newsItems = newsDataFromJson(jsonFromAPI);

              return ListView.separated(
                itemCount: newsItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(newsItems[index].content),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            }

            return Center(child: CircularProgressIndicator());
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
