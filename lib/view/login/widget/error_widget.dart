import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/constants/style_constants.dart';
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
        width: context.width * 0.18,
        height: context.height * 0.50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.appTheme.colors.errorBackground,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 90,
                height: 90,
                child: IconConstants.error.toImage,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                StringConstants.oops,
                style:
                    f24w700.copyWith(color: context.appTheme.colors.errorText),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                StringConstants.wentWrong,
                style:
                    f24w700.copyWith(color: context.appTheme.colors.errorText),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                StringConstants.wentWrong,
                style:
                    f24w700.copyWith(color: context.appTheme.colors.errorText),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          context.appTheme.colors.errorBackground),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(7),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 217, 100, 98),
                                  width: 3)))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Text(StringConstants.tryAgain,
                        style: f16w600.copyWith(
                          color: const Color.fromARGB(255, 217, 100, 98),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
