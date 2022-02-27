import 'package:chatapp1/screens/auth1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chatroom1 extends StatefulWidget {
  const Chatroom1({Key? key}) : super(key: key);

  @override
  _Chatroom1State createState() => _Chatroom1State();
}

class _Chatroom1State extends State<Chatroom1> {
  TextEditingController search = TextEditingController();

  List<Map> search1 = [];
  bool isLoading = false;

  // Searching() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('username', isEqualTo: search.text)
  //       .get()
  //       .then((value) {
  //     if (value.docs.length < 1) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("user not found")));
  //       setState(() {
  //         isLoading = false;
  //       });
  //       return;
  //     }
  //     value.docs.forEach((user) {
  //       if(user.data()[' ']!=widget.user.username)
  //      })
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      // StreamBuilder<QuerySnapshot>(
      //     stream: FirebaseFirestore.instance.collection('users').snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError) {
      //         return Text("ERROR");
      //       }
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }

      //       return 
            
            // ListView(
            //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     Map<String, dynamic> data =
            //         document.data()! as Map<String, dynamic>;

            //     print(data['Email']);

            //     // print(data);
            //     return 
                
                Stack(
                  children: [
                    new AppBar(
                        brightness: Brightness.dark,
                        backgroundColor: Colors.transparent,
                        toolbarHeight: 220,
                        elevation: 0.0,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(28),
                                bottomRight: Radius.circular(28)),
                          ),
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          // Positioned(
                          //     top: 30,
                          //     left: 20,
                          //     child: CircleAvatar(
                          //       backgroundImage:
                          //           AssetImage('assets/images/avator.png'),
                          //       radius: 30,
                          //     )),

                          Positioned(
                            top: 50,
                            left: 12,
                            child: Text('Messages',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Positioned(
                              top: 50,
                              right: 12,
                              child: IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Auth1()));
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ))),

                          // Positioned(
                          //   top: 100,
                          //   child: Container(
                          //       width: MediaQuery.of(context).size.width,
                          //       height: MediaQuery.of(context).size.height,
                          //       child: TextField(
                          //         decoration: InputDecoration(
                          //             border: OutlineInputBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(10.0),
                          //             ),
                          //             filled: true,
                          //             hintStyle:
                          //                 TextStyle(color: Colors.grey[800]),
                          //             hintText: "Search",
                          //             fillColor: Colors.white70),
                          //       )),
                          // ),
                          // Positioned(
                          //   top:100,
                          //   height: 700,
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: BoxDecoration(
                          //       color: Colors.purple,
                          //       borderRadius: BorderRadius.only(
                          //           topLeft: Radius.circular(28),
                          //           topRight: Radius.circular(28)),
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          //   top: 170,
                          //   width: MediaQuery.of(context).size.width,
                          //   height: MediaQuery.of(context).size.height,
                          //   child: ListView.builder(
                          //       shrinkWrap: true,
                          //       itemCount: snapshot.data!.docs.length,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //       DocumentSnapshot ds = snapshot.data!.docs[index];
                          //         return Column(
                          //           children: [
                          //             Container(
                          //               child: CircleAvatar(
                          //                 backgroundImage: AssetImage(
                          //                     'assets/images/avator.png'),
                          //                 radius: 38,
                          //               ),
                          //             ),
                          //             Container(
                          //                 child: Text(
                          //               ds['Email'],
                          //               style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ))
                          //           ],
                          //         );

                          //       }),
                          // ),
                          Container(
                              child: Positioned(
                            top: 80,
                            left: -1,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                // itemCount: snapshot.data!.docs.length,
                                 itemCount: 10,
                                itemBuilder: (context, index) {
                                  // DocumentSnapshot ds =
                                  //     snapshot.data!.docs[index];
                                  return Container(
                                      color: Colors.grey.shade100,
                                      child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/avator.png'),
                                          ),
                                          title: Text("samra",
                                            // ds['username'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Hello!",
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          trailing: Column(
                                            children: [
                                              Text("11:30"),
                                              CircleAvatar(
                                                backgroundColor: Color.fromRGBO(
                                                    194, 103, 117, 1.0),
                                                radius: 10,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Stack(children: [
                                                    Container(
                                                        child: Text(
                                                      "1",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    )),
                                                  ]),
                                                ),
                                              )
                                            ],
                                          )));
                                }),
                          ))
                        ],
                      ),
                    ),
                  ],
                )
                );
    //           }).toList(),
          
    //       }),
    // );
  }
}
