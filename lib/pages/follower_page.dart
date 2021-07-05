import 'package:flutter/material.dart';
import 'package:practice/pages/followers.dart';

class FollowerButton extends StatefulWidget {
  const FollowerButton({ Key? key }) : super(key: key);

  @override
  _FollowerButtonState createState() => _FollowerButtonState();
}

class _FollowerButtonState extends State<FollowerButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
      ),
      // ignore: deprecated_member_use
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
          RaisedButton(
          color: Colors.blue,
          onPressed: (){
             Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FollowersList()));
          },
        child: Text("Followers",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
        ),
        ),
        ],),
      )
    );
  }
}