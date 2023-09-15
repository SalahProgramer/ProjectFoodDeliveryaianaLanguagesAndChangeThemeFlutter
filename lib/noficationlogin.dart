import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_delivery_languages/animation.dart';
import 'package:food_delivery_languages/theme.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animation2.dart';
import 'lanuage.dart';
import 'main.dart';
import 'nofication.dart';

class loginnofication extends StatefulWidget {
  const loginnofication({super.key});

  @override
  State<loginnofication> createState() => _loginnoficationState();
}

class _loginnoficationState extends State<loginnofication> {
  final global = GlobalKey<ScaffoldState>();
  int index1 = 2;
  int clicked_index = 0;
  bool val = true;
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/black.jpg"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              global.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu_open_rounded,
              color: Colors.white,
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
                      Icons.add_alert,
                      color: Colors.white,
                    )))
            //
          ],
          centerTitle: true,
          title: Text("" + AppLocalizations.of(context)!.nofication,
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.red,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .push(animation2(page: nofication()));
                        },
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.arrow_back),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
// mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 30),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("" + AppLocalizations.of(context).nofication,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("" + AppLocalizations.of(context).swipe,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,

                    child: ListView.builder(itemBuilder: (context,i){
                      return nof(num: i+1);

                    },
                    itemCount: 30,),

                  ),



                        
                        
                        

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class nof extends StatefulWidget {
 final int num;
  const nof({super.key,required this.num});

  @override
  State<nof> createState() => _nofState();
}

class _nofState extends State<nof> {
  bool vis=true;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion:ScrollMotion
          (

        ),
        children: [
SizedBox(width: 10,),
          Container(
            width: 150,
            child: FloatingActionButton(
              elevation: 9,

              isExtended: true,

              onPressed: () {
               setState(() {
                 vis=!vis;
               });
              },
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.red,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
Text(""+AppLocalizations.of(context).delete)


                ],

              )

            ),
          )



        ],

      ),
      child: Visibility(
        visible: vis ,
        child: Column(

          children:[
            SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              // color: Colors.white,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 1),
                  gradient: LinearGradient(
                      colors: [HexColor("#42047e"), HexColor("#07f49e")],
                      transform: GradientRotation(9))),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(

                    children: [
                      Row(

                        children: [
                          Container(
                            child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.add_alert,
                                  color: Colors.black,
                                )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33),
                                border: Border.all(color: Colors.black, width: 2)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("" + AppLocalizations.of(context).neworder,
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text("2020-08-21 | 06:56",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),

                        ],

                      ),


                    ],

                  ),
                  Text(""+this.widget.num.toString(), style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ]

        ),
      ),
    );
  }
}
