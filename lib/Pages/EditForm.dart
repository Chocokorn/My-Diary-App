import 'package:diary/service/crud_service.dart';
import 'package:flutter/material.dart';

class Editform extends StatefulWidget {
  // update post
  final String doc_id;
  final String title;
  final String feeling;

  Editform({
    required this.title,
    required this.feeling,
    required this.doc_id
  });

  @override
  State<Editform> createState() => _EditformState();
}

List<String> _radioButtonItems = [
  'Happy',
  'Amused',
  'Loved',
  'Proud',
  'Confused',
  'Stressed'
];

int findIndex(String old) {
  int index = 0;

  while (true) {
    if (_radioButtonItems[index] == old) {
      return index;
    }
    index++;
  }
}

class _EditformState extends State<Editform> {
  final descriptionController = TextEditingController();
  late TextEditingController titleController;
  late String _selectedTerm;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    _selectedTerm = widget.feeling; // กำหนดค่าเริ่มต้นของ feeling
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: widget.title);
 

    void handleSubmit() {
      // String titlediary = titleController.text;
      String description = descriptionController.text;
      String Feeling = _selectedTerm;

      updateData(widget.doc_id, description, Feeling);

      // addData(titlediary, description, Feeling);
    }

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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  /*Text(
                    'New Post',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),*/
                  SizedBox(height: 20),
                  
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
                      
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}
