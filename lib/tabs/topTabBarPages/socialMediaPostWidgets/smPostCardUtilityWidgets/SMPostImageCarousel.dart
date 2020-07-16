import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class SMPostImageCarousel extends StatelessWidget {
  Widget _getCarousel() {
    return SizedBox(
      height: 175.0,
      width: 275.0,
      child: Carousel(
        images: [
          NetworkImage(
              'https://animewp.com/wallpaper/2015/05/avatar-the-last-airbender-characters-6-free-hd-wallpaper.jpg'),
          NetworkImage(
              'https://kpopthing.com/wp-content/uploads/2020/02/twicelights-cancelled-min.jpg'),
          NetworkImage(
              'https://cdn02.nintendo-europe.com/media/images/08_content_images/games_6/nintendo_switch_7/nswitch_splatoon2_v2/CI_NSwitch_Splatoon2_H2x1_NSwitch_Splatoon2_01_V2.png'),
          NetworkImage(
              'https://cdn.shopify.com/s/files/1/1788/4029/articles/Virtuoso_FW17_Playing_Cards_8_1024x1024.jpg?v=1559068543'),
          NetworkImage(
              'https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/10/Fairy-tail-featured-image-Cropped-1.jpg'),
          NetworkImage(
              'https://i.pinimg.com/236x/3d/bb/c4/3dbbc4cd12ec5001d6a90c2e2e54285f.jpg'),
          NetworkImage(
              'https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2019/12/31/rk_dahyun_311219.jpg?itok=7ZEbx5-5&timestamp=1577764933'),
          NetworkImage(
              'https://specials-images.forbesimg.com/imageserve/5f0d5e99116b6d000685e28f/960x0.jpg?cropX1=0&cropX2=1750&cropY1=776&cropY2=1943'),
          NetworkImage(
              'https://66.media.tumblr.com/6750d7a948f3608f14fed588f3a24767/7ea6baa88ebbdc35-93/s640x960/692cb2757f0efb6723bb8a76c0fbbc532d2584f1.gif'),
          NetworkImage(
              'https://vignette.wikia.nocookie.net/fairytail/images/7/7e/Brandish%27s_persona.png/revision/latest?cb=20181209133103'),
        ],
        dotSize: 5.0,
        dotIncreaseSize: 2,
        dotSpacing: 7.0,
        dotColor: Colors.white24,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.purple.withOpacity(0),
        borderRadius: true,
        autoplay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:4.0),
      child: _getCarousel(),
    );
  }
}
