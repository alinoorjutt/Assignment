import 'package:flutter/material.dart';

class PhotoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('images/demo.jpg',fit: BoxFit.cover,),),);
  }
}
