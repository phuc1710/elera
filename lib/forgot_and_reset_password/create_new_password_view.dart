import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Create New Password',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: Image.asset('assets/images/new_password.png'),
          ),
        ),
        Text(
          'Create Your New Password',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const PasswordInput(hint: 'Password'),
        const PasswordInput(hint: 'Repeate Password'),
        const RememberMeRow(),
        const MainActionButton()
      ]),
    );
  }
}

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({Key? key}) : super(key: key);

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              });
            }),
        Text('Remember Me', style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}

class MainActionButton extends StatelessWidget {
  const MainActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () {
          showWelcomeDialog(context);
        },
        child: const MainActionInk(
          buttonString: 'Continue',
          width: 0.4,
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required hint,
  })  : _hint = hint,
        super(key: key);

  final String _hint;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.02),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              icon:
                  Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              }),
          hintText: widget._hint,
        ),
        obscureText: _showPassword,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}

Future<dynamic> showWelcomeDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // Future.delayed(const Duration(seconds: 2), () {
        //   Navigator.of(context).pop();
        //   Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(builder: (context) => const Onboarding()),
        //       (route) => false);
        // });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Image.asset('assets/images/welcome_dialog2.png')),
              Text(
                'Congratulation!',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator.adaptive(),
              ),
            ],
          ),
          contentTextStyle: Theme.of(context).textTheme.displayMedium,
        );
      });
}
