import 'package:flutter/material.dart';
import 'package:hackathonfront/component/addselller.dart';
import 'package:hackathonfront/component/my_text_field.dart';

class SellersDetail extends StatefulWidget {
  const SellersDetail({super.key});

  @override
  State<SellersDetail> createState() => _SellersDetailState();
}

class _SellersDetailState extends State<SellersDetail> {
  final company_nameController = TextEditingController();
  final tradetypeController = TextEditingController();
  final taxtypeController = TextEditingController();
  final tinController = TextEditingController();

  final capitalamountController = TextEditingController();

  bool Visible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                    controller: company_nameController,
                    hintText: 'companyname',
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
                    controller: tradetypeController,
                    hintText: 'tradetype',
                    preffixIcon: Icon(Icons.email),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: taxtypeController,
                    hintText: 'taxtype',
                    preffixIcon: Icon(Icons.email),
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  MyTextField(
                    controller: capitalamountController,
                    hintText: 'capitalamount',
                    obscureText: Visible,
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: null,
                  ),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyerPage()));
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
}
