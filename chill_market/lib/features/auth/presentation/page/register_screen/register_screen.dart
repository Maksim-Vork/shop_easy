import 'package:chill_market/core/ThemeService/app_theme.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_bloc.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterUserEvent(
          name: _controllerName.text,
          email: _controllerEmail.text,
          password: _controllerPassword.text,
        ),
      );

      Navigator.pop(context);
    } else {
      print('Форма не прошла валидацию');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 135),
            Text(
              'Регистрация',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: 339,
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                  vertical: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controllerName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите имя';
                          }

                          return null; // Всё хорошо
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Имя',
                          hintStyle: TextStyle(color: Color(0xFF616161)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 21),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите email';
                          }
                          if (!value.contains('@')) {
                            return 'Неверный email';
                          }
                          return null; // Всё хорошо
                        },
                        controller: _controllerEmail,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Почта',
                          hintStyle: TextStyle(color: Color(0xFF616161)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 21),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите пароль';
                          }
                          if (value.length < 6) {
                            return 'Пароль должен быть минимум 6 символов';
                          }
                          return null;
                        },
                        controller: _controllerPassword,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Пороль',
                          hintStyle: TextStyle(color: Color(0xFF616161)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        width: double.infinity,
                        height: 57,
                        child: ElevatedButton(
                          onPressed: () {
                            _submit(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Зарегестрироваться',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 224, 224, 224),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
