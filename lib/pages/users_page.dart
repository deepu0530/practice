import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';
import 'package:practice/network/base_response.dart';
import 'package:practice/network/users_manager.dart';
import 'package:practice/pages/follower_page.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UsersFollowersData? usersFollowersData;
  Item? _item;
  bool _loading = true;
  Future<void> fetchSchedule() async {
    setState(() {
      _loading = true;
    });

    final response = await userManager.fetchUsers();

    if (response.status == ResponseStatus.SUCCESS) {
      setState(() {
        usersFollowersData = response.data;
        _loading = false;
      });
    } else {
      //ToastUtils().showToast(response.message);
    }
  }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _selectedIndex = widget.activeIndex;
    // });
    fetchSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          scrollDirection: Axis.vertical,
          itemCount: usersFollowersData!.items!.length,
          // itemCount: 50,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final i = usersFollowersData!.items![index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowerButton()));
                },
                child: Text(
                  i.login,
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
      ),
    );
  }
}
