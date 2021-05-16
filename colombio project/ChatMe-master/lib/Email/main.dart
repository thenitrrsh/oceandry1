import 'package:chatapp/call/screens/callscreens/pickup/pickup_layout.dart';
import 'package:chatapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../alias.dart';
import '../chat.dart';
import '../chat_controller.dart';
import 'allContacts.dart';
import 'compose_Email.dart';
import 'sentMails.dart';
import 'settings.dart';
import 'viewEmail.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chatapp/const.dart';
import 'package:chatapp/DataModel.dart';



// void main() => runApp(new MyApp());


var emails =[
  {"from":"Bharat","subject":"Just an Mail with a long text to test Overflow", "time":"10:00 AM","date":"20 Jan 2021",},
  {"from":"Agarwal","subject":"Just an Mail", "time":"10:20 PM","date":"30 Jan 2021",},
  {"from":"Ba","subject":"Just an Mail", "time":"10:30 PM","date":"30 Jan 2021",},
  {"from":"Bha","subject":"Just an Mail", "time":"10:30 AM","date":"10 Sep 2021",},
];

// String _phone = prefs.getString('phone');



class MyApp extends StatelessWidget {
  var currentUserNo;

  var cachedModel;

  MyApp({@required this.currentUserNo, key, this.cachedModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Emails",
      home: Email(currentUserNo: currentUserNo,),
      theme: ThemeData(
        primarySwatch: black,
        brightness: Brightness.dark,
        accentColor: Colors.red,
        splashColor: Colors.black26,
      ),
    );
  }
}

class Email extends StatefulWidget {
  Email({@required this.currentUserNo, key, this.cachedModel}) : super(key: key);
  final String currentUserNo;

  // ignore: camel_case_types
  DataModel cachedModel;

  // const AppBar({Key key, @required this.cachedModel}) : super(key: key);
  @override

  _AppBarState createState() => _AppBarState(
      // currentUserNo: this.currentUserNo
  );
}


class _AppBarState extends State<Email> {
  final String currentUserNo;
  _AppBarState({Key key, this.currentUserNo}) {
    _filter.addListener(() {
      _userQuery.add(_filter.text.isEmpty ? '' : _filter.text);
    });
  }

  SharedPreferences prefs;


  final TextEditingController _filter = new TextEditingController();

  List<StreamController> controllers = new List<StreamController>();
// ignore: camel_case_types

  String _str = "Heyy There !!";

  void _onPressed(String str){
    setState(() {
      this._str = str + " Button Clicked";
    });
    print(this._str);
  }
  DataModel getModel() {
    widget.cachedModel ??= DataModel(widget.currentUserNo);
    return widget.cachedModel;
  }

  bool showHidden = false, biometricEnabled = false;
  _isHidden(phoneNo) {
    Map<String, dynamic> _currentUser = widget.cachedModel.currentUser;
    return _currentUser[HIDDEN] != null &&
        _currentUser[HIDDEN].contains(phoneNo);
  }
  StreamController<String> _userQuery =
  new StreamController<String>.broadcast();


