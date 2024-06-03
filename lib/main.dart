import 'package:flutter/material.dart';
import 'package:hackathonfront/component/my_text_field.dart';
import 'package:hackathonfront/screen/login.dart';

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
  final fullName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final tinController = TextEditingController();
  final tradeTypeController = TextEditingController();
  final capitalAmountController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();

  bool Visible = true;
  bool isLoading = false;

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          onTap: () {},
        ),
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
                    controller: fullName,
                    hintText: 'Fullname',
                    preffixIcon: Icon(Icons.person),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: tinController,
                    hintText: 'TIN',
                    preffixIcon: Icon(Icons.email),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: capitalAmountController,
                    hintText: 'capitalAmount',
                    preffixIcon: Icon(Icons.email),
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
                    controller: phoneController,
                    hintText: 'phone',
                    obscureText: Visible,
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'username',
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
                    onPressed: isLoading
                        ? null
                        : () {
                            setState(() {
                              isLoading = true;
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
                        onPressed: navigateToLogin,
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
}
