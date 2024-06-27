import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/core/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //SizedBox(width: width/1.4,),
        SizedBox(
          child: Container(
            width: context.width * 0.15,
            decoration: BoxDecoration(
                color: context.appTheme.colors.appBarColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                    child: IconConstants.profileLight.toImage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Name:",
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        userModel.accName,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Role:  ",
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(userModel.accRole),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(const LoginLogoutEvent());
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(7),
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          side: BorderSide(
                                              color: Colors.redAccent
                                                  .withOpacity(0.5),
                                              width: 3)))),
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 10),
                              )),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
