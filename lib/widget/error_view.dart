import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final Function() onPress;

  const ErrorView({Key? key, required this.error, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  color: Colors.black12,
                  border: Border.all(width: 2, color: Colors.black26)),
              child: const Icon(
                Icons.warning_rounded,
                size: 60,
                color: Colors.grey,
              ),
            ),
            Text(error,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            TextButton(
                onPressed: onPress,
                child: const Text(
                  "Reload",
                  style: TextStyle(
                      fontFamily: 'cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
