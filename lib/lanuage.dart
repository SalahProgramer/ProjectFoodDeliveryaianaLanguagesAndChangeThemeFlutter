import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_languages/person.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//
import 'main.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(

          elevation: 0,
          leading:
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
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
                      color: Colors.black,
                    )))
            //
          ],
          centerTitle: true,
          title: Text("" + AppLocalizations.of(context).language,
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          
        ),
        body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/blue.jpg"),
                  fit: BoxFit.cover
                )
              ),

                padding: EdgeInsets.only(top: 100,left: 20,right: 20,bottom: 20),
                child: Container(
                  child: Column(children: [
                    Row(
// mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.language_rounded,
                            color: Colors.black, size: 30),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("" + AppLocalizations.of(context).appLanguage,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("" + AppLocalizations.of(context).selectLang,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // SingleChildScrollView(
                    Container(
                      height: 700,
                      margin: EdgeInsets.only(bottom: 70),
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 3),

                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),

                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.green,
                                  Colors.white,
                                  Colors.blueAccent
                                ],
                                transform: GradientRotation(15)
                            )

                            ),

                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(20),
                            children: [
                              card1(
                                  title: 'English',
                                  subtitle: 'English',
                                  image: "images/flag1.png",
                                  lang: "en"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'Arabic',
                                  subtitle: 'العربية',
                                  image: "images/flag2.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'French (France)',
                                  subtitle: 'français-France',
                                  image: "images/flag3.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'French (Canada)',
                                  subtitle: 'français-Canadien',
                                  image: "images/flag4.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'Portugese (Barzil)',
                                  subtitle: 'Brazilian',
                                  image: "images/flag5.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'Korean',
                                  subtitle: 'Korean',
                                  image: "images/flag6.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'French (France)',
                                  subtitle: 'français-France',
                                  image: "images/flag4.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'French (France)',
                                  subtitle: 'français-France',
                                  image: "images/flag4.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),
                              card1(
                                  title: 'French (France)',
                                  subtitle: 'français-France',
                                  image: "images/flag4.png",
                                  lang: "ar"),
                              SizedBox(
                                height: 20,
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                    // )
                  ]),
                )

            )));
  }
}

class card1 extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final String lang;

  const card1(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.lang});

  @override
  State<card1> createState() => _card1State();
}

class _card1State extends State<card1> {

  @override
  Widget build(BuildContext context) {
    return
        // isloading
        //     ?
        // // Row(
        // //         mainAxisAlignment: MainAxisAlignment.center,
        // //         children: [
        // //           CircularProgressIndicator(
        // //             color: Colors.blue,
        // //           ),
        // //           SizedBox(width: 20),
        // //           Text(
        // //             "please wait ...",
        // //             style: TextStyle(fontSize: 20, color: Colors.black),
        // //           )
        // //         ],
        // //       )
        //     :
            ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.transparent
                ,
                elevation: 0,


              )
,
              child: ListTile(
                  selected: true,
                  splashColor: Colors.lightBlue,

                  selectedTileColor:Colors.white,

                  onTap: () async {

                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SpinKitThreeBounce(
                                color: Colors.blueAccent,
                                size: 20.0,
                              ),
                              SizedBox(height: 20),
                              Text(
                                ""+AppLocalizations.of(context).wait,
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        );
                      },
                    );

                    await Future.delayed(Duration(seconds: 2));

                    Get.updateLocale(Locale('' + this.widget.lang));
                    await Future.delayed(Duration(seconds: 2));


                    Navigator.pop(context);
                  },
                  title: Text(
                    "" + this.widget.title,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  leading:
                  Container(
                    child: CircleAvatar(
                      // backgroundColor: Colors.white60,
                        backgroundImage: AssetImage("" + this.widget.image),
                      radius: 20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(58),
                        border: Border.all(color: Colors.black,)),
                  ),
                  // CircleAvatar(
                  //
                  // ),
                  subtitle: Text(
                    "" + this.widget.subtitle,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),

            );
  }
}
