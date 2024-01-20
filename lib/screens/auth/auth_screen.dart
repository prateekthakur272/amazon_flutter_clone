import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen/';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: paddingA8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            space8,
            RadioListTile(
              value: Auth.signup,
              tileColor:
                  _auth == Auth.signup ? GlobalVariables.backgroundColor : null,
              onChanged: (value) {
                setState(() {
                  _auth = value!;
                });
              },
              groupValue: _auth,
              activeColor: GlobalVariables.secondaryColor,
              title: const Text(
                'Create Account.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: paddingA8,
                child: Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(hintText: 'Name'),
                        ),
                        space8,
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(hintText: 'Email'),
                        ),
                        space8,
                        TextFormField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                        ),
                        space8,
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Sign Up'))
                      ],
                    )),
              ),
            RadioListTile(
              value: Auth.signin,
              onChanged: (value) {
                setState(() {
                  _auth = value!;
                });
              },
              tileColor:
                  _auth == Auth.signin ? GlobalVariables.backgroundColor : null,
              groupValue: _auth,
              activeColor: GlobalVariables.secondaryColor,
              title: const Text(
                'Sign-In.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: paddingA8,
                child: Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(hintText: 'Email'),
                        ),
                        space8,
                        TextFormField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                        ),
                        space8,
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Sign In'))
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
