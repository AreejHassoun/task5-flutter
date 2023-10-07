import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgetPasswordScreen();

}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen>{
  GlobalKey<FormState>_emailNameFormstate = new GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  bool _isLoading = false;
  void sendCode(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCA9CE0),
          title: Text('Reset Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 40,right: 40,top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Reset Password',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                Text('Reset PasswordEnter your email to send Code ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,),
                Form(
                    key: _emailNameFormstate,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                              labelText: 'Email',
                              hintText: 'enter your email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Color(0xFFCA9CE0),
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {
                      sendCode();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: !_isLoading
                          ? Text(
                        'Send',
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
              ],

            ),
          ),
        )
    );
  }
}