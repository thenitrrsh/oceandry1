import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_web/firebase.dart';
// import 'package:firebase_web/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
// import 'package:image_picker/image_picker.dart';
// // import 'package:unshadow/app_icons.dart';
// import 'package:unshadow/models/post_data.dart';
// import 'package:unshadow/pages/login_page.dart';
// import 'package:unshadow/widgets/psypist_app_bar.dart';

class AddUser extends StatefulWidget{

  @override
  _AddPlanState createState() => _AddPlanState();

}

class _AddPlanState extends State<AddUser>{

  // File _image;
  // PickedFile _pickedImage;
  // String _userType, birthDateInString;
  //
  // List<String> _timeSlot = [], _niche = [];
  //
  final RegExp _numeric = RegExp(r'^-?[0-9]+$');
  //
  // DateTime _selectedDOB;
  // var myFormat = DateFormat('dd-MM-yyyy');

  TextEditingController _userName = new TextEditingController();
  TextEditingController _planExpire = new TextEditingController();
  // TextEditingController _planUserLimit = new TextEditingController();
  // TextEditingController _planPrice = new TextEditingController();
  TextEditingController _userPassword = new TextEditingController();

  // TextEditingController _fullAddress = new TextEditingController();
  // TextEditingController _townCity = new TextEditingController();
  // TextEditingController _state = new TextEditingController();
  // TextEditingController _experience = new TextEditingController();
  //
  // int _timeSlotCounter = 1, _nicheCounter = 1;

  // int

  // int j = 1, _buffer1 = 1;
  //
  // List<int> _counters = [_count, _count2, _count3, _count4];

  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Firestore _fireStore = Firestore.instance;


