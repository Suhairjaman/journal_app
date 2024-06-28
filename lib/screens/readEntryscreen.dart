// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:journal_app/components.dart';
import 'package:journal_app/constants.dart';

class Readsingleentry extends StatelessWidget {
  const Readsingleentry(
      {super.key,
      required this.title,
      required this.entry,
      required this.date});
  final String title;
  final String entry;
  final String date;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kScreenBg,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            JourneyTitle(),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.5),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${date.substring(5, 17).trim()}\n${date.substring(0, 5).trim()}${date.substring(17)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                    endIndent: 20,
                    height: 20,
                  ),
              SizedBox(height: 12,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          entry,
                          maxLines: 50,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
              
                ],
              ),
            )),
            SizedBox(
              height: 20,
            ),
            
            JournyButton(label: 'Back', fn: (){
              Navigator.pop(context);
            }),
            SizedBox(height:20),
          ],
        ),
      ),
    ));
  }
}
