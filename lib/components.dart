// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:journal_app/constants.dart';
import 'package:journal_app/screens/readEntryscreen.dart';

class JourneyTitle extends StatelessWidget {
  const JourneyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Journy',
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = Color(0xff00114f),
          ),
        ),
        Text(
          'Journy',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class JournyButton extends StatelessWidget {
  final String label;
  final  fn;

  const JournyButton({super.key, required this.label, required this.fn});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: fn,
          
        
        child: Container(
          width: w * 0.8,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(
              width: 3,
              color: Colors.white,
            )
          ),
          child: Center(child: Text(label,
          style: kButtonText,)),
        ));
  }
}
class EntryTile extends StatelessWidget {

  final String title;
  final String entry;
  final String dataTime;
  const EntryTile({super.key, required this.title, required this.entry, required this.dataTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            offset: Offset(0, 7),
          ),
          
        ],
      ),
      child: ListTile(
        onTap: (){

          Navigator.push(context,MaterialPageRoute(builder: (context)=>Readsingleentry(
            title: title,
            entry: entry,
            date: dataTime,
          )));

        },
        contentPadding: EdgeInsets.all(3),
        title: Text(title,style: TextStyle(
          color: Color(0xff00114f),
          fontWeight: FontWeight.w600,
          fontSize: 28,
        ),),
        subtitle: Text(entry,
        overflow:TextOverflow.ellipsis ,
        style: TextStyle(
          color: Color(0xff00114f),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        )),
        tileColor: Colors.white,
        trailing: Column(
          children: [
          
          
            Text('${dataTime.substring(5,11)},${dataTime.substring(0,3)}',style:TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff00114f),
            ) ,),
            SizedBox(height: 3,),
             Text('${dataTime.substring(17)}',style:TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff00114f),
            ) ,),
        
        
        
          ],
        ),
      ),
    );
  }
}