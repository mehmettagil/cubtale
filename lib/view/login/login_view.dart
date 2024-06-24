import 'dart:js';

import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/login/appbar_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.colors.backgroundColor,
      appBar: const CubTaleAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            )),
        child: Column(
          children: [
            SizedBox(
              height: context.height / 10,
            ),
            Center(
              child: Container(
                width: context.width < 850 ? 350 : context.width / 2.5,
                height: context.height < 1000 ? 450 : 300,
                decoration: const BoxDecoration(
                    color: Color(0xffd7f1ed),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StringConstants.userName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (value) {},
                            decoration: _inputDecoration(context),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            StringConstants.password,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            onChanged: (value) {},
                            obscureText: true,
                            decoration: _inputDecoration(context),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height / 20),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: context.appTheme.colors.backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                StringConstants.login,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.width / 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: context.appTheme.colors.backgroundColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.appTheme.colors.backgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.appTheme.colors.backgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    );
  }
}
