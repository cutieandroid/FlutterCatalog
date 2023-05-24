import 'package:catalog/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final _formkey=GlobalKey<FormState>();
  movetohome(BuildContext context)async{
    if(_formkey.currentState!.validate()){
      setState(() {
        chngbtn=true;

      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        chngbtn=false; //changing the state of the button

      });
    }
  }


  String name="";
  bool chngbtn= false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(


        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(

             children: [Image.asset('assets/images/loginillus.png'),
              const SizedBox(
                 height: 20.0,
               ),
                 Text("Welcome $name",
                 style: const TextStyle(
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
                         labelText: "Username",

                       ),
                       validator: (value){
                         if(value!.isEmpty){
                           return "Username cannot be empty";

                         }
                       },
                       onChanged:(value){
                         name=value;
                         setState(() {

                         });
                       } ,
                     ),

                     TextFormField(
                       obscureText: true,
                       decoration: const InputDecoration(
                         //  hintText: "EnterPassword",
                           labelText: "Password"

                       ),

                       validator: (value){
                         if(value!.isEmpty){
                           return "Password cannot be empty";
                         }
                         else if( value.length<=5){
                           return "Length of password is too short";
                         }

                       },
                     ),
                     const SizedBox(
                       height: 30.0,
                     ),

                    Material(
                        color: Colors.deepPurple,
                        borderRadius:BorderRadius.circular(chngbtn?25:15),
                      child: InkWell(
                        onTap: () {
                         movetohome(context);
                        },
                        child: AnimatedContainer(
                          duration:  const Duration(seconds:1),
                          width: chngbtn?50:100,
                          height: 50,
                          alignment: Alignment.center,

                          child: chngbtn?const Icon(Icons.done,color: Colors.white,): const Text("Login",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    )
                    /* ElevatedButton(onPressed:(){

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

                     )*/

                   ],
                 ),
               ),
             ],
    ),
          ),
        ));

  }
}
