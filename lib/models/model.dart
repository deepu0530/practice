// // To parse this JSON data, do
// //
// //     final usersFollowersData = usersFollowersDataFromJson(jsonString);

// import 'dart:convert';

// UsersFollowersData usersFollowersDataFromJson(String str) => UsersFollowersData.fromJson(json.decode(str));

// String usersFollowersDataToJson(UsersFollowersData data) => json.encode(data.toJson());

// class UsersFollowersData {
//     UsersFollowersData({
//         required this.totalCount,
//         required this.incompleteResults,
//         required this.items,
//     });

//     int totalCount;
//     bool incompleteResults;
//     List<Item> items;

//     factory UsersFollowersData.fromJson(Map<String, dynamic> json) => UsersFollowersData(
//         totalCount: json["total_count"],
//         incompleteResults: json["incomplete_results"],
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "total_count": totalCount,
//         "incomplete_results": incompleteResults,
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//     };
// }

// class Item {
//     Item({
//         required this.login,
//         required this.id,
//         required this.nodeId,
//         required this.avatarUrl,
//         required this.gravatarId,
//         required this.url,
//         required this.htmlUrl,
//         required this.followersUrl,
//         required this.followingUrl,
//         required this.gistsUrl,
//         required this.starredUrl,
//         required this.subscriptionsUrl,
//         required this.organizationsUrl,
//         required this.reposUrl,
//         required this.eventsUrl,
//         required this.receivedEventsUrl,
//         required this.type,
//         required this.siteAdmin,
//         required this.score,
//     });

//     String login;
//     int id;
//     String nodeId;
//     String avatarUrl;
//     String gravatarId;
//     String url;
//     String htmlUrl;
//     String followersUrl;
//     String followingUrl;
//     String gistsUrl;
//     String starredUrl;
//     String subscriptionsUrl;
//     String organizationsUrl;
//     String reposUrl;
//     String eventsUrl;
//     String receivedEventsUrl;
//     Type? type;
//     bool siteAdmin;
//     int score;

//     factory Item.fromJson(Map<String, dynamic> json) => Item(
//         login: json["login"],
//         id: json["id"],
//         nodeId: json["node_id"],
//         avatarUrl: json["avatar_url"],
//         gravatarId: json["gravatar_id"],
//         url: json["url"],
//         htmlUrl: json["html_url"],
//         followersUrl: json["followers_url"],
//         followingUrl: json["following_url"],
//         gistsUrl: json["gists_url"],
//         starredUrl: json["starred_url"],
//         subscriptionsUrl: json["subscriptions_url"],
//         organizationsUrl: json["organizations_url"],
//         reposUrl: json["repos_url"],
//         eventsUrl: json["events_url"],
//         receivedEventsUrl: json["received_events_url"],
//         type: typeValues.map[json["type"]],
//         siteAdmin: json["site_admin"],
//         score: json["score"],
//     );

//     Map<String, dynamic> toJson() => {
//         "login": login,
//         "id": id,
//         "node_id": nodeId,
//         "avatar_url": avatarUrl,
//         "gravatar_id": gravatarId,
//         "url": url,
//         "html_url": htmlUrl,
//         "followers_url": followersUrl,
//         "following_url": followingUrl,
//         "gists_url": gistsUrl,
//         "starred_url": starredUrl,
//         "subscriptions_url": subscriptionsUrl,
//         "organizations_url": organizationsUrl,
//         "repos_url": reposUrl,
//         "events_url": eventsUrl,
//         "received_events_url": receivedEventsUrl,
//         "type": typeValues.reverse[type],
//         "site_admin": siteAdmin,
//         "score": score,
//     };
// }

// enum Type { USER }

// final typeValues = EnumValues({
//     "User": Type.USER
// });

// class EnumValues<T> {

//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }


// To parse this JSON data, do
//
//     final usersFollowersData = usersFollowersDataFromMap(jsonString);

import 'dart:convert';

UsersFollowersData usersFollowersDataFromMap(String str) => UsersFollowersData.fromMap(json.decode(str));

String usersFollowersDataToMap(UsersFollowersData data) => json.encode(data.toMap());

class UsersFollowersData {
    UsersFollowersData({
        required this.totalCount,
        required this.incompleteResults,
        required this.items,
    });

    int totalCount;
    bool incompleteResults;
    List<Item>? items;

    factory UsersFollowersData.fromMap(Map<String, dynamic> json) => UsersFollowersData(
        totalCount: json["total_count"] == null ? null : json["total_count"],
        incompleteResults: json["incomplete_results"] == null ? null : json["incomplete_results"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total_count": totalCount == null ? null : totalCount,
        "incomplete_results": incompleteResults == null ? null : incompleteResults,
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toMap())),
    };
}

class Item {
    Item({
        required this.login,
        required this.id,
        required this.nodeId,
        required this.avatarUrl,
        required this.gravatarId,
        required this.url,
        required this.htmlUrl,
        required this.followersUrl,
        required this.followingUrl,
        required this.gistsUrl,
        required this.starredUrl,
        required this.subscriptionsUrl,
        required this.organizationsUrl,
        required this.reposUrl,
        required this.eventsUrl,
        required this.receivedEventsUrl,
        required this.type,
        required this.siteAdmin,
        required this.score,
    });

    String login;
    int id;
    String nodeId;
    String avatarUrl;
    String gravatarId;
    String url;
    String htmlUrl;
    String followersUrl;
    String followingUrl;
    String gistsUrl;
    String starredUrl;
    String subscriptionsUrl;
    String organizationsUrl;
    String reposUrl;
    String eventsUrl;
    String receivedEventsUrl;
    String type;
    bool siteAdmin;
    int score;

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        followersUrl: json["followers_url"] == null ? null : json["followers_url"],
        followingUrl: json["following_url"] == null ? null : json["following_url"],
        gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
        starredUrl: json["starred_url"] == null ? null : json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"] == null ? null : json["subscriptions_url"],
        organizationsUrl: json["organizations_url"] == null ? null : json["organizations_url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        receivedEventsUrl: json["received_events_url"] == null ? null : json["received_events_url"],
        type: json["type"] == null ? null : json["type"],
        siteAdmin: json["site_admin"] == null ? null : json["site_admin"],
        score: json["score"] == null ? null : json["score"],
    );

    Map<String, dynamic> toMap() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "gravatar_id": gravatarId == null ? null : gravatarId,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "followers_url": followersUrl == null ? null : followersUrl,
        "following_url": followingUrl == null ? null : followingUrl,
        "gists_url": gistsUrl == null ? null : gistsUrl,
        "starred_url": starredUrl == null ? null : starredUrl,
        "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
        "organizations_url": organizationsUrl == null ? null : organizationsUrl,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "received_events_url": receivedEventsUrl == null ? null : receivedEventsUrl,
        "type": type == null ? null : type,
        "site_admin": siteAdmin == null ? null : siteAdmin,
        "score": score == null ? null : score,
    };
}
