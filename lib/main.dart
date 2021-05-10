import 'dart:convert';
import 'package:gdsc_github_api/dbHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_github_api/userModel.dart';
import 'enums.dart';
import 'users.dart';
import 'package:http/http.dart' as http;
import 'connection_status.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'connec_sensitivity.dart';

import 'package:shared_preferences/shared_preferences.dart';


  List<user> _usersList=List<user>();
  var db_helper;


  Future<List<user>> getList()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    final response=await http.get(Uri.parse("https://api.github.com/users"));
    dbHelper.db.initDB();
    var users=List<user>();
      if(response.statusCode==200){
       var userJson=json.decode(response.body);
       for(var usersJson in userJson){
         users.add(user.fromJson(usersJson));
         //dbHelper.db.save(user.fromJson(usersJson));
       }
       //print(userJson);
        print("saved 2");
       //String toSave=user.fromJson(userJson).toString();
       //pref.setString("cached", toSave);
    }
      //print(pref.getString("cached"));
    return users;
  }

  /*listToDb()async{
    for(var i in _usersList){
      await dbHelper.instance.save(i);
    }
    print("Done");
  }*/

void main() {
  runApp(MaterialApp(home:gitUsers()));
}

class wrapper extends StatefulWidget {
  @override
  _wrapperState createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return gitUsers();
  }
}

class gitUsers extends StatefulWidget {
  @override
  _gitUsersState createState() => _gitUsersState();
}
class _gitUsersState extends State<gitUsers> {

  Future<List<Map<String, dynamic>>> user_list;

  //get getFromDb => null;
  @override
  void initState() {
    super.initState();
    //db_helper=dbHelper();
    /*setState(() {
      user_list=dbHelper.readDb();
    });*/
    //user_list = getUsers();
  }

  Widget userCard(user User){
    var cardHeight=MediaQuery.of(context).size.height*0.08;
    return GestureDetector(
      /*onTap: ()async{
        if(await canLaunch("https://api.github.com/users/${User.id}"))
          await launch("https://api.github.com/users/${User.id}");
        else
          throw 'Could not launch';
      },*/
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [BoxShadow(
              offset: Offset(-1.0,2.0),
              blurRadius: 3.0,
              color: Colors.grey,
            )]
        ),
        margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
        //width: MediaQuery.of(context).size.width*0.7,
        height: cardHeight,
        child: Container(
                alignment: Alignment.center,
                child: Text(User.login,style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getList().then((value){       ///A provider method can be added here to
      setState(() {               ///fetch data from local db in case of failure
        _usersList.addAll(value);
      });
    });
    //for(int i=0; i<_usersList.length; i++)
      //print(_usersList.length);
    //listToDb();
    //user_list = getUsers();
    // ignore: missing_required_param
    return StreamProvider<ConnectivityStatus>(
      create: (context){
        return connecStatus().connectionStatusController.stream;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Github Users",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
            elevation: 0.0,
          ),
          extendBodyBehindAppBar: false,
          body:connecSensitive(
            child: Container(
              height: MediaQuery.of(context).size.height*1.0,
              width: MediaQuery.of(context).size.width*1.0,
              color: Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width*1.0,
                child: ListView.builder(
                  itemCount: _usersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return userCard(_usersList[index]);
                  },
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}


