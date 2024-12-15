import 'package:flutter/material.dart';
import 'package:kavach/pages/register.dart';
import 'package:kavach/pages/sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 150, 107, 114),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon_1.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "New user?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Rowdies",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(251, 235, 213, 223),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Rosarivo"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Existing User?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Rowdies"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(251, 235, 213, 223),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Rosarivo"),
                      ),
                    )
                  ],
                ))));
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(250, 150, 107, 114),
//         body: SingleChildScrollView(
//             child: Container(
//                 padding: const EdgeInsets.all(20),
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/icon_1.png',
//                       fit: BoxFit.cover,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     const Text(
//                       "New user?",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontFamily: "Rowdies",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Register()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromARGB(251, 235, 213, 223),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 50,
//                           vertical: 15,
//                         ),
//                         textStyle:
//                             const TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                       child: const Text(
//                         "Register",
//                         style: TextStyle(
//                             color: Colors.black, fontFamily: "Rosarivo"),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Text(
//                       "Existing User?",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: "Rowdies"),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignIn()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromARGB(251, 235, 213, 223),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 50,
//                           vertical: 15,
//                         ),
//                         textStyle:
//                             const TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                       child: const Text(
//                         "Sign in",
//                         style: TextStyle(
//                             color: Colors.black, fontFamily: "Rosarivo"),
//                       ),
//                     )
//                   ],
//                 ))));
//   }
// }
