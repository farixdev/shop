import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/screens/order/widgets/order_list.dart';
import 'package:shop/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: FAppBar(title: Text('My Order' , style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),
      body: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),

        //Orders
        child: FOrderListItems() ,
      
      ),
    );
  }
}