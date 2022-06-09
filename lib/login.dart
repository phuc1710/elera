import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Image.asset('assets/images/login.png'),
              ),
              Text(
                'Let\'s you in',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SocialLoginInk(
                  iconPath: 'assets/images/facebook-logo.png',
                  text: 'Continue with Facebook',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SocialLoginInk(
                  iconPath: 'assets/images/google-logo.png',
                  text: 'Continue with Google',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SocialLoginInk(
                  iconPath: 'assets/images/apple-logo.png',
                  text: 'Continue with Apple',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: MediaQuery.of(context).size.width * 0.05,
                        endIndent: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'or',
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
              const MainActionInk(buttonString: 'Sign in with password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[200],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: push to signup screen
                      // Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLoginInk extends StatelessWidget {
  const SocialLoginInk({
    required this.iconPath,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Image.asset(iconPath),
            ),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
