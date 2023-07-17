import 'package:flutter/material.dart';
import 'package:flutter_application_1iti/models/customer_model.dart';
import 'package:flutter_application_1iti/services/customer_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mybutton.dart';
import '../mysecondscreen.dart';

class Login extends StatefulWidget {
  List<CustomerModel> customers = [];

  Login({super.key});
  getCustomers() async {
    customers = await CustomerService().getCustomersData();
  }

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String email = "";

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.contains("@")) {
                    return null;
                  } else {
                    return "Not valid email";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Password"),
                ),
                validator: (value) {
                  if (value!.length < 7) {
                    return "password should contain more than 7 characters";
                  }
                },
              ),
            ),
            InkWell(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  saveEmail(email);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              email: email,
                            )),
                  );
                }
              },
              child: MyButton(
                label: "Login",
              ),
            )
          ]),
        ),
      ),
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
