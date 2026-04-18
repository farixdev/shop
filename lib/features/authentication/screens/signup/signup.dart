import 'package:flutter/material.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(FSizes.defaultSpace),
          child: Column(
            children: [
              ///Title 
              Text(FTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              
              ///Form
              
            ],
          ),
        ),
      ),
    );
  }
}
