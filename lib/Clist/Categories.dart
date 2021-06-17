import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vt/data/data.dart';
import 'package:vt/models/Types.dart';

import 'package:vt/models/food.dart';
import 'package:vt/screens/Foodscreen.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? head = 'Appetizer';
  Food menuN = appe;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: Count.count!.length,
              itemBuilder: (BuildContext context, int index) {
                Food count = Count.count![index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20, bottom: 30, right: 10),
                  child: ctgrs(size, count, index),
                );
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20),
                child: Text(
                  head!,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      letterSpacing: 3),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: menuN.menu!.length,
                itemBuilder: (BuildContext context, int index) {
                  Types count = menuN.menu![index];

                  return scroll(size, count, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container scroll(Size size, Types count, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 250,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Foodscreen(
                        county: count,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Hero(
                              tag: count.name!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  fit: BoxFit.cover,
                                  height: size.height / 3.8,
                                  width: size.width / 1.2,
                                  image: AssetImage(count.image!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: size.height / 10,
                                width: size.width / 2,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor
                                          .withOpacity(0.1),
                                      spreadRadius: 9,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8.0),
                                      child: Text(
                                        count.name!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10.0, bottom: 4.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            size: 15,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text('${count.star}'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Text(
                                'Rs. ${count.price}',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  GestureDetector ctgrs(Size size, Food count, int index) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            head = count.food;
            menuN = Count.count![index];
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage(count.imageurl!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    count.food!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
