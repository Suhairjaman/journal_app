// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/components.dart';
import 'package:journal_app/constants.dart';
import 'package:journal_app/screens/addEntryscreen.dart';

class ReadentryScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadentryScreen({super.key, required this.docs});

  @override
  State<ReadentryScreen> createState() => _AddentryScreenState();
}

class _AddentryScreenState extends State<ReadentryScreen> {
   
 
  @override
  Widget build(BuildContext context) {
      final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body:  Container(
        height: h,
        width: w,
        decoration: kScreenBg,
        child: widget.docs.isEmpty?Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          JourneyTitle(),
          SizedBox(height: 20,),
          Expanded(child: Center(child: Text('Please add Entry',style: kButtonText,))),
       SizedBox(height: 20,),
         JournyButton(
            label: 'Add Entry',
            fn: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEntryScreen(),));
            },
          ),
          SizedBox(height: 20,)
        ],
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SizedBox(
        height: 30,
      ),
      JourneyTitle(),
      SizedBox(height: 20,),
      Expanded(child: ListView.separated(itemBuilder: (context,index){
        return EntryTile(title: widget.docs.elementAt( index)['Title'], 
        entry: widget.docs.elementAt( index)['Entry'] ,
         dataTime:  widget.docs.elementAt( index)['Date']);
      }, separatorBuilder: (context,index){
        return Divider();
      }, itemCount: widget.docs.length)),
      SizedBox(height:20),
      JournyButton(label: 'BACK', fn: (){
        Navigator.pop(context);
       
      }), SizedBox(height: 30,)

      ],
    ),)));
  }
}