

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart' ;
import 'package:pdp_task_6_2_2/my_widgets/mini_button.dart';
import 'package:pdp_task_6_2_2/my_widgets/textfield_build_widget.dart';
import 'package:pdp_task_6_2_2/pages/signUp_page.dart';
import 'package:pdp_task_6_2_2/servis/perfs.dart';
import 'package:pdp_task_6_2_2/servis/user.dart';


class LogIn_Widget extends StatefulWidget {
  final String id = "login_page";

  LogIn_Widget({Key? key}) : super(key: key);

  @override
  _LogIn_WidgetState createState() => _LogIn_WidgetState();
  
}
 Future<void> setEnabledSystemUIMode(SystemUiMode mode,
  { List<SystemUiOverlay>? overlays }) async {
  if (mode != SystemUiMode.manual) {
    await SystemChannels.platform.invokeMethod<void>(
      'SystemChrome.setEnabledSystemUIMode',
      mode.toString(),
    );
  } else {
    assert(mode == SystemUiMode.manual && overlays != null);
    await SystemChannels.platform.invokeMethod<void>(
      'SystemChrome.setEnabledSystemUIOverlays',
      _stringify(overlays!),
    );
  }
}

class _stringify {
  _stringify(List<SystemUiOverlay> list);
}

class _LogIn_WidgetState extends State<LogIn_Widget> {
  @override
  void initState() {
    super.initState();
    setEnabledSystemUIMode(SystemUiMode.immersive);
  }
    TextEditingController textCon1 = TextEditingController();
    TextEditingController textCon2 = TextEditingController();
    final Activ_HintTC = Color.fromARGB(255,7,99,254);
    final noActiv_HintTC = Color.fromARGB(255,184,185,187);
    List<bool> activelist=[false, true];
    List<int> active_index = [1,0];
    int cur_index = 0;

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 8.0, top: 1.0, bottom: 1.0),
          // circled container
          child: Container(
            height: MediaQuery.of(context).size.height -1,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(45.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255,217,231,244),
                  blurRadius: 50.0,
                  offset: Offset(0, 0),
                  spreadRadius: 1.0,
                )
              ],
              border: Border.all(
                // border color
                color: Color.fromARGB(255,217,231,244),
                width: 4.5, 

              ), 
              // background color
              color: Colors.white
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 48.0),
                  Image(
                    height: (MediaQuery.of(context).size.height / 4),
                    width: (MediaQuery.of(context).size.width / 2),
                    image: AssetImage("assets/images/img2.png"),
                    fit: BoxFit.fill,
                  ),
                  Text("Welcome back!",
                  style: TextStyle(color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.w900),),
                  SizedBox(height: 10.0),
                  Text("Log in to your existant account of Q Allure",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w600),),

                  // textfield strat
                  SizedBox(height: 38.0),
                  TextField_Widget(_textFieldBuilder(textCon1, "Email", Feather.user, activelist[active_index[0]], 0),
                    activelist[active_index[0]] , 64.0),

                  SizedBox(height: 20.0),
                  TextField_Widget(_textFieldBuilder(textCon2, "Password", Feather.unlock, activelist[active_index[1]], 1),
                    activelist[active_index[1]], 64.0),

                  SizedBox(height: 10.0),
                  // ^^textfield end
                  
                  // forgot password teg 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?", 
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0)),
                          SizedBox(width: 5.0)
                    ],
                  ),
                  SizedBox(height: 23.0),
                  // @log in blue button
                  InkWell(
                    onTap: _save_load,
                    child: Container(
                      height: 52.0,
                      width: MediaQuery.of(context).size.width /2,
                      decoration: BoxDecoration(
                       color: Color.fromARGB(255,19,71,164),
                       borderRadius: BorderRadius.circular(27.5),
                       boxShadow: [
                         BoxShadow(
                           color: Color.fromARGB(255,217,230,251),
                           offset: Offset(0, 0),
                           blurRadius: 15.0, 
                           spreadRadius: -5.0
                         ),
                          BoxShadow(
                           color: Color.fromARGB(255,217,230,251),
                           offset: Offset(0, 15),
                           blurRadius: 25.0, 
                           spreadRadius: -5.0
                         ),
                          BoxShadow(
                           color: Color.fromARGB(255,217,230,251),
                           offset: Offset(0, 15),
                           blurRadius: 20.0, 
                           spreadRadius: -10.0
                         ),
                       ]                  
                      ),
                      child: Center(
                        child: Text("LOG IN", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
                      ),
                    ),
                  ),
                  SizedBox(height: 42.0),
                  // Or connect using colled text
                  Text("Or connect using", 
                  style: TextStyle(
                    color: Colors.grey[400], 
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    letterSpacing: .5
                    ),),
                    
                    SizedBox(height: 18.0),
                    // facebook, google, buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button_builder(name:"Facebook", image: FlutterIcons.facebook_f_faw,
                         color: Color.fromARGB(255,55,92,142)),
                         SizedBox(width: 15.0),
                         Button_builder(name:"Google", image: FontAwesome.google,
                         color: Color.fromARGB(255,240,68,55)),
                      ],
                    ),
                   SizedBox(height: 10.0),
                    // don't have an account and sign up text
                    SizedBox(
                      height: 100.0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("Don't have an account?", 
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0)),
                              SizedBox(width: 2.0),
                          InkWell(
                            onTap: _open_Signin_page,
                            child: Text("Sign Up", 
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0)),
                           ),
                         ],
                       ),
                     ),
                   ),
                ],  // <Widget>
              ),
            ),
          ),
        ),
      ), 
    );
  }
   // email,password textfield builder function
  Widget _textFieldBuilder(controller, hintText, icon, isActive, int howmach){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        onTap: (){
          setState(() {
            active_index[0] = 0;
            active_index[1] = 0;
            if (howmach == 0) {active_index[howmach] = 1;}
            else if (howmach == 1) {active_index[howmach] = 1;}
          });
        },
        style:  TextStyle(color: isActive ? Activ_HintTC : noActiv_HintTC,
            fontWeight: FontWeight.w700, fontSize: 15.0),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: isActive ? Activ_HintTC : noActiv_HintTC,
              fontWeight: FontWeight.w600, fontSize: 15.0),
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: isActive ? Activ_HintTC : noActiv_HintTC, size: 18),

        ),
      ),
    );
  }
 
    _save_load(){
      if(textCon1.text.trim().isNotEmpty && textCon2.text.trim().isNotEmpty){
        Prefs.UserStore(User(textCon1.text.trim(), textCon2.text.trim()));
      }
      Prefs.UserLoad().then((user) => {print(user.email + '\n' + user.password)});
    }
    _open_Signin_page(){
      Navigator.pushNamed(context, SignUpPage().id);

    }
 
}