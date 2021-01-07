import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'postTile.dart';



class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> descriptions=[];
  void getData()async{
    http.Response  response = await http.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> data =jsonDecode(response.body);

    for(var d in data){
    descriptions.add( d['body']);

    }
    setState(() {

    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        title: Text('Explore'),
        centerTitle: true,
        actions: [
          Icon(Icons.search,color: Colors.black,)
        ],
      ),
      body: descriptions.isEmpty?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: descriptions.length,
          itemBuilder:(ctx,i){
            return PostTile(description: descriptions[i],);
          } )
    );
  }
}
