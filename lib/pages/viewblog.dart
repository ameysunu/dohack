import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ViewBlog extends StatefulWidget {
  @override
  _ViewBlogState createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Blogs'.toUpperCase(),
          style: TextStyle(fontFamily: "Gotham", color: HexColor('#FF84AF')),
        ),
      ),
    );
  }
}
