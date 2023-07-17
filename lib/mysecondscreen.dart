import 'package:flutter/material.dart';
import 'package:flutter_application_1iti/models/customer_model.dart';


import 'services/customer_service.dart';

class SecondScreen extends StatefulWidget {
  String email;
  SecondScreen({
    super.key,
    required this.email,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class SecondScreenState extends StatefulWidget {
  const SecondScreenState({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<CustomerModel> customers = [];

  bool isLoading = true;

  getCustomers() async {
    customers = await CustomerService().getCustomersData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initstate() {
    super.initState();
    getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: customers.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(customers[index].completed.toString()),
                subtitle: Text(customers[index].title ?? '--'),
                trailing: Icon(Icons.person),
              );
            },
          );
  }
}
