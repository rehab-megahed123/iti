import 'package:dio/dio.dart';

import 'package:flutter_application_1iti/models/customer_model.dart';

class CustomerService {
  String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<CustomerModel>> getCustomersData() async {
    List<CustomerModel> cusomersList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.ForEach((jsonElement) {
      CustomerModel customer = CustomerModel.fromJson(jsonElement);
      cusomersList.add(customer);
    });
    return cusomersList;
  }
}
