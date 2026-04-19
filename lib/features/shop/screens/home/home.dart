import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: FColors.primaryColor,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      // ignore: deprecated_member_use
                      color: FColors.textWhite.withOpacity(0.1),
                    ),
                  ),

                  Container(
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      // ignore: deprecated_member_use
                      color: FColors.textWhite.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
