import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/pages1/add_students.dart';
import 'package:flutter_add_teacher/pages1/list_students.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
        Text('Students List'),
        ElevatedButton(
          onPressed: () => { 
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context)=>  AddStudentsPage(),
              ),
            )
          },
          child:Text('Add', style: TextStyle(fontSize: 20.0)),
          style:ElevatedButton.styleFrom(primary: Colors.deepPurple),
      
          )
        ],
        ),
    ),
    body:ListStudentsPage(),
    );
}
}