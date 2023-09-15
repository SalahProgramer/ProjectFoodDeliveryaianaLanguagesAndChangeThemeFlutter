import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_delivery_languages/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animation.dart';
import 'lanuage.dart';
import 'main.dart';
import 'nofication.dart';

class person extends StatefulWidget {
  const person({super.key});

  @override
  State<person> createState() => _personState();
}

class _personState extends State<person> {
  final global = GlobalKey<ScaffoldState>();
  int index1 = 1;
  bool val=false;
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
    return Scaffold(
      // backgroundColor: Colors.white,
      extendBody: true,
      key: global,
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
      bottomNavigationBar: ConvexAppBar(
        onTap: (index) {
          setState(() {
            index1 = index;

            if (index == 2) {
              Navigator.of(context).push(animation(page:MyApp() ));

            }
            else if (index == 0) {
              Navigator.of(context).push(animation(page:nofication() ));

            }
          });
        }, activeColor: Colors.white,

        shadowColor: Theme.of(context).hoverColor,
        curveSize: 90,
        initialActiveIndex: index1,
        elevation: 10,
        items: [
          TabItem(
            icon: Icon(
              Icons.add_alert,
              color: Colors.black,
            ),
          ),
          TabItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,

            ),
          ),
          TabItem(
              icon: Icon(
            Icons.home,
                color: Colors.black,


              )),
          TabItem(
              icon: Icon(
            Icons.shop,
                color: Colors.black,

              )),
          TabItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,

            ),
          ),
        ],
      )

      //
      ,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 80),
// height: 990,
          decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage("images/ff.jpg"),
              //   fit: BoxFit.cover,
              // )
              ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: Colors.blue,
                  border: Border.all(color: Theme.of(context).hoverColor,width: 2)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              global.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu_open_rounded,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text(""+AppLocalizations.of(context).profile,
                            style: TextStyle(
                                fontSize: 27,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CrimsonText')),
                        Badge(
                          alignment: Alignment.center,
                          offset: Offset(8, 10),
                          label: Text("10"),
                          largeSize: 15,
                          child: IconButton(
                              onPressed: () {
                                global.currentState!.openEndDrawer();
                              },
                              icon: Icon(
                                Icons.add_alert,
                                color: Colors.white,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                    Column(
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
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                        ),
                        Text(""+AppLocalizations.of(context).name,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "EBGaramond")),
                        Text(
                          "Flutter developer",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "EBGaramond"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                width: double.maxFinite,
                height: 200,
                child: Row(
                  // diameterRatio: 2,
                  //
                  // squeeze: 1,
                  //
                  // onSelectedItemChanged: (value) {
                  //   print(value);
                  //
                  // },
                  // perspective: 0.01,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card(total: "\$ 921.58", title: ""+AppLocalizations.of(context).earnin),
                    card(total: "98", title: ""+AppLocalizations.of(context).ordered),
                    card(total: "6", title: ""+AppLocalizations.of(context).re),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 362,
                child: Card(
                  elevation: 6,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide( color:Theme.of(context).hoverColor,width: 2)
                  ),
                  child: Container(
                    width: 141,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    alignment: Alignment.center,
                    transformAlignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 40,
                            ),
                            Text(""+AppLocalizations.of(context).about,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'CrimsonText',
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Text(
                            ""+AppLocalizations.of(context).text,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'EBGaramond',
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String total;
  final String title;

  const card({super.key, required this.total, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 6,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Theme.of(context).hoverColor,width: 2)
      ),
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(vertical: 50),
        alignment: Alignment.center,
        transformAlignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "" + this.total,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
            ),
            Text(
              "" + this.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'EBGaramond'),
              overflow: TextOverflow.clip,
            )
          ],
        ),
      ),
    );
  }
}
