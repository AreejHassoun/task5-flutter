import 'dart:convert';

import 'package:areej_hassoun_task/Model/local/mySharedPref.dart';
import 'package:http/http.dart';

import '../Model/Product.dart';
import '../Model/loginRequest.dart';

class HttpService {
  final String baseUrl = 'https://fakestoreapi.com';
  Future<String> login(String email, String password) async {
    final response = await post(Uri.parse('$baseUrl/auth/login'), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    }, body: LoginRequest(email: email,password:  password).toJson()
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      MySharedPref.setFcmToken(data.toString());
      return data.toString();
    } else {
      throw Exception('Failed to login');
    }
  }


  Future<List<Product>> getProductList() async {
    final response = await get(Uri.parse('$baseUrl/products'), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> productList = data
          .map((json) => Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
      ))
          .toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }


}
