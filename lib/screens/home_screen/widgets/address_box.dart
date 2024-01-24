import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 114, 226, 221),
        Color.fromARGB(255, 162, 236, 233),
      ], stops: [
        0.5,
        1
      ])),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          space4,
          Expanded(
              child: Text(
            'Deliver to ${user.name} - ${user.address}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )),
          space4,
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
