import 'package:flutter/material.dart';

class FollowersList extends StatefulWidget {
  const FollowersList({ Key? key }) : super(key: key);

  @override
  _FollowersListState createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.separated(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                scrollDirection: Axis.vertical,
                itemCount: 50,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                 
                  return InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => FollowerButton()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(radius: 25,
                        backgroundColor: Colors.blue,
                        //backgroundImage: ,
                        ),
                        SizedBox(width: 20,),
                        Text("Followers",
                        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  );
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