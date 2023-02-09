import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {

  const LargeButton({super.key, required this.texto, required this.onPressed});

  final String texto;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                texto,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}