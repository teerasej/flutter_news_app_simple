import 'package:flutter/material.dart';
import 'package:news_app/create_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> newsItems = ['abc', 'def', 'ghi'];

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
        body: ListView.separated(
          itemCount: newsItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(newsItems[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }
}
