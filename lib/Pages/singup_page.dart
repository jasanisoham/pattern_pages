import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool isPasswordShow = false;
  bool isCheckbox = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90,width: double.infinity,),
            Image.asset("images/logo1.png",scale: 2,),
            const SizedBox(height: 10,),
            const Text("Sign Up Now", style: TextStyle(fontSize: 25),),
            const SizedBox(height: 5,),
            const Text("Please fill the details and create account", style: TextStyle(color: Colors.grey,fontSize: 13),),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Full name",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: isPasswordShow,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon((isPasswordShow)?Icons.visibility:Icons.visibility_off),color: Colors.grey, onPressed: () {setState(() {
                    isPasswordShow = !isPasswordShow;
                  });},)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Checkbox(
                      value: isCheckbox,
                      onChanged: (val)async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('login', val!);
                        setState(() {
                          isCheckbox = val  ;

                        });
                      }),
                  const Text("I agree to the Terms of Service and Privacy Policy.",style: TextStyle(color: Colors.grey,fontSize: 12),),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: () async {
                if (passwordController.text.isNotEmpty &&
                    fullNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {

                  var detail;
                  detail.fullName =  fullNameController.text;
                  detail.email = emailController.text;
                  detail.password = passwordController.text;
                  final prefs = await SharedPreferences.getInstance();

                  await prefs.setString('username', detail.fullName);
                  await prefs.setString('email', detail.email);
                  await prefs.setString('password', detail.password);
                  await prefs.setBool('signup', true);

                  Navigator.of(context).pushReplacementNamed("welcome_page");
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff17C3C3)
                ),
                alignment: Alignment.center,
                child: const Text("Sign Up",style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed("login_page");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const [
                  Text("Already have an account? ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  Text("Log in",style: TextStyle(color: Color(0xff17C3C3),fontSize: 14),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}