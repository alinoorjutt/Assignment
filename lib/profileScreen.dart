import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'photoTile.dart';






class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  String userName;
  String imgUrl;
  bool loading=true;
  List<Widget> demoPhotos=[];



  void getData()async{
    http.Response  response = await http.get("https://reqres.in/api/users/2");
    var data =jsonDecode(response.body);
    print(data);
    imgUrl = data['data']['avatar'];
    userName =data['data']['first_name'] + ' ' + data['data']['last_name'];
    for(int i =0;i<10;i++){
     demoPhotos.add( PhotoTile());
    }

setState(() {
        loading=false;
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

        title: Text('Profile'),
          centerTitle: true,
        actions: [
          Icon(Icons.more_horiz,color: Colors.black,)
        ],
      ),
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:imgUrl!=null?NetworkImage(imgUrl,):AssetImage('images/loading.gif',) ,

                ),
              ),],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(userName,style: Theme.of(context).textTheme.headline6,),
                  SizedBox(height: 5,),
                  Text('Must Go faster go gog og oggggoooooo'),
                  Text('Must Go'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 15),
              child: Divider(height: 5,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('221',style: Theme.of(context).textTheme.headline6,),
                    SizedBox(height: 5,),
                    Text('Posts')

                  ],
                ),
                Column(
                  children: [
                    Text('350',style: Theme.of(context).textTheme.headline6,),
                    SizedBox(height: 5,),
                    Text('Following')

                  ],
                ),
                Column(
                  children: [
                    Text('410k',style: Theme.of(context).textTheme.headline6,),
                    SizedBox(height: 5,),
                    Text('Followers')

                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 15),
              child: Divider(height: 5,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(onPressed: (){},
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width *0.40,
                color: Colors.blueAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),

                  ),
                child: Text('Follow'),),
                MaterialButton(onPressed: (){},
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width *0.40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.blueAccent,)
                  ),
                  color: Colors.white,


                child: Text('Message'),),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,20,20.0,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Photos',style: Theme.of(context).textTheme.headline6,),
                  Row(children: [
                    Icon(Icons.menu,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Icon(Icons.dashboard,color: Colors.grey,),
                  ],)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width*0.4,
                childAspectRatio: 2/2.5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              children: demoPhotos,),
            )

          ],
        ),

      ),
    );
  }
}
