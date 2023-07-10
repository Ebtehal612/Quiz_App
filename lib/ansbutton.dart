import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({super.key, required this.ansText, required this.onTap});
  final String ansText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 131, 9, 0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(ansText),
    );
  }
}
