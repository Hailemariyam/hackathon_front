// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackathonfront/component/my_text_field.dart';
import 'package:hackathonfront/main.dart';

class Login extends StatefulWidget {
  final Function()? onTap;

  Login({Key? key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool Visible = true;
  bool isLoading = false;
  String _email = '';
  String _password = '';
  // sign user in method

  // forgot password?

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

//  loginPressed() async {
//     if (_email.isNotEmpty && _password.isNotEmpty) {
//       http.Response response = await AuthServices.login(_email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => const HomeScreen(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first);
//       }
//     } else {
//       errorSnackBar(context, 'enter all required fields');
//     }
//   }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth >= 600 ? 64.0 : 32.0;
    double buttonWidth = screenWidth >= 600 ? 200.0 : 411.0;
    return Scaffold(
        // backgroundColor: Colors.black87,
        body: SafeArea(
      child: Container(
        // margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white, // Replace with your desired background color
          borderRadius: BorderRadius.circular(
              16), // Replace 10 with your desired border radius
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),

                // logo
                Image.asset('asset/images/logo1.png'),

                const SizedBox(height: 15),

                // welcome back, you've been missed!
                Text(
                  'welcome back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  suffixIcon: null,
                  preffixIcon: const Icon(Icons.email),
                  // contentPadding: EdgeInsets.all(10),
                ),
                const SizedBox(height: 15),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: Visible,
                  preffixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Visible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        Visible = !Visible;
                      });
                    },
                  ),
                  // contentPadding: EdgeInsets.all(10),
                ),

                const SizedBox(height: 15),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: TextButton(
                          onPressed: () {},
                          // Call the forgotPassword method
                          child: const Text(
                            'Forgot password? ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // sign in button
                // sign in button
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          setState(() {
                            isLoading =
                                true; 
                                
                                // Show circular progress indicator
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: screenWidth >= 600 ? 200 : 80,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (!isLoading)
                        // Only show text when not loading
                        const Text("Sign In"),
                      if (isLoading)
                        // Show circular progress indicator when loading
                        const CircularProgressIndicator(),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                const SizedBox(
                  width: 20,
                ),
                // apple button
                //     SquareTile(
                //       onTap: () {},
                //       imagePath: 'asset/images/apple.png',
                //     ),
                //   ],
                // ),

                const SizedBox(height: 15),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member yet?\t \t',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
