import 'package:flutter/material.dart';

class SMPostInteractions extends StatefulWidget {
  final bool like;
  final bool share;
  final String socialMedia;

  SMPostInteractions({this.like = false, this.share = false, this.socialMedia});

  @override
  _SMPostInteractionsState createState() => _SMPostInteractionsState();
}

class _SMPostInteractionsState extends State<SMPostInteractions> {
  bool _isLiked;
  bool _isShared;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLiked = widget.like;
    _isShared = widget.share;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _toggleShare() {
    setState(() {
      _isShared = !_isShared;
    });
  }

  Widget _getMainInteractions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage(_isLiked ? "assets/postInteractions/heart.png" : "assets/postInteractions/heart_outline.png"),
            color: _isLiked ? Colors.red : Colors.black54,
          ),
          iconSize: 15.0,
          onPressed: _toggleLike,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/postInteractions/share.png"),
            color: _isShared ? Colors.green : Colors.black54,
          ),
          iconSize: 15.0,
          onPressed: _toggleShare,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/postInteractions/comment.png"),
          ),
          iconSize: 15.0,
          onPressed: null,
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

    Widget _getMainInteractionsNoShare() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage(_isLiked ? "assets/postInteractions/heart.png" : "assets/postInteractions/heart_outline.png"),
            color: _isLiked ? Colors.red : Colors.black54,
          ),
          iconSize: 15.0,
          onPressed: _toggleLike,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/postInteractions/comment.png"),
          ),
          iconSize: 15.0,
          onPressed: null,
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  Widget _getInteractions(){
    if (widget.socialMedia == "instagram"){
      return _getMainInteractionsNoShare();
    }
    return _getMainInteractions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.0,
      height: 30.0,
      child: _getInteractions(),
      // color: Colors.purple[100],
    );
  }
}
