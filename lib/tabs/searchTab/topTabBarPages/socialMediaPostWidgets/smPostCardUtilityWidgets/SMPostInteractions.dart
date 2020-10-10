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

  void _onMoreHorizPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: 230,
          child: Container(
            child: _buildBottomSheet(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildBottomSheet() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 40,
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.content_copy),
          title: Text("Copy link"),
          onTap: () {
            print("COPY LINK!");
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.send),
          title: Text("Open in " + widget.socialMedia.toUpperCase()),
          onTap: () {
            print("Open in" + widget.socialMedia.toUpperCase());
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.close, color: Colors.red),
          title: Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            print("CANCEL!");
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _getMainInteractions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage(_isLiked
                ? "assets/postInteractions/heart.png"
                : "assets/postInteractions/heart_outline.png"),
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
        Spacer(),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: _onMoreHorizPressed,
          ),
        )
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
            AssetImage(_isLiked
                ? "assets/postInteractions/heart.png"
                : "assets/postInteractions/heart_outline.png"),
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
        Spacer(),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: _onMoreHorizPressed,
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  Widget _getInteractions() {
    if (widget.socialMedia == "instagram") {
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