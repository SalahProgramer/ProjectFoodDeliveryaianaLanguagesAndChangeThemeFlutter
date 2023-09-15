import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:food_delivery_languages/lanuage.dart';
import 'package:food_delivery_languages/ordered.dart';
import 'package:food_delivery_languages/person.dart';
import 'package:food_delivery_languages/theme.dart';
import 'package:get/get.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animation.dart';
import 'nofication.dart';

void main() {
  runApp(GetMaterialApp(
    // theme: ThemeData(brightness: Brightness.light),
    // darkTheme: ThemeData(brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeClass.darkTheme,
    theme: ThemeClass.lightTheme,
    // themeMode: ThemeMode.system,

    locale: Locale("en"),
    supportedLocales: [
      Locale('en'), // English
      Locale('ar'), // Spanish
    ],
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    localeResolutionCallback: (currentLang, supportLang) {
      if (currentLang != null) {
        for (Locale local in supportLang) {
          if (local.languageCode == currentLang.languageCode) {
            return currentLang;
          }
        }
      }
      return supportLang.first;
    },
    home: screen(),
  ));
}

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).push(animation(page: MyApp()));
      print(ThemeClass.lightTheme == ThemeMode.light);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blue.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("images/result (10).png"), width: 300),
            SizedBox(
              height: 30,
            ),
            SpinKitThreeBounce(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final global = GlobalKey<ScaffoldState>();
  int index1 = 2;
  int clicked_index = 0;

  late FixedExtentScrollController controller;
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


    print(note.toString() + " when get from shared");
    controller = FixedExtentScrollController();
    Future.delayed(Duration()).then((value) {
      controller?.jumpToItem(1);
    });

    print(note.toString() + " when ");
  }

  @override
  Widget build(BuildContext context) {
    @override
    savebool() async{
       SharedPreferences pref1 = await SharedPreferences.getInstance();
      await pref1.setBool("key", note);



    }
    return Scaffold(
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
        endDrawer: Drawer(),
        appBar: AppBar(
          shape: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).hoverColor, width: 2),
          ),
          leading: IconButton(
            onPressed: () {
              global.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu_open_rounded,
              color: Theme.of(context).iconTheme.color,
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
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).iconTheme.color,
                    )))
            //
          ],
          centerTitle: true,
          title: Text("" + AppLocalizations.of(context)!.food,
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
        ),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: index1,
          shadowColor: Colors.blueAccent,
          onTap: (index) {
            setState(() {
              index1 = index;

              if (index1 == 1) {
                Navigator.of(context).push(animation(page: person()));
              } else if (index1 == 3) {
                Navigator.of(context).push(animation(page: order()));
              } else if (index1 == 0) {
                Navigator.of(context).push(animation(page: nofication()));
              }
            });
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: Theme.of(context).cardColor,
          elevation: 20,
          items: [
            TabItem(
                icon: Icon(
              Icons.add_alert_rounded,
            )),
            TabItem(
                icon: Icon(
              Icons.person,
            )),
            TabItem(
                icon: Icon(
              Icons.home,
            )),
            TabItem(
                icon: Icon(
              Icons.fastfood_outlined,
            )),
            TabItem(
                icon: Icon(
              Icons.favorite,
            )),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          // color: Colors.white,
          // height: 900,
          // color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: TextField(
                      textAlign: TextAlign.center,
                      expands: false,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        filled: true,
                        hintStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                        hintText: ("" + AppLocalizations.of(context).search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).hoverColor, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).hoverColor, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).hoverColor, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
// mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star,
                        color: Theme.of(context).hoverColor, size: 30),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("" + AppLocalizations.of(context).top,
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).hoverColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("" + AppLocalizations.of(context).order,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // gradient: LinearGradient(
                    //   colors: [
                    //
                    //
                    //
                    //
                    //
                    //   ]
                    //
                    // )
                    // image: DecorationImage(
                    // image: AssetImage('images/download (1).jpeg'),
                    // fit: BoxFit.cover)
                    // color: Colors.cyan
                  ),
                  height: 350,
                  child: ListWheelScrollViewX(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 330,
                    diameterRatio: 4,
                    controller: controller,
                    physics: FixedExtentScrollPhysics(),
                    //        onSelectedItemChanged: (index)=>{
                    //        Fluttertoast.showToast(
                    //        msg: "${index}",
                    //        toastLength: Toast.LENGTH_SHORT,
                    //        gravity: ToastGravity.CENTER,
                    //        timeInSecForIosWeb: 0,
                    //        backgroundColor: Colors.red,
                    //        textColor: Colors.white,
                    //        fontSize: 16.0
                    //        ),
                    //
                    //        },

                    children: [
                      Container(
                        child: list(
                          image: 'images/download.jpeg',
                        ),
                      ),
                      Container(
                        child: list(image: 'images/download (1).jpeg'),
                      ),
                      // SizedBox(width: 20),
                      Container(
                        child: list(image: 'images/download (2).jpeg'),
                      ),
                      // SizedBox(width: 20),
                      Container(
                        child: list(image: 'images/download (3).jpeg'),
                      ),
                      // SizedBox(width: 20),
                      Container(
                        child: list(image: 'images/download (4).jpeg'),
                      ),
                      // SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
// mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.compare_arrows,
                        color: Theme.of(context).hoverColor, size: 30),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("" + AppLocalizations.of(context).tend,
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).hoverColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("" + AppLocalizations.of(context).double,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // image: DecorationImage(
                        //     image: AssetImage('images/download (1).jpeg'),
                        //     fit: BoxFit.cover)
                        color: Colors.white10),
                    height: 220,
                    width: double.maxFinite,
                    padding: EdgeInsets.zero,
                    child: ListWheelScrollViewX(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200,
                      diameterRatio: 4,
                      controller: controller,
                      physics: FixedExtentScrollPhysics(),
                      children: [
                        Container(
                          child: list1(image1: 'images/download (1).jpeg'),
                        ),
                        // SizedBox(width: 20),
                        Container(
                          child: list1(image1: 'images/download (2).jpeg'),
                        ),
                        // SizedBox(width: 20),
                        Container(
                          child: list1(image1: 'images/download (3).jpeg'),
                        ),
                        // SizedBox(width: 20),
                        Container(
                          child: list1(image1: 'images/download (4).jpeg'),
                        ),
                        // SizedBox(width: 20),
                      ],
                    ))
              ],
            ),
          ),
        )));
  }
  //
  // Future<void> setstate(value) async {
  //   final SharedPreferences pref1 = await SharedPreferences.getInstance();
  //   getNode();
  //   pref1.setBool("key", value);
  //   print("value : " + value.toString());
  // }
  //
  // void getNode() async {
  //   final SharedPreferences pref1 = await SharedPreferences.getInstance();
  //   if (note == null) {
  //     pref1.setBool("key", true);
  //
  //   } else {
  //   }
  //   setState(() {
  //     note = pref1.getBool("key");
  //
  //   });
  //   print("$note lpref");
  // }
}

class list extends StatefulWidget {
  final String image;

  const list({super.key, required this.image});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  double rate = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).hoverColor, width: 4),
          boxShadow: [
            BoxShadow(color: Theme.of(context).hoverColor, blurRadius: 20),
          ],
          color: Theme.of(context).cardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image(
              image: AssetImage("${this.widget.image}"),
              fit: BoxFit.cover,
              width: 300,
              height: 190,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
// color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text("" + AppLocalizations.of(context).top,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).hoverColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "EBGaramond"))),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text("" + AppLocalizations.of(context).order,
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      FlutterRating(
                        onRatingChanged: (value) {
                          setState(() {
                            print(value);
                            rate = value;
                          });
                        },
                        rating: rate,
                        starCount: 5,
                        borderColor: Colors.yellow.shade800,
                        color: Colors.yellow.shade800,
                        allowHalfRating: true,
                        size: 25,
                        mainAxisAlignment: MainAxisAlignment.start,
                      )
                    ],
                  ),
                ),
                Container(
                    height: 90,
                    width: 60,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
// color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                    margin: EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.replay_circle_filled_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shadowColor: Colors.white,
                              elevation: 9),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        // SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        // child:
                        Text("8970.7ns",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).hintColor,
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold)),
                        // )
                        // ,
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class list1 extends StatefulWidget {
  final String image1;

  const list1({super.key, required this.image1});

  @override
  State<list1> createState() => _list1State();
}

class _list1State extends State<list1> {
  double rate = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 110,
            padding: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hoverColor, blurRadius: 20),
                ],
                image: DecorationImage(
                  image: AssetImage("${this.widget.image1}"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text("10.00 \$",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            // padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "" + AppLocalizations.of(context).top,
                      style: TextStyle(
                          color: Theme.of(context).hoverColor,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 4,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text("" + AppLocalizations.of(context).order,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class listTitle extends StatefulWidget {
  final String titles;

  const listTitle({super.key, required this.titles});

  @override
  State<listTitle> createState() => _listTitleState();
}

class _listTitleState extends State<listTitle> {
  bool flag1 = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      autofocus: true,
      titleAlignment: ListTileTitleAlignment.center,
      // hoverColor: Colors.red,
      selectedTileColor: Colors.green,
      onTap: () {
        setState(() {
          if (flag1 == false) {
            flag1 = !flag1;
          }
        });
      },
      selected: flag1,
      title: Text(
        "${this.widget.titles}",
        style: TextStyle(fontSize: 20, color: Colors.white60),
      ),
      leading: Icon(
        Icons.person,
        size: 30,
        color: Colors.white60,
      ),
    );
  }
}
