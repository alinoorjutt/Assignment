import 'package:flutter/material.dart';



class PostTile extends StatelessWidget {
  final String description;
  const PostTile({this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/profile.jpeg'),
          ),
          title: Text('Kristin Jones',style: Theme.of(context).textTheme.headline6,),
          subtitle: Text('20 minutes ago'),
          trailing: Icon(Icons.more_horiz,color: Colors.grey,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.messenger_outline),
                      Text('259')
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Icon(Icons.favorite_border,color: Colors.red,),
                      Text('2359')
                    ],
                  ),
                ],),
              SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              Column(
                children: [
                  Container(width: MediaQuery.of(context).size.width*0.7,
                    child: Text(description),),
                  SizedBox(height: 20,),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('images/demo.jpg',fit: BoxFit.cover,),),),
                  SizedBox(height: 20,),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
