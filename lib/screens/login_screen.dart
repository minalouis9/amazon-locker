import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/account_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:amazon_locker/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false, _rememberMe = false, _loading = false;

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Center(child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(40.0)
                    ),
                      child: Logo())),
                  const SizedBox(height: 20.0),
                  // Text(
                  //   'Let’s Sign You In',
                  //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                  // ),
                  // const SizedBox(height: 8.0),
                  // Text(
                  //   'Welcome back, you’ve been missed!',
                  //   style: TextStyle(
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.w500,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                label: Text('Email'),
                                hintText: 'johnsmith@example.com',
                                prefixIcon: Icon(Icons.person_outline),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  label: Text('Password'),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(() =>
                                          _isPasswordVisible =
                                              !_isPasswordVisible),
                                      icon: Icon(_isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined))),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                          // const SizedBox(height: 5.0),
                          // Row(
                          //   children: [
                          //     Checkbox(value: _rememberMe, onChanged: (value) => setState(() => _rememberMe = !_rememberMe,)),
                          //     const SizedBox(width: 10.0),
                          //     Text('Remember Me'),
                          //   ],
                          // ),
                          const SizedBox(height: 15.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                                fixedSize: Size.fromWidth(100.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            onPressed: () async {
                              setState(() => _loading = true);
                              if (_formKey.currentState!.validate()) {
                                final String? result = await ref
                                    .read(accountProvider)
                                    .login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        rememberMe: _rememberMe);
                                setState(() => _loading = false);
                                if (result != null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(result),
                                  ));
                                } else {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RoutePaths.homeScreen, (route) => false);
                                }
                              } else {
                                setState(() => _loading = false);
                              }
                            },
                            child: Text(
                              'Sign in',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          indent: 10.0,
                          endIndent: 15.0,
                        ),
                      ),
                      Text('Or'),
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          indent: 15.0,
                          endIndent: 10.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Work in Progress'),
                          ));
                        },
                        icon: Icon(FontAwesomeIcons.facebook),
                      ),
                      IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Work in Progress'),
                          ));
                        },
                        icon: Icon(FontAwesomeIcons.google),
                      ),
                      IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Work in Progress'),
                          ));
                        },
                        icon: Icon(FontAwesomeIcons.twitter),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 45.0),
                  const SizedBox(height: 10.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.registerScreen);
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Center(
                      child: Image.asset(
                    'assets/uni_logo.png',
                    width: 100.0,
                    height: 100.0,
                  )),
                ],
              ),
            ),
          ),
        ),
        if (_loading)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.5),
            child: Center(child: CircularProgressIndicator()),
          )
      ],
    );
  }
}
