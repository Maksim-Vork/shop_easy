import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/core/bloc_auth/auth_bloc.dart';
import 'package:chill_market/core/bloc_auth/auth_event.dart';
import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_bloc.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_event.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsInitial) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is SettingsError) {
          return Scaffold(body: Center(child: Text(state.error)));
        } else if (state is ProfileSettingsSatet) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.appBarColor,
              title: Center(
                child: Text(
                  'Настройки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 29,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 158,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFACACAC),
                                ),
                                child: Center(
                                  child: Text(
                                    'N',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'pochta123@gmail.com',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB4B4B4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Изменить имя',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<AuthBloc>(
                                    context,
                                  ).add(LogoutAuthsEvent());
                                },
                                child: Text(
                                  'Выйти с акаунта',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(children: [Text('Настройки')]),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Темная тема',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Switch(
                                      value: state.settings.isDart,
                                      onChanged: (newValue) {
                                        BlocProvider.of<SettingsBloc>(
                                          context,
                                        ).add(
                                          EditSetting(
                                            settings: Settings(
                                              isDart: newValue,
                                              language: state.settings.language,
                                              currency: state.settings.currency,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              }
                            case 1:
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Язык интерфейса',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        state.settings.language,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                            case 2:
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Валюта',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        state.settings.currency,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            case 3:
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Изменить способ оплаты',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          }
                        },
                        separatorBuilder:
                            (BuildContext context, int index) => const Divider(
                              height: 1,
                              color: Color(0xFF7B7B7B),
                            ),
                        itemCount: 4,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(children: [Text('О приложении')]),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Написать в поддержку',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            case 1:
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Мы в соц. сетях',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          }
                        },
                        separatorBuilder:
                            (BuildContext context, int index) => const Divider(
                              height: 1,
                              color: Color(0xFF7B7B7B),
                            ),
                        itemCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text('Перезагрузите приложение'));
        }
      },
    );
  }
}
