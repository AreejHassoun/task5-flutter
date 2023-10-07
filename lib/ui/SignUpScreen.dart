
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'TermsAndConditionsScreen.dart';
import 'homePage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  //Text Controlers
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmedPassword = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  //Global Keys
  GlobalKey<FormState>_firstNameFormstate = new GlobalKey<FormState>();
  GlobalKey<FormState>_lastNameFormstate = new GlobalKey<FormState>();
  GlobalKey<FormState>_phoneNameFormstate = new GlobalKey<FormState>();
  GlobalKey<FormState>_passwordFormstate = new GlobalKey<FormState>();
  GlobalKey<FormState>_confirmedNameFormstate = new GlobalKey<FormState>();
  GlobalKey<FormState>_emailNameFormstate = new GlobalKey<FormState>();
  //variables
  bool _isobscure = true;
  bool _isLoading = false;
  bool? _checkBoxValue = false;
  //Methods
  void SignUp() {
    var forData = _confirmedNameFormstate.currentState;
    if(forData!.validate()) {
      setState(() {
        _isLoading = !_isLoading;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
      });
    }

  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCA9CE0),
          title: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFCA9CE0),
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/images/logo.json'),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _firstNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('First Name :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            return null;
                          },
                          controller: _firstName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'enter your name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _lastNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Last Name :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            return null;
                          },
                          controller: _lastName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'enter your last name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _phoneNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Phone :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            return null;
                          },
                          controller: _phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'enter your phone',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _emailNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Email :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            return null;
                          },
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'enter your email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _passwordFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Password :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            if(text!.length<8) {
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
                              hintText: 'enter your password',
                              hintStyle: TextStyle(color: Colors.grey),
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
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _confirmedNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Confirmed Password :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            if(text != _password) {
                              return 'The passsword not matched';
                            }else {
                              return null;
                            }
                          },
                          controller: _confirmedPassword,
                          keyboardType: TextInputType.visiblePassword ,
                          obscureText: _isobscure,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'enter your password again',
                              hintStyle: TextStyle(color: Colors.grey),
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
                      ],
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(value: _checkBoxValue, onChanged: (bool? newValue) {
                      setState(() {
                        _checkBoxValue = newValue;
                      });
                    },

                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TermsAndConditionsScreen()));
                      },
                      child:  Text('I Accept terms and conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFCA9CE0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Color(0xFFCA9CE0),
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {
                      SignUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: !_isLoading
                          ? Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: 80,
                ),

              ],
            ),
          ),
        ));
  }
}
