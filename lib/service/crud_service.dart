import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void addData(String MyDiary, String Description, String Feeling)  async{
  await FirebaseFirestore.instance.collection('Diary').add({
    "Title_Mydiary" :MyDiary,
    "Description" : Description,
    "Feeling" : Feeling,
    }
  );
}
void updateData(String id, String Description,String Feeling)async{
  try{
    await FirebaseFirestore.instance.collection('Diary').doc(id).update({
      "Description" : Description ,
      "Feeling" : Feeling
    });
  }on Exception catch (e){
    print(e) ;
  }
}

void deleteData(String id) async {
  try {
    await FirebaseFirestore.instance.collection('Diary').doc(id).delete();
  }on Exception catch (e){
    print(e);
  }
}