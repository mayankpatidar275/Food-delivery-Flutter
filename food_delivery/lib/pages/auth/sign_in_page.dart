// import 'dart:html';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

import '../../base/show_custom_snackbar.dart';
import '../../utils/dimensions.dart';
import 'authentication.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login() {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("password can not be less than six characters",
            title: "password");
      } else {
        showCustomSnackBar("All went well", title: "Perfect");

        AuthenticationHelper()
            .signIn(email: email, password: password)
            .then((result) {
          if (result == null) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            // Get.toNamed(RouteHelper.getInitial());
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                result,
                style: TextStyle(fontSize: 16),
              ),
            ));
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //app logo
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
              ),
              //welcome
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500],
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //your email
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height20,
              ),
              //your password
              AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password_sharp),
              SizedBox(
                height: Dimensions.height10,
              ),

              // tag line
              Row(children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account     ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                )
              ]),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //Sign In
              GestureDetector(
                onTap: () {
                  _login();
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenWidth / 7.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign in",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //sign up options
              RichText(
                text: TextSpan(
                    text: "Dont\'t an accout ?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage(),
                              transition: Transition.fade),
                        text: " Create",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font20,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
