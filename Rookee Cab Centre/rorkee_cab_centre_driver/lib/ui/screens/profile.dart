import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  final String uId, fullName, usrPic, mobileNo;

  const Profile({Key key, this.uId, this.fullName,this.mobileNo,this.usrPic}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // String _uid= widget.uId;
String _uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2446a6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    // _chooseFile();
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 130.0,
                                        width: 130.0,
                                        child:
                                        // _image != null ?
                                        // ClipRRect(
                                        //     borderRadius: BorderRadius.circular(100.0),
                                        //     child: Image.file(_image, fit: BoxFit.fill,)):
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(100.0),
                                            child: Image.network('https://i.pinimg.com/474x/bc/d4/ac/bcd4ac32cc7d3f98b5e54bde37d6b09e.jpg', fit: BoxFit.fill,)),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffe6f9f7),
                                          // image: DecorationImage(
                                          //   image:
                                          // )
                                        ),
                                      ),
                                      // CircleAvatar(
                                      //   // child: _image == null ? Center(child: Icon(AppIcons.user_bottom_icon,size: 20.0,)) : Container(),
                                      //   backgroundImage: _image != null ?  Image.file(_image,
                                      //     // fit: BoxFit.fill,
                                      //   )
                                      //       : NetworkImage('https://i.pinimg.com/474x/bc/d4/ac/bcd4ac32cc7d3f98b5e54bde37d6b09e.jpg'),
                                      //   minRadius: 60.0,
                                      //   backgroundColor: Color(0xffe6f9f7),
                                      // ),
                                      Positioned(
                                        bottom: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          padding: EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28b3b8)
                                          ),
                                          child: Icon(Icons.camera_alt, color: Colors.white,),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top:10.0),
                            child: TextFormField(
                              // controller:
                              // _from,
                              maxLines: 1,
                              maxLength: 25,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 16),
                                labelText: 'Username',
                                contentPadding: EdgeInsets.only(bottom: 0),
                              ),
                              // obscureText: true,
                            ),
                          ),
                          // FractionallySizedBox(
                          //   widthFactor: 1 / 3,
                          //   child:
                          //   Image.asset('assets/logo.png'),
                          // ),
                          SizedBox(height: 15,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward_outlined,
                                  size: 30,
                                  color: Color(0xff2446a6),
                                ),
                                Icon(
                                  Icons.arrow_downward_outlined,
                                  size: 30,
                                  color: Color(0xff2446a6),
                                ),
                              ],
                            ),),
                          SizedBox(height: 15,),

                          TextFormField(
                            // controller: _to,

                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 18),

                              // hintStyle: TextStyle(fontSize: 18),
                              labelText: 'To.',
                              // suffixText: 'SEND OTP',

                              contentPadding: EdgeInsets.only(bottom: 0),

                            ),
                            maxLines: 1,
                            maxLength: 25,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 18),
                              // hintStyle: TextStyle(fontSize: 18),
                              labelText: 'Phone Number',
                            ),
                            // controller: _phone,
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,


                          ),

                          SizedBox(height: 5,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     // Checkbox(
                          //     //   value: true,
                          //     //   onChanged: (_) {},
                          //     //   activeColor: Color.fromRGBO(172, 237, 217, 1),
                          //     // ),
                          //
                          //     Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          //   ],
                          // ),
                          // SizedBox(height: 20),
                          // Spacer(flex: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Spacer(),
                              // FlatButton(
                              //   onPressed: () => Navigator.of(context)
                              //       .pushReplacementNamed('/signup'),
                              //   child: Text('Sign Up'),
                              // ),

                              MaterialButton(
                                elevation: 5,
                                color: Color(0xff2446a6),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (Context)=>Confirm()));
                                },
                                child: Text(
                                  // widget.again == true ?
                                  'Book Now' ,
                                  // : 'Sign In',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 5),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding:
                          //             const EdgeInsets.symmetric(horizontal: 8),
                          //         child: Divider(
                          //           color: Colors.grey,
                          //           thickness: 0.7,
                          //         ),
                          //       ),
                          //     ),
                          //     Text(
                          //       "or sign in with",
                          //       style: TextStyle(
                          //         color: Colors.grey,
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //     SizedBox(width: 8),
                          //     Padding(
                          //       padding: const EdgeInsets.all(4),
                          //       child: Icon(
                          //         Icons.ac_unit,
                          //         size: 28,
                          //         color: Colors.blue.shade800,
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(4),
                          //       child: Icon(
                          //         Icons.ac_unit,
                          //         size: 28,
                          //         color: Colors.red.shade600,
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(4),
                          //       child: Icon(Icons.ac_unit, size: 28),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // widget.again != true ? Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('Not a member yet, ', style: TextStyle(fontWeight: FontWeight.bold, height: 1.2)),
            //     InkWell(child: Text('Sign Up', style: TextStyle(color: Theme.of(context).buttonColor, fontWeight: FontWeight.bold, height: 1.2)), onTap: (){
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => UserDetailPage()));
            //     },),
            //     Text(' now!', style: TextStyle(fontWeight: FontWeight.bold, height: 1.2))
            //   ],
            // ) : Container(height: 0.0, width: 0.0,)

          ],
        ),
      ),

    );
  }
  uid(){
    _uid = FirebaseAuth.instance.currentUser.uid;
  }
}


