import 'package:flutter/material.dart';
import 'package:project_end/constants.dart';
import 'package:project_end/view/Sign_in/components/background.dart';
import 'package:project_end/view/Sign_up/signup_screen.dart';
import 'package:project_end/view/components/already_have_an_account_acheck.dart';
import 'package:project_end/view/components/rounded_button.dart';
import 'package:project_end/view/components/rounded_input_field.dart';
import 'package:project_end/view/components/rounded_password_field.dart';
import 'package:project_end/view/components/text_field_container.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          // SvgPicture.asset(
          //   "assets/icons/login_svg",
          //   height: size.height * 0.35,
          // ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Username",
            onchanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUp();
              }));
            },
          ),
        ],
      ),
    );
  }
}
