import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SampleDropdown extends StatefulWidget {
  const SampleDropdown({Key? key}) : super(key: key);

  @override
  State<SampleDropdown> createState() => _SampleDropdownState();
}

class _SampleDropdownState extends State<SampleDropdown> {
  List<DropdownMenuItem<int>> _studentsDropDownItems = [
    DropdownMenuItem(child: Text("loading"), value: 0)
  ];
  double physicsMarks = 0.0;
  double chemistryMarks = 0.0;
  double mathsMarks = 0.0;
  double ans = 0.0;

  final TextEditingController _textControllerPhy = new TextEditingController();
  final TextEditingController _textControllerChe = new TextEditingController();
  final TextEditingController _textControllerMat = new TextEditingController();

  var _value = 0;

  get children => null;
  @override
  void initState() {
    fetchStudents();
    super.initState();
  }

  var selectedStudentDocumentId = "";
  List<String> _docIdList = [];

  fetchStudents() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection("students").get();
    List<DropdownMenuItem<int>> _temp = [];
    int i = 0;
    List<String> _tempIdList = [];
    for (var each in qs.docs) {
      _temp.add(DropdownMenuItem(child: Text(each.get("name")), value: i));
      i += 1;
      print(each.id);
      _tempIdList.add(each.id);
    }
    setState(() {
      _studentsDropDownItems = _temp;
    });
    _docIdList = _tempIdList;
  }

  updatemarks(String marks) async {
    FirebaseFirestore.instance
        .collection("students")
        .doc(selectedStudentDocumentId)
        .update({"marks": marks});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Internal Marks"),
        ),
        body: 
         
        Form(
          
          child: ListView(
     
      children: <Widget>[
        new TextFormField(
          controller: _textControllerPhy,
          keyboardType: TextInputType.number,
            decoration: new InputDecoration(
            hintText: 'Enter Physics Marks :',
          ),
        ),new TextField(
          controller: _textControllerChe,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Enter Chemistry Marks :',
          ),
        ),new TextField(
          controller: _textControllerMat,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Enter Maths Marks :',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            
          },
          child: new Text('Calculate '),
        ),
      ],
    )
        ),
     
       
        
      
    );
  }

  

  onStudentSelected(value) {
    selectedStudentDocumentId = _docIdList[value];
    updatemarks(DateTime.now().second.toString());
  }
}
