import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
  final imageurl="https://ik.imagekit.io/pacman/IMG_20230323_180953_887.jpg?updatedAt=1684951267537";

    return

      Drawer(
       child: Container(
         color: Colors.deepPurple,
         child: ListView(
           children: [
             DrawerHeader(
               padding: EdgeInsets.zero,
                 child:  UserAccountsDrawerHeader(
                   accountName: Text("Harsh Mali",textScaleFactor: 1.2),
                   accountEmail: Text("maliharsh403@gmail.com",textScaleFactor: 1),
                   currentAccountPicture: CircleAvatar(
                     backgroundImage: NetworkImage(imageurl),
                   ),

                 )
             ),

            const  ListTile(
               leading: Icon(
                 CupertinoIcons.home,
                 color:Colors.white
               ),
              title: Text("Home",
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  )
              ),

             ),

             const ListTile(
               leading: Icon(
                   CupertinoIcons.hammer,
                   color:Colors.white
               ),
               title: Text("Settings",
                   style:TextStyle(
                       fontSize: 18,
                       color: Colors.white
                   )
               ),

             ),
             const ListTile(
               leading: Icon(
                   CupertinoIcons.info,
                   color:Colors.white
               ),
               title: Text("About",
                   style:TextStyle(
                       fontSize: 18,
                       color: Colors.white
                   )
               ),

             )



           ],
         ),
       ),


    );

  }

}