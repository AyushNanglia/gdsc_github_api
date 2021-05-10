import 'main.dart';
import 'userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class dbModel{
  /*int id;
  String login,nodeID,avatarURL,gravatar,apiURL,accUrl,
      followers,following,gists,starred,subscrips,orgs,repos,events,received_events,type;
  String admin;


  dbModel({this.login,this.id,this.nodeID,this.avatarURL,this.gravatar,this.apiURL,
    this.accUrl,this.followers,this.following,this.gists,this.starred,this.subscrips,
    this.orgs,this.repos,this.events,this.received_events,this.type,this.admin});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'login':login,
      "node_id":nodeID,
      "avatar_url":avatarURL,
      "gravatar_id":gravatar,
      "url":apiURL,
      "html_url":accUrl,
      "followers_url":followers,
      "following_url":following,
      "gists_url":gists,
      "starred_url":starred,
      "subscriptions_url":subscrips,
      "organizations_url":orgs,
      "repos_url":repos,
      "events_url":events,
      "received_events_url":received_events,
      "type":type,
      "site_admin":type.toString(),
    };
    return map;
  }

  factory dbModel.fromMap(Map<String, dynamic> map) {
    return dbModel(
        id:map['id'],
        login: map['login'],
        nodeID: map["node_id"] as String,
        avatarURL: map["avatar_url"] as String,
        gravatar: map["gravatar_id"] as String,
        apiURL: map["url"] as String,
        accUrl: map['html_url'] as String,
        followers: map["followers_url"] as String,
        following: map["following_url"] as String,
        gists: map["gists_url"] as String,
        starred: map["starred_url"] as String,
        subscrips: map["subscriptions_url"] as String,
        orgs: map["organizations_url"] as String,
        repos: map["repos_url"] as String,
        events: map["events_url"] as String,
        received_events: map["received_events_url"] as String,
        type: map["type"] as String,
        admin: map["site_admin"].toString()
    );
  }*/

  String login;
  int id;

  dbModel({this.id,this.login});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id':id,
      'login': login,
    };
    return map;
  }

  factory dbModel.fromMap(Map<String, dynamic> map) {
    return dbModel(
      id:map['id'],
      login:map["login"]
    );
  }
}