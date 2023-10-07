import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Component/ProductGridItem.dart';
import '../Model/Product.dart';
import '../api/HttpService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
          backgroundColor: Color(0xFFCA9CE0),
          title: Lottie.asset('assets/images/logo.json'),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading:false
      ),
        body: SingleChildScrollView(
          child: Container(
            width:MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Trend Products",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                /////
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: FutureBuilder<List<Product>>(
                    future: httpService.getProductList(),
                    builder: (BuildContext context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }else  if (snapshot.connectionState == ConnectionState.none) {
                        return const Center(
                          child: Text('An error occurred!'),
                        );
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if(snapshot.hasData) {
                          if(snapshot.error  != null) {
                            return const Center(
                              child: Text('An error occurred!'),
                            );
                          } else {
                            List<Product> data = snapshot.data!;

                            return GridView.builder(
                              padding: const EdgeInsets.all(4),
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3/4.8,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10
                              ),
                              itemBuilder: (context,index){
                                var product = data[index];
                                return GestureDetector(
                                  onTap: () {},
                                  child: ProductGridItem(product: product),
                                );
                              },
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                      return const Text("");
                    },
                  ),
                ),
              ],
            ),
          ),
        )



    );
  }
}