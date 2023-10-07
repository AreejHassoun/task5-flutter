import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TermsAndConditionsScreen();

}

class _TermsAndConditionsScreen extends State<TermsAndConditionsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCA9CE0),
        title: Text('Terms & Conditions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Text('A terms and conditions agreement signifies the relationship between the developer of a product or service and its end users.\n This legal document is not to be taken lightly, since it can protect a company from lawsuits, intellectual property theft, credit card chargebacks, and more.We provide more detailed information in our blog about why you should have terms and conditions for your business, but if you’re reading this, you’re probably aware of that already.In this post, we’ll show you the 11 best terms and conditions examples we found on the internet. These are publicly curated examples from large brands and well-known companies,\n for you to use as your personal swipe file.\n Later down the post, we’ve also included a free terms and conditions template that’s yours to use, edit, and repurpose.',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),
        ),

      ),
    );
  }
}