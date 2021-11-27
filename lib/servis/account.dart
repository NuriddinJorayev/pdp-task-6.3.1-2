class Account {
   String fullname;
   String email;
   String phone;
   String password;
   String con_password;

  Account(this.fullname, this.email, this.phone, this.password, this.con_password);
  Account.fromjson(Map<String, dynamic> json)
  :fullname = json['fullname'], 
  email = json['email'], 
  phone = json['phone'], 
  password = json['password'], 
  con_password = json['con_password']; 

  Map<String, dynamic> tojson() =>{
    'fullname' : fullname,
    'email' : email,
    'phone' : phone,
    'password' : password,
    'con_password' : con_password
  };

  

}