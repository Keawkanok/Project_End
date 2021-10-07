import 'package:flutter/material.dart';
import 'package:project_end/view/Sign_in/signin_screen.dart';
import 'package:project_end/view/Sign_up/signup_screen.dart';
import 'package:project_end/view/Welcome/components/background.dart';
import 'package:project_end/constants.dart';
import 'package:project_end/view/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO YOU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              // SvgPicture.asset(
              //   "assets/icons/chat.svg",
              //   height: size.height * 0.45,
              // ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignIn();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: kPrimaryColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUp();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
