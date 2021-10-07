import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_end/view/Sign_in/signin_screen.dart';
import 'package:project_end/view/Sign_up/components/background.dart';
import 'package:project_end/view/components/already_have_an_account_acheck.dart';
import 'package:project_end/view/components/rounded_button.dart';
import 'package:project_end/view/components/rounded_input_field.dart';
import 'package:project_end/view/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SIGNUP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 00.3,
          ),
          SvgPicture.asset(
            "assets/images/signup.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Username",
            onchanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "SIGNUP",
            press: () {},
          ),
          SizedBox(
            height: size.height * 00.3,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SignIn();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
