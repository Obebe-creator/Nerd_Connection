import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/signup.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/signup_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                '로그인',
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 132, 211),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _LoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _LoginForm() {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            CustomTextField(
              hint: "이메일",
              funValidator: validateEmail(),
            ),
            CustomTextField(
              hint: "비밀번호",
              funValidator: validatePassword(),
            ),
            CustomElevatedButton(
              text: "로그인",
              funMoveToPage: () {
                if (_formkey.currentState!.validate()) {
                  Get.to(const App());
                }
              },
            ),
            TextButton(
              onPressed: () {
                Get.to(SignUp());
              },
              child: const Text("회원가입 하시겠습니까?",
                  style: TextStyle(
                    color: Colors.black,
                  )),
            )
          ],
        ));
  }
}
