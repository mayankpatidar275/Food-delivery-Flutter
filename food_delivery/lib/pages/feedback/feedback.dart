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

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var feedbackController = TextEditingController();

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
                      "Hey !!!",
                      style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Love to know from you",
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
                  textController: feedbackController,
                  hintText: "What do you feel",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height20,
              ),

              // tag line
              Row(children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "We appreciate your feedback     ",
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
                onTap: () {},
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenWidth / 7.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Submit",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
            ],
          ),
        ));
  }
}
