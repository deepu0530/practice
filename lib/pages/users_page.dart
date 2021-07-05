import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';
import 'package:practice/network/base_response.dart';
import 'package:practice/network/users_manager.dart';

import 'package:practice/pages/followers.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

    bool fetching = true;
  UsersFollowersData? usersFollowersData;


  void getData() async {
    setState(() {
      fetching = true;
    });
    try {
      final response = await userManager.fetchUsers();
        if (response.status == ResponseStatus.SUCCESS) {
          setState(() {
            usersFollowersData = response.data;

            fetching = false;
          });
        fetching = false;
        print(response);
      }
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: BuildBody(),
     
    );
  }
  Widget BuildBody(){
    if(usersFollowersData==null){
      return Center(child: CircularProgressIndicator());
    }
    return  
                          Container(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          scrollDirection: Axis.vertical,
          itemCount: usersFollowersData!.items!.length,
          // itemCount: 50,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            //final i = usersFollowersData!.items![index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowersList(
                            followersimages:usersFollowersData!.items![index].avatarUrl,
                            username:usersFollowersData!.items![index].login,
                          )));
                },
                child: Text(
                  "${usersFollowersData!.items![index].login}" ,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      );
     
  }
}
