import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kavach/pages/login_page.dart';
import 'package:kavach/pages/profile_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "", password = "";
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    // ignore: unnecessary_null_comparison
    if (password != null && emailcontroller.text != "") {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileRegister()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
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
                        "REGISTER",
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
                              obscureText: true,
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
                      SizedBox(
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
                          registration();
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
                          "Submit",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Rosarivo"),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ]))));
  }
}



// class Register extends StatelessWidget {
//   const Register({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Registerpage();
//   }
// }

// class Registerpage extends StatefulWidget {
//   const Registerpage({super.key});

//   @override
//   State<Registerpage> createState() => _RegisterpageState();
// }

// class _RegisterpageState extends State<Registerpage> {
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
//                         "REGISTER",
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
//                         keyboardType: TextInputType.emailAddress,
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
//                         obscureText: true,
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
