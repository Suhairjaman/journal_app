// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_app/components.dart';
import 'package:journal_app/constants.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titlecontrol = TextEditingController();
  TextEditingController entrycontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kScreenBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            JourneyTitle(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: w * 0.8,
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 10,
              ),
              decoration: kTextfield,
              child: Center(
                  child: TextFormField(
                cursorColor: Colors.white,
                controller: titlecontrol,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Entry Title',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: w * 0.8,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: SingleChildScrollView(
                  reverse: entrycontrol.text.length > 20 ? true : false,
                  child: Center(
                    child: TextFormField(
                      controller: entrycontrol,
                      cursorColor: Colors.white,
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create a new entry',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            JournyButton(
                label: 'SAVE',
                fn: () async {
                  if (titlecontrol.text.isEmpty || entrycontrol.text.isEmpty)
                    print('Please enter title and entry');
                  else {
                    await FirebaseFirestore.instance
                        .collection('entries')
                        .add({
                          'Title': titlecontrol.text,
                          'Entry': entrycontrol.text,
                          'Date': DateFormat.yMMMEd()
                              .add_jm()
                              .format(DateTime.now()),
                        })
                        .then((value) { showFirebaseAlert(context);
                        Navigator.pop(context);
                        Navigator.pop(context);})
                        .catchError(
                            (error) => showErrorAlert(context));
                    titlecontrol.clear();
                    entrycontrol.clear();
                  }
                }),
         SizedBox(
          height: 40,
         ),
         
         
          ],
        ),
      ),
    ));
    
  }

showFirebaseAlert(BuildContext context){

  Widget okButton = TextButton(onPressed: (){
    Navigator.pop(context);
  }, child: Text('OK'));
AlertDialog alert=AlertDialog(
  title: Text('Data Upload Status'),
  content: Text('Entry added successfully'),
  actions: [ 
    okButton,
  ],
);
showDialog(context: context, builder: (context){
  return alert;
});
}
showErrorAlert(BuildContext context){

  Widget okButton = TextButton(onPressed: (){
    Navigator.pop(context);
  }, child: Text('OK'));
AlertDialog alert=AlertDialog(
  title: Text('Something went wrong'),
  content: Text('Entry not added due to an error'),
  actions: [ 
    okButton,
  ],
);
showDialog(context: context, builder: (context){
  return alert;
});
}


  @override
  void dispose() {
    // TODO: implement dispose

    titlecontrol.dispose();
    entrycontrol.dispose();
    super.dispose();
  }
}


