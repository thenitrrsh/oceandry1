import 'dart:math';
import 'package:flutter/cupertino.dart';
// import 'package:rorkee_cab_centre_driver/Book_Cab.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rorkee_cab_centre_driver/global.dart';
import 'package:rorkee_cab_centre_driver/ui/screens/details.dart';
import 'package:rorkee_cab_centre_driver/ui/widgets/mybottomnavbar.dart';

class HomeScreen extends StatefulWidget {
  // final String uId, fullName, usrPic, mobileNo;
  //
  // const HomeScreen({Key key, this.uId, this.fullName, this.usrPic, this.mobileNo}) : super(key: key);
  //


  @override
  _HomeScreenState createState() => new _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
  DateTime _dateTime;

  var _dateFormat = DateFormat('dd-mm-yyyy');
  String _uid;
   @override
   void initState(){
     super.initState();
     uid();
     // DateTime dateTimeFromServerTimeStamp = (FieldValue.serverTimestamp() as Timestamp).toDate();
     // print(dateTimeFromServerTimeStamp);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2446a6),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Color(0xff4169d8),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Color(0xff3a5fc8),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(_uid).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {

                    DocumentSnapshot _userData = snapshot.data;

                    if(_userData == null){
                      return Center(
                        child: Text('No data')
                      );
                    }

                    else {
                      return Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Roorkee Cab Centre",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .display1
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  5),
                                              child: Image.network('${_userData['user_pic']}',
                                                // 'assets/roorkee-cab-3.jpeg',
                                                fit: BoxFit.cover,
                                                height: 35,
                                                width: 35,),

                                            ),

                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Text('${_userData['full_name']}',
                                              // "${User.fullname}",
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline
                                                  .apply(
                                                  color: MyColors.darkBlue,
                                                  fontWeightDelta: 2),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              icon: Icon(
                                                Icons.menu,
                                                color: MyColors.red,
                                              ),
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "5",

                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .headline
                                                    .apply(
                                                    color: MyColors.darkBlue,
                                                    fontWeightDelta: 2),
                                              ),
                                              TextSpan(
                                                text: " Travelers point",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .body2
                                                    .apply(
                                                    color: MyColors.darkBlue),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(25.0),
                                        color: MyColors.red,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "My next trip",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .headline
                                                    .apply(color: Colors.white),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "28",
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline
                                                  .apply(color: Colors.white),
                                            ),
                                            Text(
                                              'feb',
                                              // "${FieldValue.serverTimestamp()}",
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .body1
                                                  .apply(color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(flex: 2,),
                              Text(
                                "Bookings",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .display1
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    ElevatedButton.icon(onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (Context)=> Plan()));
                                      // Navigator.push(context, MaterialPageRoute(builder: (Context)=> Plan()));
                                    },
                                        icon: Icon(Icons.add),
                                        label: Text('Plan your trip'))
                                  ],
                                ),

                              ),
                              Spacer(flex: 2,)
                              // Container(
                              //   height: MediaQuery
                              //       .of(context)
                              //       .size
                              //       .height / 4,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: destinationsList.length,
                              //     itemBuilder: (ctx, i) {
                              //       return GestureDetector(
                              //         onTap: () =>
                              //             Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                 builder: (ctx) =>
                              //                     DetailsScreen(id: i),
                              //               ),
                              //             ),
                              //         child: Container(
                              //           width: 150,
                              //           margin:
                              //           const EdgeInsets.symmetric(
                              //               horizontal: 11.0),
                              //           child: ClipRRect(
                              //             borderRadius: BorderRadius.circular(
                              //                 15.0),
                              //             child: Stack(
                              //               children: <Widget>[
                              //                 Positioned.fill(
                              //                     child: Image.asset(
                              //                         'assets/roorkee-cab-1.jpeg',
                              //                         fit: BoxFit.cover)
                              //                   // Image.asset(
                              //                   //   destinationsList[i].imageUrl,
                              //                   //   fit: BoxFit.cover,
                              //                   // ),
                              //                 ),
                              //                 Positioned(
                              //                   bottom: 0,
                              //                   left: 0,
                              //                   right: 0,
                              //                   child: Container(
                              //                     padding: EdgeInsets.symmetric(
                              //                         horizontal: 9.0,
                              //                         vertical: 5.0),
                              //                     decoration: BoxDecoration(
                              //                       color: MyColors.lighterBlue,
                              //                       borderRadius: BorderRadius
                              //                           .only(
                              //                         topRight: Radius.circular(
                              //                             15),
                              //                       ),
                              //                     ),
                              //                     child: Column(
                              //                       crossAxisAlignment: CrossAxisAlignment
                              //                           .start,
                              //                       children: <Widget>[
                              //                         Text(
                              //                             "${destinationsList[i]
                              //                                 .placeName}",
                              //                             style: TextStyle(
                              //                                 fontSize: 17,
                              //                                 fontWeight: FontWeight
                              //                                     .bold,
                              //                                 color: Colors
                              //                                     .white)),
                              //                         Text(
                              //                           "${destinationsList[i]
                              //                               .date}",
                              //                           style: Theme
                              //                               .of(context)
                              //                               .textTheme
                              //                               .subtitle
                              //                               .apply(color: Colors
                              //                               .white),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              // Spacer(),
                            ],
                          ),
                        ),
                      );
                    }
                  }else{
                    if(!snapshot.hasData){
                      return Center(child: Text('No user'),);
                    }
                    else{
                      return CircularProgressIndicator();

                    }
                  }
                }
            ),
            // Positioned(
            //   bottom: 0,
            //   height: 70,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.all(11.0),
            //     child: MyBottomNavBar(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  uid(){
    _uid = FirebaseAuth.instance.currentUser.uid;
  }
}


