import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_bloc.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_event.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_state.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/widgets/text_field_widget.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
        if (state is RegisterSucceseful) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Успешная регистрация'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        TextFieldWidget(
                          errorText: 'Введите имя',
                          hintText: 'Имя',
                          controllerName: _controllerName,
                        ),
                        SizedBox(height: 21),
                        TextFieldWidget(
                          errorText: 'Введите email',
                          hintText: 'Почта',
                          controllerName: _controllerEmail,
                        ),

                        SizedBox(height: 21),
                        TextFieldWidget(
                          errorText: 'Введите пороль, пороль меньше 6 символов',
                          hintText: 'Пороль',
                          controllerName: _controllerPassword,
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
                              'Зарегистрироваться',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
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
      ),
    );
  }
}
