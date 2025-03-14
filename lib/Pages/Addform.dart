import 'package:diary/service/crud_service.dart';
import 'package:flutter/material.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});

  @override
  State<Addform> createState() => _AddformState();
}

List<String> _radioButtonItems = ['Happy', 'Amused', 'Loved' ,'Proud' , 'Confused', 'Stressed'];

class _AddformState extends State<Addform> {
  //databaseApp db = databaseApp();
 
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String _selectedTerm = _radioButtonItems[0];
 
  void handleSubmit(){
    String titlediary = titleController.text;
    String description = descriptionController.text;
    String Feeling = _selectedTerm ;

    addData(titlediary, description, Feeling) ; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 70, 130, 180),
        title: Center(
          child: Text(
            'Diary',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 30 , right: 30),
              child: Column(
                children: [
                  /*Text(
                    'New Post',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),*/
                  SizedBox(height: 20),
                  TextFormField(
                    controller: titleController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'TitleDiary',
                      icon: Icon(Icons.edit),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    //maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      icon: Icon(Icons.format_align_left),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(Icons.add_reaction),
                      SizedBox(width: 15),
                      Text('Feeling'),
                       
                  ],
                  ),
                  SizedBox(height: 10),
                  Column(
                  children: _radioButtonItems.map((String term) {
                    return RadioListTile<String>(
                      title: Text(term),
                      value: term,
                      groupValue: _selectedTerm,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTerm = newValue!;
                        });
                      },
                    );
                  }).toList(),
                ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(255, 246, 207, 93), // สีปุ่ม Question
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                    onPressed: () {
                      handleSubmit();
                      //insert(data);
                      Navigator.pop(context);
                    },
                    child: Text('Post', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
              
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 
  /*void insert(Map input) async {
    postModel data = postModel(
      title: input['title'],
      description: input['description'],
    );
    await db.insertData(data);
  }*/
}
 