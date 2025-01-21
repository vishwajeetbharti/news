import 'package:flutter/material.dart';
import 'package:news/module/login/presentation/widgets/text_field_widget.dart';
import 'package:news/utils/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final TextEditingController _pass = TextEditingController();
  final FocusNode passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              30.hGap,
              SizedBox(
                height: 120.h,
                child: CustomTextFormField(
                  textEditingController: _email,
                  labelText: 'Email ID*',
                  focusNode: emailNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter valid email';
                    }
                    if (!RegExp(
                            r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                        .hasMatch(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
              ),
              10.hGap,
              SizedBox(
                height: 120.h,
                child: CustomTextFormField(
                  textEditingController: _pass,
                  labelText: 'Password',
                  focusNode: passNode,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password length should be 6';
                    }

                    return null;
                  },
                ),
              ),
              10.hGap,
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.home,
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  width: 190.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
