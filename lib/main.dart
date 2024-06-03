import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:hackathonfront/component/my_text_field.dart';
import 'package:hackathonfront/screen/login.dart';
import 'package:http/http.dart' as http;

import 'package:hackathonfront/screen/sellers_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hackathon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  bool Visible = true;
  bool isLoading = false;

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    // SignupAuthProvider signupAuthProvider =
    //     Provider.of<SignupAuthProvider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth >= 600 ? 64.0 : 32.0;
    double buttonWidth = screenWidth >= 600 ? 200.0 : 411.0;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset('asset/images/logo1.png'),
                  const SizedBox(height: 10),
                  Text(
                    'Let\'s create an account for you',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    controller: fullNameController,
                    hintText: 'Full name',
                    preffixIcon: Icon(Icons.person),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    preffixIcon: Icon(Icons.email),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: addressController,
                    hintText: 'Addess',
                    preffixIcon: Icon(Icons.home),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: phoneController,
                    hintText: 'phone',
                    obscureText: Visible,
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: Visible,
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'confirmpassword',
                    obscureText: Visible,
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: null,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      addUser(
                        address: addressController.text.trim(),
                        confirmPasswd: confirmpasswordController.text.trim(),
                        email: emailController.text.trim(),
                        name: fullNameController.text.trim(),
                        passwd: passwordController.text.trim(),
                        phone: phoneController.text.trim(),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (!isLoading) const Text("Sign Up"),
                        if (isLoading) const CircularProgressIndicator(),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: screenWidth >= 600
                            ? 200
                            : 80, // Adjust button width as needed
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text('LOGIN'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addUser(
      {required String name,
      required String email,
      required String passwd,
      required String confirmPasswd,
      required String address,
      required String phone}) async {
    if (!(passwd == confirmPasswd)) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Confirm password does not match!",
      );
      return;
    }

    var url = 'http://127.0.0.1:8000/api/addUsers';

    Map<String, dynamic> jbody = {
      'name': name,
      'email': email,
      'password': passwd,
      'confirm_password': confirmPasswd,
      'address': address,
      'phone': phone,
      'role': 'buyer'
    };

    print(jbody);

    var resut = await http.post(Uri.parse(url), body: jbody);
    print('Response status: ${resut.statusCode}');
    print(resut);
  }
}
