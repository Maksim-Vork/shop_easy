import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_bloc.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                                onTap: () {},
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
                    height: 158,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(children: [Text('О приложении')]),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 158,
                    decoration: BoxDecoration(
                      color: AppTheme.lightGray,
                      borderRadius: BorderRadius.circular(18),
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
