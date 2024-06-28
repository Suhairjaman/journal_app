// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/components.dart';
import 'package:journal_app/constants.dart';
import 'package:journal_app/screens/addEntryscreen.dart';
import 'package:journal_app/screens/readlistScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: kScreenBg,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          JourneyTitle(),
          SizedBox(
            height: h * 0.045,
          ),
          Image(
            image: AssetImage(
              'assets/images/journal.png',
            ),
            width: w * 0.51,
            height: h * 0.23,
          ),
          SizedBox(
            height: h * 0.08,
          ),
          JournyButton(
            label: 'Read Entries',
            fn: () async {
              await FirebaseFirestore.instance.collection('entries').get().then((snapshot){
                List<QueryDocumentSnapshot>docList=snapshot.docs;
                Navigator.push(context,MaterialPageRoute(builder: ((context) => ReadentryScreen(docs: docList))));
              } );
            },
          ),
          SizedBox(
            height: 20,
          ),
          JournyButton(
            label: 'Add Entry',
            fn: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEntryScreen(),));
            },
          ),
        ]),
      ),
    ));
  }
}
