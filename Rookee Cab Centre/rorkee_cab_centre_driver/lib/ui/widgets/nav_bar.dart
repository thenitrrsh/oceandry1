  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:rorkee_cab_centre_driver/ui/screens/home.dart';
  import 'package:rorkee_cab_centre_driver/ui/screens/profile.dart';
  // import 'PlaceholderWidget.dart';

  class NavBar extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
      return _NavBarState();
    }
  }

  class _NavBarState extends State<NavBar> {
    String _fullName, _mobileNo,_userPic, _userId ;

    int _currentIndex = 0;
    final List<Function> _children = [
          (fullName, mobileNo, userPic, userId) => HomeScreen(),
      null,
    (fullName, mobileNo, userPic, userId) =>Profile(uId: userId,fullName: fullName,mobileNo: mobileNo,usrPic: userPic,)

      // PlaceholderWidget(Colors.white),
      // PlaceholderWidget(Colors.deepOrange),
      // PlaceholderWidget(Colors.green)
    ];

    // @override
    // void initState() {
    //   // TODO: implement initState
    //   super.initState();
    //
    // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter Bottem Navi '),
        // ),
        body: _children[_currentIndex] (_fullName, _mobileNo, _userPic, _userId),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xfffa9d85),
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff2446a6),
          items: [

            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.book),
              title: Text('Booked'),
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.person),
                title: Text('Profile')
            )
          ],
        ),
      );
    }

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    Value(){
      FirebaseFirestore.instance.collection('users').doc
        (FirebaseAuth.instance.currentUser.uid).snapshots().listen((userDetails) {
        Map<String, dynamic> _userMap = userDetails.data();
          _fullName= _userMap['full_name'  ];
          _mobileNo= _userMap[ 'mobile_no'  ];
          _userPic=  _userMap['user_pic' ];
          _userId=  userDetails.id;



      })
      ;
    }
  }