  @override
  Widget build(BuildContext context) {

//     List<Widget> _kiranaFields =
//     new List.generate(_buffer1, (int i) => Center(
//       child: Container(
//         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
// //                                  height: 170.0,
// //        width: 340,
//         margin: EdgeInsets.all(10.0),
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: <Widget>[
//             productSize,
//             SizedBox(height: 10.0,),
//             Row(
//               children: <Widget>[
//                 Container(
// //                                          margin: EdgeInsets.all(10.0),
//                     width: halfMediaWidth,
//                     child:productPrice
//                 ),
//                 SizedBox(width:10),
//                 Container(
// //                                          margin: EdgeInsets.all(10.0),
//                     width: halfMediaWidth,
//                     child:productQuantity
//                 ),
//               ],),
//           ],
//         ),
//       ),
//     ));
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Enter Reseller Detail',)),
      body: Center(
        child: Card(
          elevation: 2.0,
          child: Container(
            // padding: EdgeInsets.all(42),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                // Container(
                //   margin: EdgeInsets.only(bottom: 10.0),
                //   // color: Colors.red,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       InkWell(
                //         onTap: (){
                //           _chooseFile();
                //         },
                //         child: Stack(
                //           children: [
                //             Container(
                //               height: 130.0,
                //               width: 130.0,
                //               child: _image != null ?  ClipRRect(
                //                   borderRadius: BorderRadius.circular(100.0),
                //                   child: Image.file(_image, fit: BoxFit.fill,)):
                //               ClipRRect(
                //                   borderRadius: BorderRadius.circular(100.0),
                //                   child: Image.network('https://i.pinimg.com/474x/bc/d4/ac/bcd4ac32cc7d3f98b5e54bde37d6b09e.jpg', fit: BoxFit.fill,)),
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Color(0xffe6f9f7),
                //                 // image: DecorationImage(
                //                 //   image:
                //                 // )
                //               ),
                //             ),
                //             // CircleAvatar(
                //             //   // child: _image == null ? Center(child: Icon(AppIcons.user_bottom_icon,size: 20.0,)) : Container(),
                //             //   backgroundImage: _image != null ?  Image.file(_image,
                //             //     // fit: BoxFit.fill,
                //             //   )
                //             //       : NetworkImage('https://i.pinimg.com/474x/bc/d4/ac/bcd4ac32cc7d3f98b5e54bde37d6b09e.jpg'),
                //             //   minRadius: 60.0,
                //             //   backgroundColor: Color(0xffe6f9f7),
                //             // ),
                //             Positioned(
                //               bottom: 0.0,
                //               right: 0.0,
                //               child: Container(
                //                 padding: EdgeInsets.all(5.0),
                //                 decoration: BoxDecoration(
                //                     shape: BoxShape.circle,
                //                     color: Color(0xff28b3b8)
                //                 ),
                //                 child: Icon(Icons.camera_alt, color: Colors.white,),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // DropdownButton(
                //   // isDense: true,
                //   hint: _userType == null
                //       ? Text('User Type')
                //       : Text( firstWordCapital(_userType),
                //     // _userType,
                //     // style: TextStyle(color: Colors.blue),
                //   ),
                //   isExpanded: true,
                //   underline: Container(color: Colors.grey, height: 1.0,),
                //   iconSize: 30.0,
                //   style: TextStyle(color: Colors.blue, fontSize: 15.5),
                //   items: ['Doctor','Normal User'].map(
                //         (val) {
                //       return DropdownMenuItem<String>(
                //         value: val,
                //         child: Text(val),
                //       );
                //     },
                //   ).toList(),
                //   onChanged: (String val) {
                //     setState(
                //           () {
                //         _userType = val.toLowerCase();
                //       },
                //     );
                //   },
                // ),
                //
                // SizedBox(height: 15.0,),
                //
                //
                // // Container(
                // //     margin: EdgeInsets
                // //         .only(top:10.0),
                // //     child:
                // DropdownButton(
                //   hint: Text('Choose your interests upto 3'),
                //   isExpanded: true,
                //   iconSize: 30.0,
                //   underline: Container(color: Colors.grey, height: 1.0,),
                //   style: TextStyle(
                //       color: Colors
                //           .blue),
                //   items: [
                //     'Migraine',
                //     'OCD',
                //     'Anxiety',
                //     'Pica', 'Depression',
                //     'Panic', 'Bipolar', 'Schizophrenia', 'Autism', 'PTSD',
                //     'Insomnia', 'Dementia', 'Mania', 'GAD', 'Agoraphobia',
                //     'SAD', 'DID', 'SSD', 'Pyromania', 'Narcolepsy', 'Kleptomania',
                //     'Hypersomnolence', 'IED', 'Delirium', 'Parasomnias',
                //     'Trichotillomania'
                //   ].map(
                //         (val) {
                //       return DropdownMenuItem<
                //           String>(
                //         value: val,
                //         child: Text(
                //             val),
                //       );
                //     },
                //   ).toList(),
                //   onChanged: (String val) {
                //     setState(
                //           () {
                //
                //         if(_niche.contains(val.toLowerCase())){
                //           Fluttertoast.showToast(msg: 'Choose different time');
                //         }
                //
                //         else{
                //
                //           if(_nicheCounter == 1){
                //             _niche.insert(0, val.toLowerCase());
                //           }
                //           else{
                //             if(_nicheCounter == 2){
                //               _niche.insert(1, val.toLowerCase());
                //             }
                //             else{
                //               if(_nicheCounter == 3) {
                //                 _niche.insert(2, val.toLowerCase());
                //               }
                //               // else{
                //               //   if(_nicheCounter == 4) {
                //               //     _niche.insert(0, val.toLowerCase());
                //               //   }
                //               // }
                //             }
                //           }
                //
                //           _nicheCounter++;
                //
                //         }
                //       },
                //     );
                //   },
                //   // )
                // ),
                //
                //
                //
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //
                //     _niche.length > 0 ? Container(
                //       padding: EdgeInsets.all(5.0),
                //
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius
                //             .all(Radius
                //             .circular(
                //             10.0)),
                //         // border: Border(left: BorderSide( color: Colors.black,
                //         //   width: 3.0,),),
                //         color: Color(
                //             0xff28b3b8),
                //       ),
                //       child: Text(_niche[0],
                //           style: TextStyle(
                //               color: Colors
                //                   .white)),
                //     ) :
                //     Container(height: 0.0, width: 0.0,),
                //
                //     _niche.length > 1 ? Container(
                //       padding: EdgeInsets.all(5.0),
                //
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius
                //             .all(Radius
                //             .circular(
                //             10.0)),
                //         // border: Border(left: BorderSide( color: Colors.black,
                //         //   width: 3.0,),),
                //         color: Color(
                //             0xff28b3b8),
                //       ),
                //       child: Text(_niche[1],
                //           style: TextStyle(
                //               color: Colors
                //                   .white)),
                //     )
                //         :Container(height: 0.0, width: 0.0,) ,
                //
                //
                //     // _niche.length > 2 ? Container(
                //     //   padding: EdgeInsets.all(5.0),
                //     //
                //     //   decoration: BoxDecoration(
                //     //     borderRadius: BorderRadius
                //     //         .all(Radius
                //     //         .circular(
                //     //         10.0)),
                //     //     // border: Border(left: BorderSide( color: Colors.black,
                //     //     //   width: 3.0,),),
                //     //     color: Color(
                //     //         0xff28b3b8),
                //     //   ),
                //     //   child: Text(_niche[2],
                //     //       style: TextStyle(
                //     //           color: Colors
                //     //               .white)),
                //     // )
                //     //     : Container(height: 0.0, width: 0.0,) ,
                //
                //     // _timeSlot1 == null || _timeSlot3 != null
                //     _niche.length < 2 &&
                //         _niche.isNotEmpty ? InkWell(
                //         onTap: (){
                //           setState(() {
                //             _niche.clear();
                //           });
                //           // _timeSlot1 = null;
                //           // _timeSlot2 = null;
                //           // // _niche3 = null;
                //           _nicheCounter = 1;
                //         },
                //         child: Icon(Icons.cancel_outlined))
                //         : Container(height: 0.0, width: 0.0,)
                //
                //   ],
                // ),
                //
                // SizedBox(height: 10.0,),
                //
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     _niche.length > 2 ? Container(
                //       padding: EdgeInsets.all(5.0),
                //
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius
                //             .all(Radius
                //             .circular(
                //             10.0)),
                //         // border: Border(left: BorderSide( color: Colors.black,
                //         //   width: 3.0,),),
                //         color: Color(
                //             0xff28b3b8),
                //       ),
                //       child: Text(_niche[2],
                //           style: TextStyle(
                //               color: Colors
                //                   .white)),
                //     )
                //         : Container(height: 0.0, width: 0.0,) ,
                //
                //     // _timeSlot.length > 3 ? Container(
                //     //   padding: EdgeInsets.all(5.0),
                //     //
                //     //   decoration: BoxDecoration(
                //     //     borderRadius: BorderRadius
                //     //         .all(Radius
                //     //         .circular(
                //     //         10.0)),
                //     //     // border: Border(left: BorderSide( color: Colors.black,
                //     //     //   width: 3.0,),),
                //     //     color: Color(
                //     //         0xff28b3b8),
                //     //   ),
                //     //   child: Text(_timeSlot[3],
                //     //       style: TextStyle(
                //     //           color: Colors
                //     //               .white)),
                //     // )
                //     //     :Container(height: 0.0, width: 0.0,),
                //
                //     _niche.length > 2 ? InkWell(
                //         onTap: (){
                //           setState(() {
                //             _niche.clear();
                //           });
                //           // _timeSlot1 = null;
                //           // _timeSlot2 = null;
                //           // _timeSlot3 = null;
                //           // _timeSlot4 = null;
                //           // // _niche3 = null;
                //           _nicheCounter = 1;
                //         },
                //         child: Icon(Icons.cancel_outlined))
                //         : Container(height: 0.0, width: 0.0,)
                //   ],
                // ),


                // _accountFields('Username'),
                // _accountFields('Full name', _fullName, false),
                // _accountFields('Profession', _profession, false),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top:10.0),
                  child: TextFormField(
                    controller: _userName,

                    maxLines: 1,
                    maxLength: 25,
                    decoration: InputDecoration(
                      // suffixText: '.com',
                      labelStyle: TextStyle(fontSize: 16),
                      labelText: 'Username',
                      contentPadding: EdgeInsets.only(bottom: 0),
                    ),
                    // obscureText: true,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top:10.0),
                  child: TextFormField(
                    controller: _userPassword,
                    maxLines: 1,
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 16),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.only(bottom: 0),
                    ),
                    // obscureText: true,
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(top:10.0),
                //   child: TextFormField(
                //     controller: _planUserLimit,
                //     maxLines: 1,
                //     keyboardType: TextInputType.number,
                //     maxLength: 4,
                //     decoration: InputDecoration(
                //       labelStyle: TextStyle(fontSize: 16),
                //       labelText: 'User Limit',
                //       contentPadding: EdgeInsets.only(bottom: 0),
                //     ),
                //     // obscureText: true,
                //   ),
                // ),

                // InkWell(
                //     onTap: () async{
                //
                //       final datePick= await showDatePicker(
                //           context: context,
                //           initialDate: new DateTime(1996,8,18),
                //           firstDate: new DateTime(1900),
                //           lastDate: new DateTime(2012)
                //       );
                //       if(datePick!=null){
                //         setState(() {
                //           _selectedDOB=datePick;
                //           // isDateSelected=true;
                //           // put it here
                //           birthDateInString = "${_selectedDOB.month}/${_selectedDOB.day}/${_selectedDOB.year}"; // 08/14/2019
                //
                //         });
                //       }
                //
                //       // showDialog(context: context, builder: (context) =>  AlertDialog(
                //       //   content: _dobCalendar(),
                //       //   actions: <Widget>[
                //       //     FlatButton(
                //       //       child: Text("Ok"),
                //       //       onPressed: () {
                //       //         setState(() {
                //       //           // _click1 = true;
                //       //         });
                //       //         Navigator.of(context).pop();},
                //       //     ),
                //       //   ],
                //       // ));
                //
                //     },
                //     child: Container(
                //       // color: Colors.red,
                //         margin: EdgeInsets.only(top:26.0),
                //         // height: 40.0,
                //         width: MediaQuery.of(context).size.width,
                //         child: Column(
                //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //
                //               children: [
                //                 Text(_selectedDOB == null ? 'Date of birth' : '${myFormat.format(_selectedDOB)}', style: TextStyle(color: Colors.black54, fontSize: 16.0),),
                //                 Icon(Icons.calendar_today_outlined, color: Colors.black54,)
                //               ],
                //             ),
                //             SizedBox(height: 10.0,),
                //             Divider(color: Colors.grey,thickness: 1.0,)
                //           ],
                //         )
                //       // _accountFields('$_selectedDOB', null, true)
                //     )),

                Container(
                  margin: EdgeInsets.only(top:10.0),
                  child: TextFormField(
                    controller: _planExpire,
                    maxLines: 1,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 16),
                      labelText: 'user expire in days',
                      contentPadding: EdgeInsets.only(bottom: 0),
                    ),
                    // obscureText: true,
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(top:10.0),
                //   child: TextFormField(
                //     controller: _planPrice,
                //     maxLines: 1,
                //     maxLength: 5,
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(
                //       labelStyle: TextStyle(fontSize: 16),
                //       labelText: 'Plan Price in \$',
                //       contentPadding: EdgeInsets.only(bottom: 0),
                //     ),
                //     // obscureText: true,
                //   ),
                // ),

                // _accountFields('About', _about, false),

                // _userType == "doctor" ? Column(
                //   children: [
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _fullAddress,
                //         maxLines: 1,
                //         maxLength: 50,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'Full Address',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _pinCode,
                //         maxLines: 1,
                //         maxLength: 6,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'Pincode',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _townCity,
                //         maxLines: 1,
                //         maxLength: 20,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'Town/City',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _state,
                //         maxLines: 1,
                //         maxLength: 20,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'State',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _price,
                //         maxLines: 1,
                //         maxLength: 4,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'Price/visit',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //       margin: EdgeInsets.only(top:10.0),
                //       child: TextFormField(
                //         controller: _experience,
                //         maxLines: 1,
                //         maxLength: 50,
                //         decoration: InputDecoration(
                //           labelStyle: TextStyle(fontSize: 16),
                //           labelText: 'Experience',
                //           contentPadding: EdgeInsets.only(bottom: 0),
                //         ),
                //         // obscureText: true,
                //       ),
                //     ),
                //
                //     Container(
                //         margin: EdgeInsets
                //             .only(top:10.0),
                //         child: DropdownButton(
                //           hint: Text('Choose time slot upto 4'),
                //           isExpanded: true,
                //           iconSize: 30.0,
                //           underline: Container(color: Colors.grey, height: 1.0,),
                //           style: TextStyle(
                //               color: Colors
                //                   .blue),
                //           items: [
                //             '10:30 AM',
                //             '11:30 AM',
                //             '12:30 PM',
                //             '01:30 PM'
                //           ].map(
                //                 (val) {
                //               return DropdownMenuItem<
                //                   String>(
                //                 value: val,
                //                 child: Text(
                //                     val),
                //               );
                //             },
                //           ).toList(),
                //           onChanged: (String val) {
                //             setState(
                //                   () {
                //
                //                 if(_timeSlot.contains(val.toLowerCase())){
                //                   Fluttertoast.showToast(msg: 'Choose different time');
                //                 }
                //
                //                 else{
                //
                //                   if(_timeSlotCounter == 1){
                //                     _timeSlot.insert(0, val.toLowerCase());
                //                   }
                //                   else{
                //                     if(_timeSlotCounter == 2){
                //                       _timeSlot.insert(1, val.toLowerCase());
                //                     }
                //                     else{
                //                       if(_timeSlotCounter == 3) {
                //                         _timeSlot.insert(2, val.toLowerCase());
                //                       }
                //                       else{
                //                         if(_timeSlotCounter == 4) {
                //                           _timeSlot.insert(0, val.toLowerCase());
                //                         }
                //                       }
                //                     }
                //                   }
                //
                //                   _timeSlotCounter++;
                //
                //                 }
                //               },
                //             );
                //           },
                //         )
                //     ),
                //
                //     Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //
                //         _timeSlot.length > 0 ? Container(
                //           padding: EdgeInsets.all(5.0),
                //
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius
                //                 .all(Radius
                //                 .circular(
                //                 10.0)),
                //             // border: Border(left: BorderSide( color: Colors.black,
                //             //   width: 3.0,),),
                //             color: Color(
                //                 0xff28b3b8),
                //           ),
                //           child: Text(_timeSlot[0],
                //               style: TextStyle(
                //                   color: Colors
                //                       .white)),
                //         ) :
                //         Container(height: 0.0, width: 0.0,),
                //
                //         _timeSlot.length > 1 ? Container(
                //           padding: EdgeInsets.all(5.0),
                //
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius
                //                 .all(Radius
                //                 .circular(
                //                 10.0)),
                //             // border: Border(left: BorderSide( color: Colors.black,
                //             //   width: 3.0,),),
                //             color: Color(
                //                 0xff28b3b8),
                //           ),
                //           child: Text(_timeSlot[1],
                //               style: TextStyle(
                //                   color: Colors
                //                       .white)),
                //         )
                //             :Container(height: 0.0, width: 0.0,) ,
                //
                //         // _timeSlot1 == null || _timeSlot3 != null
                //         _timeSlot.length < 3 && _timeSlot.isNotEmpty ? InkWell(
                //             onTap: (){
                //               setState(() {
                //                 _timeSlot.clear();
                //
                //               });
                //               // _timeSlot1 = null;
                //               // _timeSlot2 = null;
                //               // // _niche3 = null;
                //               _timeSlotCounter = 1;
                //             },
                //             child: Icon(Icons.cancel_outlined))
                //             : Container(height: 0.0, width: 0.0,)
                //
                //       ],
                //     ),
                //
                //     SizedBox(height: 10.0,),
                //
                //     Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         _timeSlot.length > 2 ? Container(
                //           padding: EdgeInsets.all(5.0),
                //
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius
                //                 .all(Radius
                //                 .circular(
                //                 10.0)),
                //             // border: Border(left: BorderSide( color: Colors.black,
                //             //   width: 3.0,),),
                //             color: Color(
                //                 0xff28b3b8),
                //           ),
                //           child: Text(_timeSlot[2],
                //               style: TextStyle(
                //                   color: Colors
                //                       .white)),
                //         )
                //             : Container(height: 0.0, width: 0.0,) ,
                //
                //         _timeSlot.length > 3 ? Container(
                //           padding: EdgeInsets.all(5.0),
                //
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius
                //                 .all(Radius
                //                 .circular(
                //                 10.0)),
                //             // border: Border(left: BorderSide( color: Colors.black,
                //             //   width: 3.0,),),
                //             color: Color(
                //                 0xff28b3b8),
                //           ),
                //           child: Text(_timeSlot[3],
                //               style: TextStyle(
                //                   color: Colors
                //                       .white)),
                //         )
                //             :Container(height: 0.0, width: 0.0,),
                //
                //         _timeSlot.length > 2 ? InkWell(
                //             onTap: (){
                //               setState(() {
                //                 _timeSlot.clear();
                //               });
                //               // _timeSlot1 = null;
                //               // _timeSlot2 = null;
                //               // _timeSlot3 = null;
                //               // _timeSlot4 = null;
                //               // // _niche3 = null;
                //               _timeSlotCounter = 1;
                //             },
                //             child: Icon(Icons.cancel_outlined))
                //             : Container(height: 0.0, width: 0.0,)
                //       ],
                //     ),
                //
                //
                //
                //   ],
                // )
                //     : Container(),

                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  padding: EdgeInsets.symmetric(horizontal:40.0),
                  height: 45.0,
                  // width: 50.0,
                  // constraints: BoxConstraints(minWidth: 50.0),
                  // color: Colors.red,
                  child: MaterialButton(
                    onPressed: () {

                      // if(_userType == 'doctor') {
                      //
                      //   if (_userType == null || _selectedDOB == null ||
                      //       _image == null || _fullName.text.isEmpty || _timeSlot.isEmpty ||
                      //       _profession.text.isEmpty || _about.text.isEmpty || _fullAddress.text.isEmpty || !isNumeric(_pinCode.text) || _pinCode.text.isEmpty ||
                      //       _townCity.text.isEmpty || _state.text.isEmpty || !isNumeric( _price.text) || _price.text.isEmpty || _experience.text.isEmpty
                      //       || _niche.isEmpty) {
                      //     // Fluttertoast.showToast(msg: );
                      //     showToast('Please fill all the details correctly and choose an image',
                      //         Colors.black);
                      //   }
                      //   else {
                      //     // if(_userType == 'doctor') {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 LoginPage(
                      //                   image: _image,
                      //                   userType: _userType,
                      //                   fullName: _fullName.text.trim().toLowerCase(),
                      //                   dob: myFormat.format(_selectedDOB),
                      //                   about: _about.text.trim().toLowerCase(),
                      //                   profession: _profession.text.trim().toLowerCase(),
                      //                   again: true,
                      //                   fullAddress: _fullAddress.text.trim().toLowerCase(),
                      //                   pinCode: _pinCode.text.trim().trim(),
                      //                   townCity: _townCity.text.trim().toLowerCase(),
                      //                   state: _state.text.trim().toLowerCase(),
                      //                   price: _price.text.trim().toLowerCase(),
                      //                   experience: _experience.text.trim().toLowerCase(),
                      //                   timeSlot: _timeSlot,
                      //                   niche: _niche,
                      //                 )));
                      //   }
                      //
                      // }
                      //
                      // else{

                      Firestore _fireStore = Firestore.instance;

                      if (_userName.text.trim().isEmpty || _userPassword.text.trim().isEmpty || !isNumeric(_planExpire.text.trim()) ) {
                        Fluttertoast.showToast(msg: 'Please fill all the details correctly');
                        // showToast('Please fill all the details correctly',
                        //     Colors.black);
                        // print('AP 886');
                        // setState(() {
                        //   showToast(
                        //     "Please fill all the details correctly",
                        //     // position: ToastPosition.bottom,
                        //     // backgroundColor: Color(0xFFEE507A),
                        //     radius: 20.0,
                        //     // textStyle: TextStyle(fontSize: 18.0,color:Colors.white),
                        //     animationBuilder: Miui10AnimBuilder(),
                        //   );
                        // });
                      }
                      else {




                        _fireStore.collection('created_users').where('user_name', isEqualTo: _userName.text.trim()).getDocuments().then((_planDetail) {

                          if(_planDetail.documents.isNotEmpty){
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: 'User already exists');
                          }
                          else {
                            // print('AP 899');

                            // _showLoadingIndicator();

                            CollectionReference _collectionRef = _fireStore.collection('created_users');

                            DocumentReference _docRef = _collectionRef.document();

                            _collectionRef.document('${_docRef.documentID}').setData({
                              'user_name': '${_userName.text.trim()}',
                              'user_pass': '${_userPassword.text}',
                              'plan_expire': '${_planExpire.text.trim()}',
                              // 'plan_user_limit': '${_planUserLimit.text.trim()}',
                              // 'plan_price': '${_planPrice.text.trim()}',
                              'is_assigned': false,
                              'created_date': DateTime.now()
                            }).then((value) {
                              // Navigator.pop(context);
                              Navigator.pop(context);
                              Fluttertoast.showToast(msg: 'User Created Successfully');
                            });
                          }


                        });

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             LoginPage(
                        //               image: _image,
                        //               userType: _userType,
                        //               fullName: _fullName.text.trim().toLowerCase(),
                        //               dob: myFormat.format(_selectedDOB),
                        //               about: _about.text.trim().toLowerCase(),
                        //               profession: _profession.text.trim()
                        //                   .toLowerCase(),
                        //               again: true,
                        //               niche: _niche,
                        //             )));
                      }
                      // }

                      // Navigator.pushReplacementNamed(context, "/header_footer");
                    },
                    color: Color(0xff28b3b8),
                    // minWidth: 20.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text('Save', style: TextStyle(color: Colors.white),),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _accountFields(String _labelText, TextEditingController _textController) {
  //   return Container(
  //     margin: EdgeInsets.only(top:10.0),
  //     child: TextFormField(
  //       controller: _textController,
  //       maxLines: 1,
  //       decoration: InputDecoration(
  //         labelStyle: TextStyle(fontSize: 16),
  //         labelText: _labelText,
  //         contentPadding: EdgeInsets.only(bottom: 0),
  //       ),
  //       // obscureText: true,
  //     ),
  //   );
  // }

//   Future _chooseFile() async {
//     try {
//       ImagePicker imagePicker = ImagePicker();
//       // PickedFile compressedImage = await imagePicker
//       _pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
//
//       setState(() {
//         if (_pickedImage != null) {
//           _image = File(_pickedImage.path);
//         } else {
//           print('No image selected.');
//         }
//       });
//
//     } catch(e){
//       return e;
//     }
//   }
//
//   void showToast(message, Color color) {
//     print(message);
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         // gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 2,
//         backgroundColor: color,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

  bool _isEmail(){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_userName.text.trim());

    // return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.?#$%&'*+-/=?^_`{|}~]]+@[a-zaA-Z0-9]+\.[a-zA-Z]+").hasMatch(_userName.text.trim());
  }

  _showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20.0,
              ),
              Text("Loading!")
            ],
          ),
        );
      },
    );
  }


}