import 'package:flutter/material.dart';
import 'package:news_app/create_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    );
  }
}
