import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';
import 'package:practice/network/base_response.dart';
import 'package:practice/network/users_manager.dart';

class FollowersList extends StatefulWidget {
  const FollowersList({ 
    
   required this.followersimages,
    required this.username,

     }) ;
     final String followersimages;
      final String? username;

  @override
  _FollowersListState createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Row(
                      children: [
                        CircleAvatar(radius: 25,
                        backgroundColor: Colors.blue,
                         backgroundImage: NetworkImage(widget.followersimages)),
                        //backgroundImage: ,
                      
                        SizedBox(width: 20,),
                        Text("${widget.username}",
                        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
        ],)
            ),
    );
  }
}