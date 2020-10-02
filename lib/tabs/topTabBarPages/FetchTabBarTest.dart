import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../colorPallete/ThreadColorPallete.dart';
import './socialMediaPostWidgets/SMPostCard.dart';

//FetchTabBarTwitter
class FetchTabBarTwitter extends StatefulWidget {
  String finalQuery;

  FetchTabBarTwitter({this.finalQuery});

  @override
  _FetchTabBarTwitterState createState() => _FetchTabBarTwitterState();
}

class _FetchTabBarTwitterState extends State<FetchTabBarTwitter> {
  // final String searchQuery;
  Future<List<dynamic>> fetch;

  // APITestHome({this.searchQuery = "earthquake"});

  final String apiUrl = "http://10.0.2.2:8080/twitter/search?q=";

  Future<List<dynamic>> fetchUsers(q) async {
    var result = await http.get(apiUrl + q);

    if (result.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("FINAL QUERY: " + widget.finalQuery);
      print("status is 200! yeet");
      // print(result.body);
      // return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    // return json.decode(result.body);
    return json.decode(utf8.decode(result.bodyBytes));
  }

  _getMedia(List mediaEntities){
    var final_media_list = [];

    if (!mediaEntities.isEmpty){
      for (var i=0; i < mediaEntities.length; i++){
        if (mediaEntities[i]["type"] == "photo"){
          final_media_list.add(
            {
              "type": mediaEntities[i]["type"],
              "photoURL": mediaEntities[i]["mediaURL"]
            }
          );
        }else if(mediaEntities[i]["type"] == "video"){
          final_media_list.add(
            {
              "type": mediaEntities[i]["type"],
              "photoURL": mediaEntities[i]["mediaURL"],
              "videoURL":_getVideoURL(mediaEntities[i]["videoVariants"]),
              "aspectRatio": mediaEntities[i]["videoAspectRatioWidth"]/mediaEntities[i]["videoAspectRatioHeight"]
            }
          );
        }
        
      }
    }
    return final_media_list;

  }

  _getVideoURL(List video){
    for (var i=0; i < video.length; i++){
      if (video[i]["bitrate"] > 0){
        return video[i]["url"];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<dynamic>>(
            future: fetchUsers(widget.finalQuery),
                // fetchUsers(context.watch<SearchQueries>().query["searchQuery"]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // print(_age(snapshot.data[0]));
                print(snapshot.data.length);
                print(snapshot.data[0]["user"]["400x400ProfileImageURLHttps"]);
                return ListView.separated(
                  // padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return SMPostCard(
                      imagePath: snapshot.data[i]["retweetedStatus"]==null ? snapshot.data[i]["user"]["400x400ProfileImageURLHttps"] : snapshot.data[i]["retweetedStatus"]["user"]["400x400ProfileImageURLHttps"],
                      name: snapshot.data[i]["retweetedStatus"]==null ? snapshot.data[i]["user"]["name"] : snapshot.data[i]["retweetedStatus"]["user"]["name"],
                      userName: snapshot.data[i]["retweetedStatus"]==null ? snapshot.data[i]["user"]["screenName"] : snapshot.data[i]["retweetedStatus"]["user"]["screenName"],
                      socialMedia: "twitter",
                      textPost: snapshot.data[i]["retweetedStatus"]==null ? snapshot.data[i]["text"] : snapshot.data[i]["retweetedStatus"]["text"],
                      media: snapshot.data[i]["retweetedStatus"]==null ? (snapshot.data[i]["mediaEntities"].length==0 ? false : true) : (snapshot.data[i]["retweetedStatus"]["mediaEntities"].length==0 ? false : true),
                      imageURLs: _getMedia(snapshot.data[i]["retweetedStatus"]==null ? snapshot.data[i]["mediaEntities"]: snapshot.data[i]["retweetedStatus"]["mediaEntities"]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
      );
  }
}
