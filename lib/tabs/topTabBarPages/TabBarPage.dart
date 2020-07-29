import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';
import './socialMediaPostWidgets/SMPostCard.dart';

class TabBarPage extends StatelessWidget {
  String tab;

  TabBarPage({this.tab});

  final dummyData = [
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "xdudeitshannah",
      "socialMedia": "twitter",
      "textPost":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ",
      "media": false,
      "imageURLs": [],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "dudeitshannah",
      "socialMedia": "instagram",
      "textPost": "Lorem ipsum dolor sit amet, ",
      "media": true,
      "imageURLs": [
        'https://animewp.com/wallpaper/2015/05/avatar-the-last-airbender-characters-6-free-hd-wallpaper.jpg',
        'https://kpopthing.com/wp-content/uploads/2020/02/twicelights-cancelled-min.jpg',
        'https://cdn02.nintendo-europe.com/media/images/08_content_images/games_6/nintendo_switch_7/nswitch_splatoon2_v2/CI_NSwitch_Splatoon2_H2x1_NSwitch_Splatoon2_01_V2.png',
        'https://cdn.shopify.com/s/files/1/1788/4029/articles/Virtuoso_FW17_Playing_Cards_8_1024x1024.jpg?v=1559068543',
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/10/Fairy-tail-featured-image-Cropped-1.jpg',
        'https://i.pinimg.com/236x/3d/bb/c4/3dbbc4cd12ec5001d6a90c2e2e54285f.jpg',
        'https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2019/12/31/rk_dahyun_311219.jpg?itok=7ZEbx5-5&timestamp=1577764933',
        'https://specials-images.forbesimg.com/imageserve/5f0d5e99116b6d000685e28f/960x0.jpg?cropX1=0&cropX2=1750&cropY1=776&cropY2=1943',
        'https://66.media.tumblr.com/6750d7a948f3608f14fed588f3a24767/7ea6baa88ebbdc35-93/s640x960/692cb2757f0efb6723bb8a76c0fbbc532d2584f1.gif',
        'https://vignette.wikia.nocookie.net/fairytail/images/7/7e/Brandish%27s_persona.png/revision/latest?cb=20181209133103',
      ],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "",
      "socialMedia": "facebook",
      "textPost":
          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ",
      "media": false,
      "imageURLs": [],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "xdudeitshannah",
      "socialMedia": "twitter",
      "textPost":
          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ",
      "media": true,
      "imageURLs": [
        'https://kpopthing.com/wp-content/uploads/2020/02/twicelights-cancelled-min.jpg',
      ],
    }
  ];

    final dummyData2 = [
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "xdudeitshannah",
      "socialMedia": "twitter",
      "textPost":
          "This is for Rachel you big fat white nasty smelling fat bitch why you took me off the motherfuckin schedule with your trifflin dirty white racist ass you big fat bitch oompa loompa body ass bitch I'm coming up there and I'm gonna beat the f*ck out of you bitch",
      "media": false,
      "imageURLs": [],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "dudeitshannah",
      "socialMedia": "instagram",
      "textPost": "You should have taken Kiyoshi's advice, Aang.👀 #OnlyJusticeWillBringPeace",
      "media": true,
      "imageURLs": [
        {'type':'photo', 'photoURL':'https://animewp.com/wallpaper/2015/05/avatar-the-last-airbender-characters-6-free-hd-wallpaper.jpg'},
        {'type':'photo', 'photoURL':'https://kpopthing.com/wp-content/uploads/2020/02/twicelights-cancelled-min.jpg'},
        {'type':'photo', 'photoURL':'https://cdn02.nintendo-europe.com/media/images/08_content_images/games_6/nintendo_switch_7/nswitch_splatoon2_v2/CI_NSwitch_Splatoon2_H2x1_NSwitch_Splatoon2_01_V2.png'},
        {'type':'photo', 'photoURL':'https://cdn.shopify.com/s/files/1/1788/4029/articles/Virtuoso_FW17_Playing_Cards_8_1024x1024.jpg?v=1559068543'},
        {'type':'photo', 'photoURL':'https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/10/Fairy-tail-featured-image-Cropped-1.jpg'},
        {'type':'photo', 'photoURL':'https://i.pinimg.com/236x/3d/bb/c4/3dbbc4cd12ec5001d6a90c2e2e54285f.jpg'},
        {'type':'photo', 'photoURL':'https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2019/12/31/rk_dahyun_311219.jpg?itok=7ZEbx5-5&timestamp=1577764933'},
        {'type':'photo', 'photoURL':'https://specials-images.forbesimg.com/imageserve/5f0d5e99116b6d000685e28f/960x0.jpg?cropX1=0&cropX2=1750&cropY1=776&cropY2=1943'},
        {'type':'photo', 'photoURL':'https://66.media.tumblr.com/6750d7a948f3608f14fed588f3a24767/7ea6baa88ebbdc35-93/s640x960/692cb2757f0efb6723bb8a76c0fbbc532d2584f1.gif'},
        {'type':'photo', 'photoURL':'https://vignette.wikia.nocookie.net/fairytail/images/7/7e/Brandish%27s_persona.png/revision/latest?cb=20181209133103'},
      ],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "",
      "socialMedia": "facebook",
      "textPost":
          "Do you guys know what will happen if everyone on earth fell asleep at the same time? Well, if everyone fell asleep at the same time, no one would be awake.",
      "media": false,
      "imageURLs": [],
    },
    {
      "imagePath": "assets/samplePosts/sampleIcon.jpg",
      "name": "Hannah Fragante",
      "userName": "xdudeitshannah",
      "socialMedia": "twitter",
      "textPost":
          "TWICE best gg",
      "media": true,
      "imageURLs": [
        {'type':'photo', 'photoURL':'https://kpopthing.com/wp-content/uploads/2020/02/twicelights-cancelled-min.jpg'},
        {'type':'video', 'photoURL':'http://pbs.twimg.com/tweet_video_thumb/EdfAIzAXoAExqVO.jpg', "videoURL":"https://video.twimg.com/tweet_video/EdfAIzAXoAExqVO.mp4", "aspectRatio":1/1}
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        // padding: const EdgeInsets.all(8),
        itemCount: dummyData2.length,
        itemBuilder: (BuildContext context, int i) {
          return SMPostCard(
              imagePath: dummyData2[i]["imagePath"],
              name: dummyData2[i]["name"],
              userName: dummyData2[i]["userName"],
              socialMedia: dummyData2[i]["socialMedia"],
              textPost: dummyData2[i]["textPost"],
              media: dummyData2[i]["media"],
              imageURLs: dummyData2[i]["imageURLs"],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
