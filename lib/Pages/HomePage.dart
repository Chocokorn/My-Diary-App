import 'package:diary/Pages/Addform.dart';
import 'package:diary/Pages/home.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int screenIndex = 0;
  List page = [
    myhome() ,
    // Addform()
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 130, 180),
        title: 
        Center(
          child: 
          Text('Diary', 
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 234, 240),
              fontWeight: FontWeight.bold, 
              fontSize: 25))),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            page[screenIndex] 
          ],
        ),),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            screenIndex = 0;
          });
          //------ ไปหน้า addForm ------
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Addform()))
              .then((_) {
            setState(() {
              screenIndex = 0;
            });
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: const Color.fromARGB(255, 246, 207, 93),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //------ bottomNavigationBar ------
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 70, 130, 180),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    //------ กำหนดค่า Index เมื่อมีการคลิก ------
                    screenIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  //------ ถ้า Index = 0 ให้ไอคอนสีเขียวเข้ม ถ้าไม่ใช้ไอคอนสีขาว ------
                  color: screenIndex == 0
                      ? const Color.fromARGB(255, 246, 207, 93)
                      : Colors.white,
                  // color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.edit_note,
                  color: screenIndex == 1
                      ? const Color.fromARGB(255, 246, 207, 93)
                      : Colors.white,
                )),
          ],
        ),
      ),
    );
  }

}



