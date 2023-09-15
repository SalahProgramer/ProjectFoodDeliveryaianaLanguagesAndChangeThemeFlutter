import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_delivery_languages/main.dart';
import 'package:food_delivery_languages/person.dart';
import 'package:food_delivery_languages/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animation.dart';
import 'lanuage.dart';
import 'nofication.dart';

class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  final global = GlobalKey<ScaffoldState>();
  final ord = GlobalKey<State>();

  int index1 = 3;
  bool vis = false;
  bool val=true;
  bool note=true;

  loadState() async{
    SharedPreferences pref1 = await SharedPreferences.getInstance();
    setState(() {

      note=pref1.getBool("key")!;
    });
    if (note == false) {
      Get.changeTheme(ThemeClass.darkTheme);
    } else {
      Get.changeTheme(ThemeClass.lightTheme);
    }


  }
  @override
  void initState() {
    loadState();

  }
  @override
  Widget build(BuildContext context) {
    @override
    savebool() async{
      SharedPreferences pref1 = await SharedPreferences.getInstance();
      await pref1.setBool("key", note);



    }
    return
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blue.jpg"), fit: BoxFit.cover)
        ),
        child:  Scaffold(
          key: global,
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          drawer: Drawer(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                borderSide:
                BorderSide(color: Theme.of(context).hoverColor, width: 2)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              padding: EdgeInsets.zero,
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                // itemExtent: 70,
                // padding: EdgeInsets.zero,

                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).hoverColor, width: 2),
                      color: Colors.orange,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white60,
                            backgroundImage: AssetImage("images/result.png"),
                            radius: 50,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(58),
                              border: Border.all(color: Colors.black, width: 4)),
                        ),
                        Text("" + AppLocalizations.of(context).name,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "EBGaramond")),
                        Text(
                          "Flutter developer",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    selected: true,
                    splashColor: Colors.orange,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                    onTap: () {
                      setState(() {
                        // clicked_index = 0;
                      });
                    },
                    title: Text(
                      "" + AppLocalizations.of(context).guest,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(
                      Icons.person,
                      size: 30,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  ListTile(
                    selected: true,
                    splashColor: Colors.orange,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(animation(page: MyApp()));

                      setState(() {});
                    },
                    title: Text(
                      "" + AppLocalizations.of(context).home,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(Icons.home,
                        size: 30, color: Theme.of(context).splashColor),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                  ),
                  ListTile(
                    title: Text(
                      "" + AppLocalizations.of(context).nofication,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(Icons.add_alert_rounded,
                        size: 30, color: Theme.of(context).splashColor),
                    onTap: () {
                      Navigator.of(context).push(animation(page: nofication()));

                      setState(() {
                        // clicked_index = 2;
                      });
                    },
                    selected: true,
                    splashColor: Colors.orange,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                  ),
                  ListTile(
                    title: Text(
                      "" + AppLocalizations.of(context).favoritefood,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    splashColor: Colors.orange,
                    leading: Icon(Icons.favorite,
                        size: 30, color: Theme.of(context).splashColor),
                    onTap: () {
                      setState(() {
                        // clicked_index = 3;
                      });
                    },
                    selected: true,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "" +
                                AppLocalizations.of(context)
                                    .applicationPrefrences,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).splashColor,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        Container(
                            color: Theme.of(context).splashColor,
                            child: Divider(
                              indent: 30,
                              height: 2,
                            ))
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        // clicked_index = 4;
                      });
                    },
                    selected: true,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                    autofocus: true,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "" + AppLocalizations.of(context).help,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    splashColor: Colors.orange,
                    leading: Icon(
                      Icons.help,
                      size: 30,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        // clicked_index = 5;
                      });
                    },
                    selected: true,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                    selectedColor: Colors.green,
                    splashColor: Colors.orange,
                    title: Text(
                      "" + AppLocalizations.of(context).setting,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(Icons.settings,
                        size: 30, color: Theme.of(context).splashColor),
                  ),
                  ListTile(
                    splashColor: Colors.orange,
                    title: Text(
                      "" + AppLocalizations.of(context).language,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(Icons.language_rounded,
                        size: 30, color: Theme.of(context).splashColor),
                    enableFeedback: true,
                    onTap: () {
                      setState(() {
                        // clicked_index = 6;
                        // Navigator.pop(context);
                        Navigator.of(context).push(animation(page: language()));
                      });
                    },
                    selected: true,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.light_mode,
                                size: 30, color: Theme.of(context).splashColor),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              "" + AppLocalizations.of(context).lightmode,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).splashColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 50,
                            ),

                            Switch(
                                value: note,
                                onChanged: (state) {
                                  setState(() {

                                    note=!note;
                                    savebool();
                                  });
                                  if (note == false) {
                                    Get.changeTheme(ThemeClass.darkTheme);
                                  } else {
                                    Get.changeTheme(ThemeClass.lightTheme);
                                  }
                                })
                            // Switch(
                            //     value: note!,
                            //     onChanged: (c) {
                            //       getNode();
                            //
                            //       setState(() {
                            //
                            //         setstate(note);
                            //       });
                            //       // print(note.toString() + " in switch");
                            //
                            //       if (note == false) {
                            //         Get.changeTheme(ThemeClass.darkTheme);
                            //       } else {
                            //         Get.changeTheme(ThemeClass.lightTheme);
                            //       }
                            //
                            //       // if( note==true){
                            //       //
                            //       //
                            //       // }
                            //       // else{
                            //       //
                            //       //
                            //       // }
                            //     })
                          ],
                        ),
                      )
                      // ListTile(
                      //   onTap: () {
                      //
                      //     setState(() {
                      //       // clicked_index = 7;
                      //     });
                      //   },
                      //   selected: true,
                      //   splashColor: Colors.orange,
                      //   shape: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: BorderSide(color: Theme.of(context).scaffoldBackgroundColor, width: 4)),
                      //
                      //
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        // clicked_index = 8;
                      });
                    },
                    selected: true,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 4)),
                    splashColor: Colors.orange,
                    title: Text(
                      "" + AppLocalizations.of(context).login,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).splashColor),
                    ),
                    leading: Icon(Icons.login,
                        size: 30, color: Theme.of(context).splashColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("" + AppLocalizations.of(context).version,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).splashColor,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        Container(
                            color: Theme.of(context).splashColor,
                            child: Divider(
                              indent: 30,
                              height: 2,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          endDrawer: Drawer(),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                global.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu_open_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
            actions: [
              Badge(
                  alignment: Alignment.center,
                  offset: Offset(4, 3),
                  label: Text("0"),
                  largeSize: 10,
                  child: IconButton(
                      onPressed: () {
                        // global.currentState?.openEndDrawer();
                      },
                      icon: Icon(
                        Icons.add_alert_sharp,
                        color: Colors.black,
                        size: 27,
                      )))
              //
            ],
            centerTitle: true,
            title: Text("" + AppLocalizations.of(context)!.titleorder,
                style: TextStyle(
                    fontSize: 27, color: Colors.red, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: index1,
            shadowColor: Colors.blue,
            onTap: (index) {
              setState(() {
                index1 = index;

                if (index1 == 1) {
                  Navigator.of(context).push(animation(page:person() ));


                } else if (index1 == 2) {
                  Navigator.of(context).push(animation(page:MyApp() ));

                } else if (index1 == 3) {
                  Navigator.of(context).push(animation(page:order() ));

                } else if (index1 == 0) {
                  Navigator.of(context).push(animation(page:nofication() ));


                }
              });
            },
            backgroundColor: Colors.black,
            activeColor: Colors.red,
            elevation: 7,
            items: [
              TabItem(
                  icon: Icon(
                    Icons.add_alert_rounded,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.fastfood_outlined,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
            ],
          ),
          body: SingleChildScrollView(
              child: Container(

                child: Container(
                  margin: EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      ordered(),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black, width: 3),
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.white, Colors.blue],
                                transform: GradientRotation(9))),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.timer_sharp,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Order Id: #54",
                                        style: TextStyle(
                                            fontSize: 27,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    Text("4772 villa Drive",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ordered(),
                    ],
                  ),
                ),
              )
          ),

        ),
      );

  }
}

