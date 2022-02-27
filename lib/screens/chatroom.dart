import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({Key? key}) : super(key: key);

  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
          
          builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
          //  if (snapshot.hasError) {
          //         return Text("ERROR");
          //       }
           if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }     

 return ListView(
children: snapshot.data!.docs.map((DocumentSnapshot document){
Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
print(data);
return Stack(
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
                        )
),
Stack(
  children: [
                       Positioned(
                                  top: 30,
                                  left: 20,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/avator.png'),
                                    radius: 30,
                                  )),
                              Positioned(
                                top: 30,
                                right: 10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                  ),
                                  iconSize: 40,
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                             Positioned(
                               
                                top: 100,
                              left: 12,
                               child: Text('Messages',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                    fontWeight: FontWeight.bold,)
                             
                            ),
 ), 
 Positioned(
                        top: 150,
                        height: 800,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28)),
                          ),
                        ),
                      ), 
                                      Positioned(
                        top: 170,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/avator.png'),
                                      radius: 38,
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    data['Email'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                                ],
                              );
                              // return Container(
                              //     child: Row(
                              //   children: [
                              //     CircleAvatar(
                              //       backgroundImage: AssetImage('assets/images/avator.png'),
                              //       radius: 42,
                              //     ),
                              //     Text("vbcn m")
                              //   ],
                              // ));
                            }),
                      ), 

                                      Positioned(
                        top: -120,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(

                                  child: Row(
                                children: [
                                 Text("samra")

                                ],
                              ));
                            }),
                      ),   


                   
  ],
)

]
);
 }).toList(),

 );


        //     return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['full_name']),
        //       subtitle: Text(data['company']),
        //     );
        //   }).toList(),
        // );   
        // }
        
        
        // StreamBuilder<QuerySnapshot>(
        //     stream: FirebaseFirestore.instance.collection('users').snapshots(),
        //     builder:
        //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //       if (snapshot.hasError) {
        //         return Text('Something went wrong');
        //       }

        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Text("Loading");
        //       }

        //       return ListView.builder(
        //           itemCount: snapshot.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             // DocumentSnapshot data = snapshot.data!.docs[index];
        //             DocumentSnapshot data = snapshot.data!.docs[index];
        //             print(data);
        //             return Stack(children: [
                      // new AppBar(
                      //   brightness: Brightness.dark,
                      //   backgroundColor: Colors.transparent,
                      //   toolbarHeight: 220,
                      //   elevation: 0.0,
                      //   automaticallyImplyLeading: false,
                      //   flexibleSpace: Container(
                      //     height: MediaQuery.of(context).size.height,
                      //     decoration: BoxDecoration(
                      //       color: Colors.black,
                      //       borderRadius: BorderRadius.only(
                      //           bottomLeft: Radius.circular(28),
                      //           bottomRight: Radius.circular(28)),
                      //     ),
        //                   child: Stack(
        //                     children: [
                              // Positioned(
                              //     top: 30,
                              //     left: 20,
                              //     child: CircleAvatar(
                              //       backgroundImage:
                              //           AssetImage('assets/images/avator.png'),
                              //       radius: 30,
                              //     )),
                              // Positioned(
                              //   top: 30,
                              //   right: 10,
                              //   child: IconButton(
                              //     icon: Icon(
                              //       Icons.search,
                              //     ),
                              //     iconSize: 40,
                              //     color: Colors.white,
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //   ),
                              // ),
                      //         Positioned(
                      //             top: 100,
                      //             left: 12,
                      //             child: Text(
                      //               "Messages",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 24,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             )),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 150,
                      //   height: 800,
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
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
                      //               data['Email'],
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ))
                      //           ],
                      //         );
                      //         // return Container(
                      //         //     child: Row(
                      //         //   children: [
                      //         //     CircleAvatar(
                      //         //       backgroundImage: AssetImage('assets/images/avator.png'),
                      //         //       radius: 42,
                      //         //     ),
                      //         //     Text("vbcn m")
                      //         //   ],
                      //         // ));
                      //       }),
                      // ),

                      //  Positioned(
                      //   top: -120,
                      //   width: MediaQuery.of(context).size.width,
                      //   height: MediaQuery.of(context).size.height,
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       itemCount: 20,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return Container(

                      //             child: Row(
                      //           children: [
                      //            Text("samra")

                      //           ],
                      //         ));
                      //       }),
                      // ),
            //           Container(
            //               child: Positioned(
            //             top: 300,
            //             left: -1,
            //             height: MediaQuery.of(context).size.height,
            //             width: MediaQuery.of(context).size.width,
            //             child: ListView.builder(
            //                 itemCount: 50,
            //                 itemBuilder: (context, index) {
            //                   return Container(
            //                       color: Colors.grey.shade100,
            //                       child: ListTile(
            //                           leading: CircleAvatar(
            //                             backgroundImage: AssetImage(
            //                                 'assets/images/avator.png'),
            //                           ),
            //                           title: Text(
            //                             "Username",
            //                             style: TextStyle(
            //                               color: Colors.black,
            //                               fontWeight: FontWeight.bold,
            //                               fontSize: 17,
            //                             ),
            //                           ),
            //                           subtitle: Text(
            //                             "Hello!",
            //                             style: TextStyle(
            //                               color: Colors.grey.shade500,
            //                               fontWeight: FontWeight.bold,
            //                               fontSize: 16,
            //                             ),
            //                           ),
            //                           trailing: Column(
            //                             children: [
            //                               Text("11:30"),
            //                               CircleAvatar(
            //                                 backgroundColor: Color.fromRGBO(
            //                                     194, 103, 117, 1.0),
            //                                 radius: 10,
            //                               ),
            //                               Expanded(
            //                                 child: Container(
            //                                   child: Stack(children: [
            //                                     Container(
            //                                         child: Text(
            //                                       "1",
            //                                       style:
            //                                           TextStyle(fontSize: 15),
            //                                     )),
            //                                   ]),
            //                                 ),
            //                               )
            //                             ],
            //                           )));

            //                   // TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle_rounded), label: Text("1"))

            //                   //  Text("samra",style: TextStyle(
            //                   //    fontSize: 35,
            //                 }),
            //           ))
            //         ]);
            //       });
            // })
            
        }
        )
            );
  }
}


             
    
    // child: ListTile(
    //        leading: Text("samra",style: TextStyle(
    //          fontSize: 35,
    //        ),),
    // ),
 
