import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Text(
                    'Amazon\nLocker'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 70.0),
              Text('Let’s Sign You In', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),),
              const SizedBox(height: 8.0),
              Text('Welcome back, you’ve been missed!', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey,),),
              const SizedBox(height: 50.0),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: 'johnsmith@example.com',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                    // const SizedBox(height: 5.0),
                    // Row(
                    //   children: [
                    //     Checkbox(value: false, onChanged: (value) {}),
                    //     const SizedBox(width: 10.0),
                    //     Text('Remember Me'),
                    //   ],
                    // ),
                    const SizedBox(height: 50.0),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.homeScreen);
                        },
                        child: Row(
                          children: [
                            Expanded(child: Text('Login'.toUpperCase(), textAlign: TextAlign.center,)),
                            Icon(Icons.login)
                          ],
                        ),
                    )
                  ],
                ),
              ),
              // const SizedBox(height: 45.0),
              const SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account yet? "),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(
                          context, RoutePaths.registerScreen);
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
