import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///--- Header
            FPrimaryHeaderContainer(
              child: Column(
                children: [
                  FAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: FColors.white),
                    ),
                  ),
                  const SizedBox(height: FSizes.defaultBtwSections,)
                ],
              ),
            ),

            ///-- Body
          ],
        ),
      ),
    );
  }
}
