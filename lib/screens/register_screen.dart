import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/account_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:amazon_locker/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false,
      _isConfirmPasswordVisible = false,
      _acceptTerms = true, _loading = false;

  final TextEditingController _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

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
                  //   'Getting Started',
                  //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                  // ),
                  // const SizedBox(height: 8.0),
                  // Text(
                  //   'Create an account to continue!',
                  //   style: TextStyle(
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.w500,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // const SizedBox(height: 50.0),
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
                              controller: _nameController,
                              decoration: InputDecoration(
                                  label: Text('Full Name'), hintText: 'John Smith'),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  label: Text('Email'),
                                  hintText: 'johnsmith@example.com'),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  label: Text('Password'),
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(() =>
                                          _isPasswordVisible = !_isPasswordVisible),
                                      icon: Icon(_isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined))),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                if (value.length < 8) {
                                  return "Can't be less than 8 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            height: 50.0,
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: !_isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                  label: Text('Confirm Password'),
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(() =>
                                          _isConfirmPasswordVisible =
                                              !_isConfirmPasswordVisible),
                                      icon: Icon(_isConfirmPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined))),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                                if (value != _passwordController.text) {
                                  return "Password doesn't match";
                                }
                                return null;
                              },
                            ),
                          ),
                          // const SizedBox(height: 5.0),
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //         value: _acceptTerms,
                          //         onChanged: (value) => setState(() => _acceptTerms = !_acceptTerms)),
                          //     const SizedBox(width: 10.0),
                          //     Expanded(
                          //         child: Text(
                          //             'By creating an account, you agree to our Term & Conditions')),
                          //   ],
                          // ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                fixedSize: Size.fromWidth(100.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            onPressed: () async {
                              setState(() => _loading = true);
                              if(_formKey.currentState!.validate()){
                                if(_acceptTerms){
                                  final String? result = await ref.read(accountProvider).register(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: _nameController.text);
                                  setState(() => _loading = false);
                                  if(result != null){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(result),
                                    ));
                                  }else{
                                    Navigator.pushNamedAndRemoveUntil(context, RoutePaths.homeScreen, (route) => false);
                                  }
                                }else{
                                  setState(() => _loading = false);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('Please accept the Terms and Conditions'),
                                  ));
                                }
                              }else{
                                setState(() => _loading = false);
                              }
                            },
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 45.0),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.loginScreen);
                          },
                          child: Text(
                            'Login Now',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                  ),
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
        if(_loading)
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
