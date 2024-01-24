import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Function() onClick;
  const ActionButton({super.key, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
      ),
      child: Text(label),
    );
  }
}
