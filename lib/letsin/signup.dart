import 'package:elearning/account_setup/fill_your_profile.dart';
import 'package:elearning/letsin/signin/view/signin_view.dart';
import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  var color = const Color(0xff5f82ff);
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(''),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Create your\nAccount',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.05),
                      ),
                      prefixIcon: const Icon(Icons.email_rounded),
                      hintText: 'Email',
                    ),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.05),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(_showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          }),
                      hintText: 'Password',
                    ),
                    obscureText: _showPassword,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: rememberMe,
                        activeColor: const Color(0xff5f82ff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onChanged: (checked) {
                          setState(() {
                            rememberMe = checked;
                            dev.log(name: 'rememberMe', '$rememberMe');
                          });
                        }),
                    Text('Remember Me',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                InkWell(
                    onTap: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const FillYourProfileView()));
                    }),
                    child: const MainActionInk(buttonString: 'Sign up')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 68.0, 0.0, 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: MediaQuery.of(context).size.width * 0.05,
                          endIndent: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'or continue with',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: MediaQuery.of(context).size.width * 0.03,
                          endIndent: MediaQuery.of(context).size.width * 0.05,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        //TODO: Facebook login
                      },
                      child: const SocialConnectInk(
                        imagePath: 'assets/images/facebook-logo.png',
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        //TODO: Google login
                      },
                      child: const SocialConnectInk(
                        imagePath: 'assets/images/google-logo.png',
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        //TODO: Apple login
                      },
                      child: const SocialConnectInk(
                        imagePath: 'assets/images/apple-logo.png',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInView()));
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialConnectInk extends StatelessWidget {
  const SocialConnectInk({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.075,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
