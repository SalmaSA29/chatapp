import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../messages/messages_screen.dart';
import '../messages/newmessage_screen.dart';

class ChatScreen extends StatefulWidget {
   ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState(){
    super.initState();
    // final fbm= FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });


  }
   DatabaseReference ref = FirebaseDatabase.instance.ref("users/1");

   int count=1;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER CHAT'),
        actions: [
          DropdownButton(
              icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryIconTheme.color,
          ),
              items: [
                DropdownMenuItem(
                  value: 'LOGOUT',
                    child: Container(
                      child: Row(
                        children:<Widget>[
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 8.0,),
                          Text('LOGOUT'),
                        ],
                      ),
                    ),),
              ],
              onChanged:(value) {
                if(value=='LOGOUT'){
                    FirebaseAuth.instance.signOut();
                }
              },)
        ],
      ),
      body: Container(
       child:
             Column(
               children: <Widget>[
                 Expanded(
                     child:
                 Messages(),
                 ),
                 NewMessage(),
               ],
             )

      ),
          //-----------------------realtime-----------------------//
      // StreamBuilder(
      //   stream: ref.onValue,
      //   // stream: ref.child("users").orderByValue().onValue,
      //   builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
      //
      //      if(!snapshot.hasData || snapshot.data!.snapshot.value==null ){
      //       return LinearProgressIndicator();
      //     }
      //     else {
      //       Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
      //         // print(map.toString());
      //         Users test=Users(name: map['name'], age: map['age'], address: map['address']);
      //         print(test.address);
      //         Address test1=Address(line1: map['line1']);
      //         print('---------');
      //         print(test1.line1);
      //         Taltmra test2 = Taltmra(users: map['1']);
      //         //print(test2.users);
      //          // map.forEach((k, v) =>(Users(name:map["name"],age: map["age"],)));
      //        return Text(test.toString(),
      //                  style: TextStyle(
      //                      fontSize: 20,
      //                      fontWeight: FontWeight.bold
      //                  ),);
      //
      //
      //       // List<Users> list =[];
      //       // var items = snapshot.data as List<Users>;
      //       // return ListView.builder(
      //       //   itemCount: list.length,
      //       //   itemBuilder: (context,index){
      //       //     return Column(
      //       //       mainAxisAlignment: MainAxisAlignment.center,
      //       //       crossAxisAlignment: CrossAxisAlignment.start,
      //       //       children: [
      //       //         Text(items[index].name.toString(),
      //       //           style: TextStyle(
      //       //               fontSize: 20,
      //       //               fontWeight: FontWeight.bold
      //       //           ),
      //       //         ),
      //       //         Text(items[index].age.toString(),
      //       //           style: TextStyle(
      //       //               fontSize: 20,
      //       //               fontWeight: FontWeight.bold
      //       //           ),
      //       //         ),
      //       //         Text(items[index].name.toString(),
      //       //           style: TextStyle(
      //       //               fontSize: 20,
      //       //               fontWeight: FontWeight.bold
      //       //           ),
      //       //         ),
      //       //       ],
      //       //     );
      //
      //
      //
      //           // return ListTile(
      //           //   title: Text(list[index].name??""),
      //           // );
      //
      //     }
      //   },
      // ),
      // floatingActionButton:
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //         child: Icon(Icons.edit,),
      //         onPressed: ()async{
      //           DatabaseReference newref = ref.child('users').child("$count");
      //           await newref.set(
      //               {
      //             "name": "janna",
      //             "age": 24,
      //             "address": {
      //               "line1": "Mountain View"
      //             }
      //           }
      //           );
      //           count++;
      //         }
      //     ),
      //     FloatingActionButton(
      //       child: Icon(Icons.read_more_outlined,),
      //       onPressed: ()async{
      //         final data = FirebaseDatabase.instance.ref();
      //         final snapshot = await data.child('users').get();
      //         if (snapshot.exists) {
      //           print(snapshot.value);
      //         } else {
      //           print("no data ");
      //         }
      //       },
      //     ),
      //
      //   ],
      // ),
    );
  }
}

