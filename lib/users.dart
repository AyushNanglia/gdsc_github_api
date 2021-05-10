/*
import 'main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'userModel.dart';

Future<user> getUsers()async{
  final response=await http.get(Uri.http("api.github.com", "users"));
  List<user> userList=[];
  if (response.statusCode == 200) {
    return user.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
  */
/*print(userList[0]);
  return userList;*//*

}

class gitUsers extends StatefulWidget {
  @override
  _gitUsersState createState() => _gitUsersState();
}

class _gitUsersState extends State<gitUsers> {

  Future<user> user_list;

  @override
  void initState() {
    super.initState();
    user_list = getUsers();
  }

  Widget userCard(String name, String accUrl){
    var cardHeight=MediaQuery.of(context).size.height*0.08;
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [BoxShadow(
          offset: Offset(-1.0,2.0),
          blurRadius: 3.0,
        )]
      ),
      margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
      //width: MediaQuery.of(context).size.width*0.7,
      height: cardHeight,
      child: Row(
        children: [
          Expanded(flex:4,
            child: Container(
              alignment: Alignment.center,
              child: Text(name,style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
            ),
          ),
          Expanded(flex:1,
            child: Container(
              color: Colors.red,
              height: cardHeight,
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body:Container(
        height: MediaQuery.of(context).size.height*1.0,
        width: MediaQuery.of(context).size.width*1.0,
        color: Colors.white,
        child: FutureBuilder(
          future:getUsers(),
          builder: (BuildContext context, AsyncSnapshot<user> snapshot) {
            var Users=snapshot.data;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return userCard(Users.login,Users.accUrl);
              },
            );
          },
        ),
      ),
    );
  }
}

*/
