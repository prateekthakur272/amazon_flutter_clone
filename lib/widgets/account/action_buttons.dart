import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/widgets/account/action_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ActionButton(label: 'Your Orders', onClick: () {},)),
              space8,
              Expanded(child: ActionButton(label: 'Turn Seller', onClick: () {},)),
            ],
          ),
          space8,
          Row(
            children: [
              Expanded(child: ActionButton(label: 'Log Out', onClick: () {},)),
              space8,
              Expanded(child: ActionButton(label: 'Your Wish List', onClick: () {},)),
            ],
          ),
        ],
      ),
    );
  }
}