class ordered extends StatefulWidget {
  const ordered({super.key});

  @override
  State<ordered> createState() => _orderedState();
}

class _orderedState extends State<ordered> {
  late bool visibleItems = false;
  late bool visibleIcons = false;
  Color col = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 4),
          height: 100,
          // color: Colors.white,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black, width: 3),
              gradient: LinearGradient(
                  colors: [Colors.green, Colors.white, Colors.blue],
                  transform: GradientRotation(9))),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.timer_sharp,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Order Id: #54",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Text("4772 villa Drive",
                          style: TextStyle(
                              fontSize: 20,
                              color: col,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        col = Colors.black;
                        visibleIcons = !visibleIcons;
                        visibleItems = !visibleItems;
                      });

                      print("visibleIcons" + visibleIcons.toString());
                      print("visibleItems" + visibleItems.toString());
                    },
                    icon: visibleIcons == false
                        ? Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 30,
                          )
                        : Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.red,
                            size: 30,
                          )),
              ),
            ],
          ),
        ),
        Visibility(
          visible: visibleItems,
          child: Column(
            children: [
              SizedBox(
                height: 1,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black, width: 3),
                    ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 3),
                            ),
                            child: ClipRRect(
                              child: Image(
                                image: AssetImage("images/pizza1.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Pizza Marghirita",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Home Cooking Experience",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Quantity: 1.0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("8.80 \$",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("2019-12-16",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("12:57",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black, width: 3),
                    ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 3),
                            ),
                            child: ClipRRect(
                              child: Image(
                                image: AssetImage("images/pizza1.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Pizza Marghirita",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Home Cooking Experience",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text("Quantity: 1.0",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("8.80 \$",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("2019-12-16",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("12:57",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