  List<Map<String, dynamic>> _users = List<Map<String, dynamic>>();
  Widget buildItem(BuildContext context, Map<String, dynamic> user) {
    NavigatorState state = Navigator.of(context);
    if (user[PHONE] as String == widget.currentUserNo) {
      return Container(width: 0, height: 0);
    } else {
      return StreamBuilder(
          stream: getUnread(user).asBroadcastStream(),
          builder: (context, AsyncSnapshot<MessageData> unreadData) {
            int unread = unreadData.hasData &&
                unreadData.data.snapshot.documents.isNotEmpty
                ? unreadData.data.snapshot.documents
                .where((t) => t[TIMESTAMP] > unreadData.data.lastSeen)
                .length
                : 0;
            return Theme(
                data: ThemeData(
                    splashColor:Blue,
                    highlightColor: Colors.transparent),
                child: ListTile(
                    onLongPress: () {
                      ChatController.authenticate(widget.cachedModel,
                          'Authentication needed to unlock the chat.',
                          false,
                          state: state,
                          shouldPop: true,
                          type: Chat.getAuthenticationType(
                              biometricEnabled, widget.cachedModel),
                          prefs: prefs, onSuccess: () async {
                            await Future.delayed(Duration(seconds: 0));
                            unawaited(showDialog(
                                context: context,
                                builder: (context) {
                                  return AliasForm(user, widget.cachedModel);
                                }));
                          });
                    },
                    leading: Chat.avatar(user),
                    title: Text(
                      Chat.getNickname(user),
                      style: TextStyle(color: White),
                    ),
                    onTap: () {
                      // if (widget.cachedModel.currentUser[LOCKED] != null &&
                      //     widget.cachedModel.currentUser[LOCKED]
                      //         .contains(user[PHONE])) {
                      //   NavigatorState state = Navigator.of(context);
                      //   ChatController.authenticate(widget.cachedModel,
                      //       'Authentication needed to unlock the chat.',
                      //       state: state,
                      //       shouldPop: false,
                      //       type: Chat.getAuthenticationType(
                      //           biometricEnabled, widget.cachedModel),
                      //       prefs: prefs, onSuccess: () {
                      //         state.pushReplacement(new MaterialPageRoute(
                      //             builder: (context) => new ChatScreen(
                      //
                      //                 unread: unread,
                      //                 model: widget.cachedModel,
                      //                 currentUserNo: widget.currentUserNo,
                      //                 peerNo: user[PHONE] as String)));
                      //       });
                      // } else

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new ChatScreen(
                                    // unread: unread,
                                    model: widget.cachedModel,
                                    currentUserNo: widget.currentUserNo,
                                    peerNo: user[PHONE] as String)));

                    },
                    trailing: Container(
                      child: unread != 0
                          ? Text(unread.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                          : Container(width: 0, height: 0),
                      padding: const EdgeInsets.all(7.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: user[LAST_SEEN] == true
                            ? Colors.green
                            : Colors.grey,
                      ),
                    )));
          });
    }
  }


  Stream<MessageData> getUnread(Map<String, dynamic> user) {
    String chatId = Chat.getChatId(widget.currentUserNo, user[PHONE]);
    var controller = StreamController<MessageData>.broadcast();
    // unreadSubscriptions.add(Firestore.instance
    //     .collection(MESSAGES)
    //     .document(chatId)
    //     .snapshots()
    //     .listen((doc) {
    //   if (doc[currentUserNo] != null && doc[currentUserNo] is int) {
    //     unreadSubscriptions.add(Firestore.instance
    //         .collection(MESSAGES)
    //         .document(chatId)
    //         .collection(chatId)
    //         .snapshots()
    //         .listen((snapshot) {
    //       controller.add(
    //           MessageData(snapshot: snapshot, lastSeen: doc[currentUserNo]));
    //     }));
    //   }
    // }));
    controllers.add(controller);
    return controller.stream;
  }

  _chats(Map<String, Map<String, dynamic>> _userData, Map<String, dynamic> currentUser) {
    _users = Map.from(_userData)
        .values
        .where((_user) => _user.keys.contains(CHAT_STATUS))
        .toList()
        .cast<Map<String, dynamic>>();
    Map<String, int> _lastSpokenAt = widget.cachedModel.lastSpokenAt;
    List<Map<String, dynamic>> filtered = List<Map<String, dynamic>>();

    _users.sort((a, b) {
      int aTimestamp = _lastSpokenAt[a[PHONE]] ?? 0;
      int bTimestamp = _lastSpokenAt[b[PHONE]] ?? 0;
      return bTimestamp - aTimestamp;
    });

    if (!showHidden) {
      _users.removeWhere((_user) => _isHidden(_user[PHONE]));
    }

    return Stack(
      children: <Widget>[
        // RefreshIndicator(
        //     onRefresh: () {
        //       if (showHidden == false && _userData.length != _users.length) {
        //         isAuthenticating = true;
        //         ChatController.authenticate(_cachedModel,
        //             'Authentication needed to show the hidden chats.',
        //             shouldPop: true,
        //             type: Chat.getAuthenticationType(
        //                 biometricEnabled, _cachedModel),
        //             state: Navigator.of(context),
        //             prefs: prefs, onSuccess: () {
        //               isAuthenticating = false;
        //               setState(() {
        //                 showHidden = true;
        //               });
        //             });
        //       } else {
        //         if (showHidden != false)
        //           setState(() {
        //             showHidden = false;
        //           });
        //         return Future.value(false);
        //       }
        //       return Future.value(false);
        //     },
             Container(
                child: _users.isNotEmpty
                    ?
                StreamBuilder(
                    stream: _userQuery.stream.asBroadcastStream(),
                    builder: (context, snapshot) {
                      if (_filter.text.isNotEmpty ||
                          snapshot.hasData && snapshot.data.isNotEmpty) {
                        filtered = this._users.where((user) {
                          return user[NICKNAME]
                              .toLowerCase()
                              .trim()
                              .contains(new RegExp(r'' +
                              _filter.text.toLowerCase().trim() +
                              ''));
                        }).toList();
                        if (filtered.isNotEmpty)
                          return ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemBuilder: (context, index) => buildItem(
                                context, filtered.elementAt(index)),
                            itemCount: filtered.length,
                          );
                        else
                          return ListView(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top:
                                    MediaQuery.of(context).size.height /
                                        3.5),
                                child: Center(
                                  child: Text('No search results.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: White,
                                      )),
                                ))
                          ]);
                      }
                      return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemBuilder: (context, index) =>
                            buildItem(context, _users.elementAt(index)),
                        itemCount: _users.length,
                      );
                    })
                    : ListView(children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3.5),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                                'Send email by pressing the button at bottom right!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: White,
                                ))),
                      ))
                ])),
      ],
    );
  }

  @override
  Icon actionIcon = new Icon(Icons.search); // ignore: override_on_non_overriding_field
  Widget appBarTitle = new Text("All Email");
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Chat.getNTPWrappedWidget(WillPopScope(
        onWillPop: ()
        {
      // if (!isAuthenticating) setLastSeen();
      return Future.value(true);
    },
    child: ScopedModel<DataModel>(
    model: getModel(),
    child: ScopedModelDescendant<DataModel>(
    builder: (context, child, _model) {
    widget.cachedModel = _model;
    return

    // userId: widget.currentUserId,
    // phoneNo: widget.currentUserNo,

        Scaffold(
            resizeToAvoidBottomPadding: false,

            appBar: AppBar(
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(icon: Icon(Icons.group),tooltip: 'Contacts', onPressed: (){
                  _onPressed("Peoples");
                  //allContacts(appbar: "All Contacts",);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>allContacts(),
                  )
                  );
                }
                ),
                new IconButton(icon: actionIcon,onPressed:(){
                  setState(() {
                    if ( this.actionIcon.icon == Icons.search){
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 25.0
                        ),
                        decoration: new InputDecoration(
                            prefixIcon: new Icon(Icons.search,color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)
                        ),
                      );}
                    else {
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle = new Text("All Emails");
                    }
                  });
                },
                ),
              ],
            ),

      // appBar: AppBar(
      //   title: appBarTitle,
      //   actions: <Widget>[
      //     new IconButton(icon: Icon(Icons.group),tooltip: 'Contacts', onPressed: (){
      //       _onPressed("Peoples");
      //       //allContacts(appbar: "All Contacts",);
      //       Navigator.push(context, MaterialPageRoute(
      //           builder: (context)=>allContacts(),
      //           )
      //         );
      //       }
      //     ),
      //     new IconButton(icon: actionIcon,onPressed:(){
      //       setState(() {
      //         if ( this.actionIcon.icon == Icons.search){
      //           this.actionIcon = new Icon(Icons.close);
      //           this.appBarTitle = new TextField(
      //             style: new TextStyle(
      //               color: Colors.white,
      //               fontSize: 25.0
      //             ),
      //             decoration: new InputDecoration(
      //                 prefixIcon: new Icon(Icons.search,color: Colors.white),
      //                 hintText: "Search...",
      //                 hintStyle: new TextStyle(color: Colors.white)
      //             ),
      //           );}
      //         else {
      //           this.actionIcon = new Icon(Icons.search);
      //           this.appBarTitle = new Text("All Emails");
      //         }
      //       });
      //     },
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            _onPressed("Compose");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>composeEmail()));
          },
        tooltip: 'Compose',
        child: Icon(Icons.edit),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[

                  // StreamBuilder(
                  //     stream: _userQuery.stream.asBroadcastStream(),
                  //     builder: (context, snapshot) {
                  //       if (_filter.text.isNotEmpty ||
                  //           snapshot.hasData && snapshot.data.isNotEmpty) {
                  //         filtered = this._users.where((user) {
                  //           return user[NICKNAME]
                  //               .toLowerCase()
                  //               .trim()
                  //               .contains(new RegExp(r'' +
                  //               _filter.text.toLowerCase().trim() +
                  //               ''));
                  //         }).toList();
                  //         if (filtered.isNotEmpty)
                  //           return ListView.builder(
                  //             padding: EdgeInsets.all(10.0),
                  //             itemBuilder: (context, index) => buildItem(
                  //                 context, filtered.elementAt(index)),
                  //             itemCount: filtered.length,
                  //           );
                  //         else
                  //           return ListView(children: [
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     top:
                  //                     MediaQuery.of(context).size.height /
                  //                         3.5),
                  //                 child: Center(
                  //                   child: Text('No search results.',
                  //                       textAlign: TextAlign.center,
                  //                       style: TextStyle(
                  //                         fontSize: 18,
                  //                         color: White,
                  //                       )),
                  //                 ))
                  //           ]);
                  //       }
                  //       return ListView.builder(
                  //         padding: EdgeInsets.all(10.0),
                  //         itemBuilder: (context, index) =>
                  //             buildItem(context, _users.elementAt(index)),
                  //         itemCount: _users.length,
                  //       );
                  //     })


                  // CircleAvatar(
                  //   radius: 45.0,
                  //   backgroundImage: AssetImage("images/user_profile.png"),
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // Text(
                  //   'Bharat Agarwal',
                  //   style: TextStyle(color: Colors.white,fontSize: 30.0),
                  // ),
                ],
              ),
              decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                ),
                //color: Colors.red,
              ),
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.email),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Emails',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
               // _onPressed("All Email");
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("hey There")),);
              },
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.send),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Sent Mails',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
                _onPressed("Sent Mails");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sentMails()));
              },
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.settings),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Settings',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
                _onPressed("Settings");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>settings_go()));
              },
            ),
          ],
        ),
      ),
      /*body:Center(
        child: Text(_str,style: TextStyle(
            color: Colors.black,
          fontSize: 20.0
          ),
        ),
      ),*/
      body: _chats(_model.userData, _model.currentUser)
      // Container(
      //   child: ListView(
      //       children: emails.map((email){
      //         return InkWell(
      //           onTap: (){
      //               print(email);
      //               Navigator.push(context, MaterialPageRoute(
      //                   builder: (context)=>viewEmail(from: email['from'],subject: email['subject'],time: email['time'],date: email['date'],to: "me",),
      //                 ),
      //               );
      //             },
      //           child: Container(
      //
      //             margin: EdgeInsets.all(5.0),
      //             padding: EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //               border: Border.all(),
      //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Row(
      //                   mainAxisSize: MainAxisSize.max,
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     CircleAvatar(
      //                       radius: 25.0,
      //                       backgroundImage: AssetImage("images/user_profile.png"),
      //                     ),
      //
      //                     SizedBox(width: 20.0,),
      //
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                         email['from'],
      //                         overflow: TextOverflow.ellipsis,
      //                         style: TextStyle(
      //                             fontSize: 20.0,
      //                           fontWeight: FontWeight.bold
      //                         )
      //                         ),
      //                         Container(
      //                           width: 100.0,
      //                           child: Text(
      //                             email['subject'],
      //                             overflow: TextOverflow.ellipsis,
      //                             style: TextStyle(color: Colors.white),
      //                           ),
      //                         ),
      //
      //
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //                 Column(
      //                   children: [
      //                     Text(
      //                       email['time'],
      //                       style: TextStyle(
      //                         color: Colors.blue,
      //                         // fontSize: 5.0,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     )
      //                   ],
      //                 )
      //
      //               ],
      //             )
      //             // ListTile(
      //             //   leading: CircleAvatar(
      //             //     radius: 25.0,
      //             //     backgroundImage: AssetImage("images/user_profile.png"),
      //             //   ),
      //             //   title: Padding(
      //             //     padding: const EdgeInsets.all(8.0),
      //             //     child: Container(
      //             //         child: Row(
      //             //           mainAxisAlignment: MainAxisAlignment.start,
      //             //           crossAxisAlignment: CrossAxisAlignment.start,
      //             //           children: <Widget>[
      //             //
      //             //             Padding(
      //             //               padding: const EdgeInsets.only(left: 10.0),
      //             //               child: Container(
      //             //                 child: Column(
      //             //                   mainAxisAlignment: MainAxisAlignment.start,
      //             //                   crossAxisAlignment: CrossAxisAlignment.start,
      //             //                   children: <Widget>[
      //             //                     Text(
      //             //                       email['from'],
      //             //                       overflow: TextOverflow.ellipsis,
      //             //                       style: TextStyle(
      //             //                           fontSize: 20.0,
      //             //                         fontWeight: FontWeight.bold
      //             //                       ),
      //             //                     ),
      //             //                     SizedBox(
      //             //                       width: 15.0,
      //             //                       height: 10.0,
      //             //                     ),
      //             //                     SizedBox(
      //             //                       width: 150.0,
      //             //                       child:  Text(
      //             //                         email['subject'],
      //             //                         overflow: TextOverflow.ellipsis,
      //             //                         style: TextStyle(color: Colors.black54),
      //             //                       ),
      //             //                     )
      //             //
      //             //                   ],
      //             //                 ),
      //             //               ),
      //             //             ),
      //             //           ],
      //             //         )
      //             //     ),
      //             //   ),
      //             //   trailing: Container(
      //             //     // height: 85.0,
      //             //     // width: 80.0,
      //             //     child: Expanded(
      //             //       flex: 2,
      //             //       child: Column(
      //             //         mainAxisAlignment: MainAxisAlignment.start,
      //             //         mainAxisSize: MainAxisSize.min,
      //             //         children: <Widget>[
      //             //           Text(
      //             //             email['time'],
      //             //             style: TextStyle(
      //             //               color: Colors.blue,
      //             //               // fontSize: 5.0,
      //             //               fontWeight: FontWeight.bold,
      //             //             ),
      //             //           ),
      //             //           // SizedBox(
      //             //           //   height: 5.0,
      //             //           // ),
      //             //           //Icon(Icons.star_border),
      //             //           IconButton(icon: Icon(Icons.star_border), onPressed: (){print(email);})
      //             //         ],
      //             //       ),
      //             //     ),
      //             //   ),
      //             //   onTap: (){
      //             //     print(email);
      //             //     Navigator.push(context, MaterialPageRoute(
      //             //         builder: (context)=>viewEmail(from: email['from'],subject: email['subject'],time: email['time'],date: email['date'],to: "me",),
      //             //       ),
      //             //     );
      //             //   },
      //             // ),
      //           ),
      //         );
      //       }).toList(),
      //   ),
      // ),

      );
    }),
    )));

  }

}
const MaterialColor black = const MaterialColor(
  0xFF000000,
  const <int, Color>{
    50: const Color(0x42000000),
    100: const Color(0x42000000),
    200: const Color(0x42000000),
    300: const Color(0x42000000),
    400: const Color(0x42000000),
    500: const Color(0x42000000),
    600: const Color(0x42000000),
    700: const Color(0x42000000),
    800: const Color(0x42000000),
    900: const Color(0x42000000),
  },
);

class MessageData {
  int lastSeen;
  QuerySnapshot snapshot;
  MessageData({@required this.snapshot, @required this.lastSeen});
}




