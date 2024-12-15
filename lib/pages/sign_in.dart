import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kavach/pages/forgotpassword.dart';
import 'package:kavach/pages/homepage.dart';
import 'package:kavach/pages/login_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "", password = "";
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Successful Login",
        style: TextStyle(fontSize: 20.0),
      )));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "User Not found with the email",
              style: TextStyle(fontSize: 18),
            )));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password",
              style: TextStyle(fontSize: 18),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 248, 247),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 248, 247),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                "assets/left-arrow-svgrepo-com.svg",
                height: 25,
                width: 25,
              ),
            ),
          ),
          title: const Text(
            "KAVACH",
            style: TextStyle(
                fontFamily: "Rowdies",
                color: Color.fromARGB(255, 202, 111, 128)),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo_1.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Rowdies",
                            color: Color.fromARGB(255, 202, 111, 128)),
                      ),
                      const Divider(
                          thickness: 2,
                          indent: 60,
                          endIndent: 60,
                          color: Color.fromARGB(255, 202, 111, 128)),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Email";
                                }
                                return null;
                              },
                              controller: emailcontroller,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 202, 111, 128))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 202, 111, 128))),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontFamily: "Rosarivo",
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 202, 202, 202))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Password";
                                }
                                return null;
                              },
                              controller: passwordcontroller,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 202, 111, 128))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 202, 111, 128))),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontFamily: "Rosarivo",
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 202, 202, 202))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = emailcontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          userlogin();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(251, 202, 111, 128),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Rosarivo"),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(201, 101, 102, 102)),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ]))));
  }
}
// class SignIn extends StatelessWidget {
//   const SignIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 255, 248, 247),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 255, 248, 247),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//               );
//             },
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: const Color(0xffF7F8F8),
//                   borderRadius: BorderRadius.circular(10)),
//               child: SvgPicture.asset(
//                 "assets/left-arrow-svgrepo-com.svg",
//                 height: 25,
//                 width: 25,
//               ),
//             ),
//           ),
//           title: const Text(
//             "KAVACH",
//             style: TextStyle(
//                 fontFamily: "Rowdies",
//                 color: Color.fromARGB(255, 202, 111, 128)),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//                 padding: const EdgeInsets.all(20),
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/logo_1.png',
//                         fit: BoxFit.cover,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const Text(
//                         "SIGN IN",
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontFamily: "Rowdies",
//                             color: Color.fromARGB(255, 202, 111, 128)),
//                       ),
//                       const Divider(
//                           thickness: 2,
//                           indent: 60,
//                           endIndent: 60,
//                           color: Color.fromARGB(255, 202, 111, 128)),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       const TextField(
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(255, 202, 111, 128))),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(255, 202, 111, 128))),
//                             labelText: "Email or username",
//                             labelStyle: TextStyle(
//                                 fontFamily: "Rosarivo",
//                                 fontSize: 20,
//                                 color: Color.fromARGB(255, 202, 202, 202))),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const TextField(
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(255, 202, 111, 128))),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(255, 202, 111, 128))),
//                             labelText: "Password",
//                             labelStyle: TextStyle(
//                                 fontFamily: "Rosarivo",
//                                 fontSize: 20,
//                                 color: Color.fromARGB(255, 202, 202, 202))),
//                       ),
//                       SizedBox(
//                         height: 25,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color.fromARGB(251, 202, 111, 128),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 40,
//                             vertical: 15,
//                           ),
//                           textStyle: const TextStyle(
//                               fontSize: 20, color: Colors.white),
//                         ),
//                         child: const Text(
//                           "Submit",
//                           style: TextStyle(
//                               color: Colors.black, fontFamily: "Rosarivo"),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 100,
//                       )
//                     ]))));
//   }
// }
