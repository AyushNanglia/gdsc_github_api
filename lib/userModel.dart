import 'main.dart';
import 'package:http/http.dart';

class user{
  int id;
  String login,nodeID,avatarURL,gravatar,apiURL,accUrl,
      followers,following,gists,starred,subscrips,orgs,repos,events,received_events,type;
  bool admin;


  user({this.login,this.id,this.nodeID,this.avatarURL,this.gravatar,this.apiURL,
        this.accUrl,this.followers,this.following,this.gists,this.starred,this.subscrips,
        this.orgs,this.repos,this.events,this.received_events,this.type,this.admin});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      id:json['id'] as int,
      login: json['login'] as String,
      nodeID: json["node_id"] as String,
      avatarURL: json["avatar_url"] as String,
      gravatar: json["gravatar_id"] as String,
      apiURL: json["url"] as String,
      accUrl: json['html_url'] as String,
      followers: json["followers_url"] as String,
      following: json["following_url"] as String,
      gists: json["gists_url"] as String,
      starred: json["starred_url"] as String,
      subscrips: json["subscriptions_url"] as String,
      orgs: json["organizations_url"] as String,
      repos: json["repos_url"] as String,
      events: json["events_url"] as String,
      received_events: json["received_events_url"] as String,
      type: json["type"] as String,
      admin: json["site_admin"]
    );
  }

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
      "site_admin":type,
    };
    return map;
  }

  factory user.fromMap(Map<String, dynamic> map) {
    return user(
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
        admin: map["site_admin"]
    );
  }

}