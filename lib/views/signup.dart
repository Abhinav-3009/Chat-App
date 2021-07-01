import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val){
                        return val.isEmpty || val.length < 4 ? "Username is not valid" : null;
                      },
                      controller: userNameTextEditingController,
                      decoration: textFieldInputDecoration('Username'),
                    ),
                    TextFormField(
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                      },
                      controller: emailTextEditingController,
                      decoration: textFieldInputDecoration('Email'),
                    ),
                    TextFormField(
                      validator: (val){
                        return  val.length > 6 ?  null : "Password should be of atleast 6 characters";
                      },
                      controller: passwordTextEditingController,
                      decoration: textFieldInputDecoration('Password'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // Container(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //     child: Text(
              //       'Forgot Password!!',
              //       style: TextStyle(fontSize: 15),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  signMeUp();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC),
                      ],
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff2A75BC),
                      const Color(0xff007EF4),
                    ],
                  ),
                ),
                child: Text(
                  'Sign Up With Google',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have  an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
