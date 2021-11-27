

// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_task_6_2_2/my_widgets/textfield_build_widget.dart';
import 'package:pdp_task_6_2_2/pages/logIn_page.dart';
import 'package:pdp_task_6_2_2/servis/account.dart';
import 'package:pdp_task_6_2_2/servis/perfs.dart';
import 'package:pdp_task_6_2_2/servis/user.dart';

class SignUpPage extends StatefulWidget {
    final String id = "signup_page";
    SignUpPage({Key? key}) : super(key: key);
  
    @override
    _SignUpPageState createState() => _SignUpPageState();
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
  
  class _SignUpPageState extends State<SignUpPage> {
    
  

    final Activ_HintTC = Color.fromARGB(255,7,99,254);
    final noActiv_HintTC = Color.fromARGB(255,184,185,187);

    TextEditingController text_control1 = TextEditingController();
    TextEditingController text_control2 = TextEditingController();
    TextEditingController text_control3 = TextEditingController();
    TextEditingController text_control4 = TextEditingController();
    TextEditingController text_control5 = TextEditingController();
  
    List<Widget> textWithCintainer = [];
    List t_f_hint = ["FullName", "Email", "Phone", "Password", "Confirm password"];
    List t_f_icons = [Feather.user, Feather.mail, CupertinoIcons.phone, Feather.unlock, Feather.unlock];
    List<bool> t_f_active = [false, false, false, false, false];
    List<int> t_f_index = [0,1,2,3,4];

    @override
  void initState() {
    super.initState();
    setEnabledSystemUIMode(SystemUiMode.immersive);
  }

      TextEditingController getTextCon(int i){
        switch(i){
          case 0: {return text_control1;}
          case 1: {return text_control2;}
          case 2: {return text_control3;}
          case 3: {return text_control4;}
          case 4: {return text_control5;}
        }
        return TextEditingController();
      }

    @override
    Widget build(BuildContext context) {        
      return Scaffold(
        backgroundColor: Colors.white,
       
        body: Container(
         height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
               height: MediaQuery.of(context).size.height,
              child: Stack(          
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7.0, right: 4.0, top: 3.0, bottom: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),                
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      color: Colors.white,
                       boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255,225,229,234),
                          offset: Offset(-90, -120),
                          blurRadius: 90,
                          spreadRadius: 90
                        )
                      ],
                    ),
                  ),
                  // @bottom right blue container
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: (MediaQuery.of(context).size.height /3) +40 ,
                      width: (MediaQuery.of(context).size.width /4) + 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0)
                        ),
                        color: Colors.blue[900]
                      ),
                    ),
                  ),
                  // @base center rounded white container 
                  Container(          
                    height: MediaQuery.of(context).size.height,    
                    margin: EdgeInsets.only(left: 7.0, right: 4.0, top: 3.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 0.0,
                      )
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(              
                        mainAxisSize: MainAxisSize.max,        
                        children: [
                          SizedBox(height: 44.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: _open_Login_page, 
                                icon: Icon(Icons.arrow_back_sharp), iconSize: 30.0)
                            ]
                            ),
                            SizedBox(height: 30.0),
                            Text("Let's Get Started!", 
                            style: TextStyle(fontSize: 25.0, fontWeight:FontWeight.w900 ),),
                            SizedBox(height: 13.0),
                            Text("Create an account to Q Allure to get all features", 
                            style: TextStyle(fontSize: 13, fontWeight:FontWeight.w500, color: Colors.grey[400]),),
                            SizedBox(height: 42.0),
                            // @textfields 
                          Column(
                            children: t_f_index.map((e) =>     
                            Column(
                              children: [
                                TextField_Widget(_textFieldBuilder(
                                    getTextCon(e), 
                                    t_f_hint[e], 
                                    t_f_icons[e], 
                                    t_f_active[e], 
                                    e), t_f_active[e], 65.0),
                                    SizedBox(height: 20.0)
                              ],
                            ),).toList(),
                          ),
                          SizedBox(height: 22.0),
                          // @create main blue button
                          Container(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width / 2.1,
                            decoration: BoxDecoration(                    
                              borderRadius: BorderRadius.circular(50.0),
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
                            child: MaterialButton(
                              height: double.infinity,
                              minWidth: double.infinity,
                              color: Color.fromARGB(255,21,82,207),
                              onPressed: _save_load,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: Center(
                                child: Text("CREATE", 
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),)
                                ),
                            ),
                          ),
                          // @last text. already have account... 
                          SizedBox(height: 55.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("Already have an account?", 
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0)),
                                SizedBox(width: 2.0),
                            InkWell(
                              onTap: _open_Login_page,
                              child: Text("Login here", 
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0)),
                            ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                 // @leftCenter gradient 
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: (MediaQuery.of(context).size.height / 2 + 200)  ,
                      width: 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(1000),
                          bottomRight: Radius.circular(1000),
                        ),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: Offset(-270, 0),
                            blurRadius: 600,
                            spreadRadius: 400
                            
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
      Widget _textFieldBuilder(controller, hintText, icon, isActive, int howmach){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        onTap: (){
          setState(() {
           _active_false_changer();
           t_f_active[howmach] = true;
          });
        },
        style:  TextStyle(color: isActive ? Activ_HintTC : noActiv_HintTC,
            fontWeight: FontWeight.w700, fontSize: 15.0),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: isActive ? Activ_HintTC : noActiv_HintTC,
              fontWeight: FontWeight.w500, fontSize: 15),
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: isActive ? Activ_HintTC : noActiv_HintTC, size: 18),

        ),
      ),
    );
  }
      void _active_false_changer(){
        setState(() {
          t_f_active[0] = false;
        t_f_active[1] = false;
        t_f_active[2] = false;
        t_f_active[3] = false;
        t_f_active[4] = false;
        });
      }

      _save_load(){
         var account =  Account(
         text_control1.text, text_control2.text,
         text_control3.text, text_control4.text, 
         text_control5.text).tojson(); 
         
          if(text_control1.text.isNotEmpty){
             Prefs.AccountStore(account);
          }       

          Prefs.AccountLoad().then((value) => print(
            value.fullname + "\n" + 
            value.email + "\n" + 
            value.phone + "\n" + 
            value.password + "\n" + 
            value.con_password
            ));
        }
        
        _open_Login_page(){
          Navigator.pushReplacementNamed(context, LogIn_Widget().id);
        }
      

    
     
  }
  