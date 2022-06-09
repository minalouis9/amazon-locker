import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
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
              Text('Getting Started', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),),
              const SizedBox(height: 8.0),
              Text('Create an account to continue!', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey,),),
              const SizedBox(height: 50.0),
              // const SizedBox(height: 50.0),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('First Name'),
                          hintText: 'John'),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Last Name'),
                          hintText: 'Smith'),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: 'johnsmith@example.com'),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Phone Number'),
                          hintText: '01234567890'),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Confirm Password'),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const SizedBox(width: 10.0),
                        Expanded(child: Text('By creating an account, you agree to our\nTerm & Conditions')),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.homeScreen);
                        },
                        child: Row(
                          children: [
                            Expanded(child: Text('Register'.toUpperCase(), textAlign: TextAlign.center,)),
                            Icon(Icons.login)
                          ],
                        ),)
                  ],
                ),
              ),
              // const SizedBox(height: 45.0),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(
                            context, RoutePaths.loginScreen);
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
