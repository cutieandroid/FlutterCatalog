import 'package:catalog/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(

        
        child: SingleChildScrollView(
          child: Column(

           children: [Image.asset('assets/images/loginillus.png'),
            const SizedBox(
               height: 20.0,
             ),
              const Text("Welcome",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.deepPurple
               ),

             ),
             const SizedBox(
               height: 20.0,
             ),
             
             Padding(
               padding: const EdgeInsets.symmetric(vertical:18,horizontal: 32),
               child: Column(
                 children: [
                   TextFormField(
                     decoration: const InputDecoration(
                     //  hintText: "EnterUsername",
                       labelText: "Username"

                     ),
                   ),

                   TextFormField(
                     obscureText: true,
                     decoration: const InputDecoration(
                       //  hintText: "EnterPassword",
                         labelText: "Password"

                     ),
                   ),
                   const SizedBox(
                     height: 30.0,
                   ),
                   ElevatedButton(onPressed:(){

                     Navigator.pushNamed(context, MyRoutes.homeroute);

                     



                   },

                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0)
                       )

                     ),

                     child:const Padding(
                       padding:  EdgeInsets.all(8.0),
                       child: Text("Login"),
                     ),

                   )

                 ],
               ),
             ),
           ],
    ),
        ));
    
  }
}
