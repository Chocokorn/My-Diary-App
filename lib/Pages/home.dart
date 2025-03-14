import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Pages/EditForm.dart';
import 'package:diary/service/crud_service.dart';
import 'package:flutter/material.dart';


class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

void handleDelete(String id){
  deleteData(id);
}

class _myhomeState extends State<myhome> {


  CollectionReference postCollection =
      FirebaseFirestore.instance.collection('Diary');

      
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: postCollection.snapshots(), 
        builder: (context,snapshot){
          if(snapshot.hasData){

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, Index){
                var diaryIndex = snapshot.data!.docs[Index];
              
                return ListTile(
                  leading: Icon(Icons.summarize),
                  title: Text(diaryIndex["Title_Mydiary"]),
                  subtitle: Text(diaryIndex["Feeling"]),
                  trailing: Container(
                          width: 70,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context)=>
                                        Editform(title: diaryIndex["Title_Mydiary"], feeling: diaryIndex["Feeling"] , doc_id: diaryIndex.id,),
                                        settings: RouteSettings(
                                          /*arguments: topic*/)));
                                      /*.then((value){
                                    setState(() {
                                      
                                    });

                                      });*/
                                  },
                                   icon: Icon(Icons.edit))),
                              
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                  deleteData(diaryIndex.id);
                                  
                                }, 
                                icon: Icon(Icons.delete, color: Colors.red,)),
                              ),
                            ],
                          ),
                        ),
                );
              },
              );
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
        }
        ));
  }
}