class User {

 String email;
 String password;

  User(this.email, this.password);

  User.fromjson(Map<String, dynamic> json)
     : 
     email = json['email'],
     password = json['password'];

     Map<String, dynamic> toJson() =>{
       'email' : email,
       'password' : password

     };
    

}