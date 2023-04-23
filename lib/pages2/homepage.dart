import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/pages2/add_class.dart';
import 'package:flutter_add_teacher/pages2/list_class.dart';


class HomePageClass extends StatefulWidget {
  const HomePageClass({ Key? key }) : super(key: key);

  @override
  _HomePageClassState createState() => _HomePageClassState();
}


class _HomePageClassState extends State<HomePageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
        Text('Class List'),
        ElevatedButton(
          onPressed: () => { 
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context)=> AddClassPage(),
              ),
            )
          },
          child:Text('Add', style: TextStyle(fontSize: 20.0)),
          style:ElevatedButton.styleFrom(primary: Colors.deepPurple),
      
          )
        ],
        ),
    ),
    body:ListClassPage()
    );
}
}