import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/cubit/login_cubit/login_cubit.dart';
import 'package:environment_ucb/screens/login_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final double fontSize;
  final Color textcolor;

  const MyAppBar(
      {Key? key, this.text, required this.fontSize, required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              text!,
              style: TextStyle(
                fontSize: fontSize,
                color: textcolor,
              ),
            ),
            IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  var alert = AlertDialog(
                      title: Text("¿Desea cerrar sesión?"),
                      actions: [
                        MyButton(
                          fontSize: 10,
                          width: 100,
                          height: 40,
                          color: AppTheme.alert,
                          textColor: Colors.white,
                          text: "Cancelar",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        MyButton(
                          fontSize: 10,
                          width: 100,
                          height: 40,
                          color: AppTheme.primary,
                          textColor: Colors.white,
                          text: "Confirmar",
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyLoginScreen(),
                                ),
                                (route) => false);
                          },
                        ),
                      ]);
                  showDialog(context: context, builder: (context) => alert);
                },
                icon: Icon(
                  Icons.logout,
                  color: textcolor,
                ))
          ],
        ),
      ),
      flexibleSpace: const Image(
        image: AssetImage("assets/background.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
