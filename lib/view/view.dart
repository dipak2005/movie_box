// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/idmodel.dart';
import 'package:movie_app/model/movie_helper.dart';

import '../model/search_model.dart';

class ViewMore extends StatefulWidget {
  final String? id;
  final int? index;

  const ViewMore({super.key, this.id,this.index});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          "Detail Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: MovieHelper().iSearch(widget.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "${snapshot.error}",
              style: TextStyle(color: Colors.white),
            );
          } else if (snapshot.hasData) {
            IdModel? data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 1.7,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: Colors.black,
                          offset: Offset(0.9, 0.9),
                        )
                      ], borderRadius: BorderRadius.circular(10)),
                      child: Hero(
                        tag: "image",
                        placeholderBuilder: (context, heroSize, child) {
                          return child;
                        },
                        child: Image.network(
                          "${data?.poster}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 26,
                  ),
                  Divider(
                    color: Colors.white,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Text(
                    " Name : ${data?.title}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    color: Colors.white,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " Releasing : ${data?.released}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " Year : ${data?.year}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment(-0.85, 0),
                    child: Text(" Duration : ${data?.runtime}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  Align(
                      alignment: Alignment(-0.74, 0),
                      child: Text(
                        " Casting type : ${data?.genre}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                    alignment: Alignment(-0.86, 0),
                    child: Text(
                      " Type : ${data?.type}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.76, 0),
                    child: Text(
                      " Direcoter : ${data?.director}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.01, 0),
                    child: Text(
                      " Weiters : ${data?.writer}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                      alignment: Alignment(-0.5, 0),
                      child: Text(
                        " Actors : ${data?.actors}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(
                      " Language : ${data?.language}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(
                      " Country : ${data?.country}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        "Awards : ${data?.awards}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                      alignment: Alignment(-0.1, 0),
                      child: Text(
                        " Description : ${data?.plot}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  // Align(
                  //     alignment: Alignment(-0.7, 0),
                  //     child: Text(
                  //       " Source : ${data?.ratings?[0].source}",
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.w700),
                  //     )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        initialRating: double.parse("  ${data?.imdbRating}"),
                        minRating: 1,
                        unratedColor: Colors.white,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Align(
                        alignment: Alignment(-0.82, 0),
                        child: Text(
                          " Rating : ${data?.imdbRating}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        " Boxoffice : ${data?.boxOffice}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Column(
                    children: [
                      RatingBar.builder(
                        initialRating: double.parse("  ${data?.imdbRating}"),
                        minRating: 1,
                        unratedColor: Colors.white,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0),
                        child: Text(
                          " IMDB Rating : ${data?.imdbRating}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " MetaScore : ${data?.metascore}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " Production : ${data?.production}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " Website : ${data?.website}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.purpleAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
