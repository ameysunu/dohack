import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ViewBlog extends StatefulWidget {
  @override
  _ViewBlogState createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('blog').snapshots();
  }

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
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
