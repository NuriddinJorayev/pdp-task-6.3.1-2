

// ignore_for_file: null_check_always_fails

import 'dart:convert';

import 'package:pdp_task_6_2_2/servis/account.dart';
import 'package:pdp_task_6_2_2/servis/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{

      // user class
    static UserStore(User user) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("user", jsonEncode(user));
    }
    static Future<User>  UserLoad() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String myload = pref.getString('user')!;
      if(myload.isEmpty){
        return null!;
      }
      Map<String, dynamic> map = jsonDecode(myload);
       return User.fromjson(map);
    }
    static  UserRemove() async {
      (await SharedPreferences.getInstance()).remove('user');
    }
   
    static AccountStore(var account) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("account", jsonEncode(account));
    }
    static Future<Account>  AccountLoad() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String myload =  pref.getString("account")?? "bosh";
      if(myload.isEmpty){
        return null!;
      }
       Map<String, dynamic> map = jsonDecode(myload);
       return Account.fromjson(map);
    }
    static  AccountRemove() async {
      (await SharedPreferences.getInstance()).remove('account');
    }
   
}