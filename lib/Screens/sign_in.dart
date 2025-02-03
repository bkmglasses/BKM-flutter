import 'package:flutter/material.dart';
import 'package:senior/Screens/QR.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senior/Screens/sign_up.dart';
import '../Widget/Button.dart';
import '../Widget/snackbar.dart';
import '../Widget/text_field.dart';
import '../services/authentication.dart';
import '../widget/forgot_pass.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isChecked = false; // Remember Me checkbox state

  @override
  void initState() {
    super.initState();
    loadUserCredentials();
  }

  // 🗂️ Load saved credentials
  void loadUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('email') ?? '';
    passwordController.text = prefs.getString('password') ?? '';
    isChecked = prefs.getBool('rememberMe') ?? false;

    setState(() {});
  }

  // ✅ Save credentials if Remember Me is checked
  void saveUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', false);
    }
  }

  // 🔑 Sign-In Function
  void SignInUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethod().SignInUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res == "success") {
      saveUserCredentials(); // Save credentials on successful sign-in

      // Get user ID
      String? userId = await AuthMethod().getUserId();
      if (userId != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => QRPage(userId: userId),
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, "Failed to get user ID");
      }
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res); // Display error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 247, 206, 77),
          height: 710,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFieldInput(
                      textEditingController: emailController,
                      hintText: "Email",
                    ),
                    TextFieldInput(
                      textEditingController: passwordController,
                      hintText: "Password",
                      isPass: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const ForgotPassword(),
                      ],
                    ),
                    SizedBox(height: 15),
                    MyButtons(onTap: SignInUser, text: "Sign in"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 0, right: 15),
                child: Image(
                  image: AssetImage('assets/p2.png'),
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Create Account",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
