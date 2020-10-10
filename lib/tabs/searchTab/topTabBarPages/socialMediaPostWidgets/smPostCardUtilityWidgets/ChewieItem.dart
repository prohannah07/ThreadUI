import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final double aspectRatio;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    this.aspectRatio,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: widget.aspectRatio,//21 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     child: Chewie(
    //       controller: _chewieController,
    //     ),
    //     // constraints: BoxConstraints.expand(
    //     //     height: 150,
    //     //     width: 200
    //     //   ),
    //     width: 100,
    //     height: 100,
    //     color: Colors.red,
    //   ),
    // );
    return Chewie(
      controller: _chewieController,
    );
  }
}