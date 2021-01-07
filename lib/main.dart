import 'package:flutter/material.dart';
import 'package:assignment/exploreScreen.dart';
import 'profileScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          textTheme:TextTheme(
              headline6:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)
          ) ,
          color:Colors.white,

        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        ),
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            RaisedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },child: Text('Profile Screen'),),
            RaisedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExploreScreen()),
              );
            },child: Text('Explore Screen'),),
          ],
        ),
      ),
    );
  }
}

