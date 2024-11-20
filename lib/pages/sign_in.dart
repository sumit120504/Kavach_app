import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kavach/pages/login_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                      const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 111, 128))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 111, 128))),
                            labelText: "Email or username",
                            labelStyle: TextStyle(
                                fontFamily: "Rosarivo",
                                fontSize: 20,
                                color: Color.fromARGB(255, 202, 202, 202))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 111, 128))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 111, 128))),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontFamily: "Rosarivo",
                                fontSize: 20,
                                color: Color.fromARGB(255, 202, 202, 202))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
