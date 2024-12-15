import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kavach/pages/homepage.dart';

class ProfileRegister extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Container(
        color: Colors.pink.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Icon
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pink.shade300,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    buildTextField(
                        "Full Name", fullNameController, TextInputType.name),
                    buildTextField(
                        "Date of Birth", dobController, TextInputType.datetime),
                    buildTextField(
                        "Mobile Number", mobileController, TextInputType.phone),
                    buildTextField("Address", addressController,
                        TextInputType.streetAddress,
                        isMultiline: true),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          await saveDetailsToFirebase(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, TextInputType inputType,
      {bool isMultiline = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            keyboardType: inputType,
            controller: controller,
            maxLines: isMultiline ? 3 : 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveDetailsToFirebase(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('profiles')
            .doc(user.uid)
            .set({
          'full_name': fullNameController.text,
          'date_of_birth': dobController.text,
          'mobile_number': mobileController.text,
          'address': addressController.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    } catch (e) {
      print("Error saving details: $e");
    }
  }
}
