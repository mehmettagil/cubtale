import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          color: context.appTheme.colors.backgroundColor,
          elevation: 15,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 90,
                height: 90,
                child: IconConstants.error.toImage,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Oops",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: context.appTheme.colors.textColor)),
              const SizedBox(
                height: 5,
              ),
              Text("Something",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: context.appTheme.colors.textColor)),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Went Wrong !",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: context.appTheme.colors.textColor),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              side: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.5),
                                  width: 3)))),
                  child: Text(
                    "Try Again",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
