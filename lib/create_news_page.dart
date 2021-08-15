import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_data.dart';

class CreateNewsPage extends StatefulWidget {
  const CreateNewsPage({Key? key}) : super(key: key);

  @override
  _CreateNewsPageState createState() => _CreateNewsPageState();
}

class _CreateNewsPageState extends State<CreateNewsPage> {
  TextEditingController newsContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create News'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('เนื้อหาใหม่'),
              TextFormField(
                controller: newsContentController,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    var newsContent = newsContentController.text;
                    print(newsContent);

                    var newsData = {"content": newsContent};
                    var json = jsonEncode(newsData);

                    var url =
                        Uri.parse('http://c8d8b4dc6a7d.ngrok.io/news/create');

                    var response = await http.post(
                      url,
                      headers: {"Content-Type": "application/json"},
                      body: json,
                    );

                    if (response.statusCode == 200) {
                      Navigator.pop(context);
                    } else {
                      print(response.body);
                    }

                    //
                  },
                  child: Text('เพิ่ม'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
