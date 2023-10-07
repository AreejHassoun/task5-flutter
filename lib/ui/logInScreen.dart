import 'package:areej_hassoun_task/api/HttpService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'ForgetPasswordScreen.dart';
import 'SignUpScreen.dart';
import 'homePage.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _LogInScreenState();

}

class _LogInScreenState extends State<LogInScreen>{
  HttpService httpService = HttpService();
  //Text Controlers
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  //Global Keys
  GlobalKey<FormState>formstate = new GlobalKey<FormState>();
  GlobalKey<FormState>emailFormstate = new GlobalKey<FormState>();
  //variables
  bool _isobscure = true;
  bool _isLoading = false;
  void login(){
    if(formstate.currentState!.validate() && emailFormstate.currentState!.validate()) {
      setState(() {
        _isLoading = !_isLoading;
        httpService.login(_email.text, _password.text);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width:MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 40,right: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFCA9CE0),
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/4),
                Lottie.asset('assets/images/logo.json'),
                SizedBox(height: 60,),
                Form(
                  key: emailFormstate,
                  child: TextFormField(
                    validator:(text) {
                      return null;
                    } ,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress ,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'email',
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Form(
                  key: formstate,
                  child: TextFormField(
                    validator: (text) {
                      if(text!.length<6) {
                        return 'You Should enter 8 charecters';
                      }else {
                        return null;
                      }
                    },
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword ,
                    obscureText: _isobscure,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon : IconButton(
                          icon:Icon(
                              _isobscure ?Icons.visibility_off: Icons.visibility
                          ),
                          onPressed: (){
                            setState(() {
                              _isobscure = !_isobscure ;
                            });
                          },
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgetPasswordScreen()));
                        },
                        child:Text('Forget Password ?',
                          style: TextStyle(
                            color: Color(0xFFCA9CE0),
                            fontSize: 16,
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      backgroundColor: Color(0xFFCA9CE0),
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: !_isLoading? Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ): const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
                      },
                      child:  Text('Sign Up ',
                        style: TextStyle(
                          color: Color(0xFFCA9CE0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}