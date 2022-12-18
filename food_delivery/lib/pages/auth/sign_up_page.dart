// import 'dart:html';
import 'package:food_delivery/pages/auth/authentication.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

import '../../utils/dimensions.dart';
import '../home/home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
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
        // Get username and password from the user.Pass the data to
// helper method

        AuthenticationHelper()
            .signUp(email: email, password: password)
            .then((result) {
          if (result == null) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
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
                height: Dimensions.height20,
              ),
              //your name
              AppTextField(
                  textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(
                height: Dimensions.height20,
              ),
              //your phone
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height20,
              ),

              // Sign up button
              GestureDetector(
                onTap: () {
                  _registration();
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
                      text: "Sign up",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),

              // tag line
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Have an account already ?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //sign up options
              RichText(
                text: TextSpan(
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font16,
                  ),
                ),
              ),
              Wrap(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundImage:
                          AssetImage("assets/image/" + singUpImages[index]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
