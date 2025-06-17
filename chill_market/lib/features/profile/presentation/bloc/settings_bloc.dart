import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:chill_market/features/profile/domain/usecase/edit_settings_usecase.dart';
import 'package:chill_market/features/profile/domain/usecase/get_settings_usecase.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_event.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final EditSettingsUsecase editSettingsUsecase;
  final GetSettingsUsecase getSettingsUsecase;
  SettingsBloc(this.editSettingsUsecase, this.getSettingsUsecase)
    : super(SettingsInitial()) {
    on<GetSettings>(_onGetSettings);
    on<EditSetting>(_onEdit);
  }

  void _onGetSettings(GetSettings event, Emitter<SettingsState> emit) async {
    try {
      final Settings settings = await getSettingsUsecase();
      emit(ProfileSettingsSatet(settings: settings));
    } catch (e) {
      emit(SettingsError(error: e.toString()));
    }
  }

  void _onEdit(EditSetting event, Emitter<SettingsState> emit) async {
    try {
      await editSettingsUsecase(event.settings);
      final Settings settings = await getSettingsUsecase();
      emit(ProfileSettingsSatet(settings: settings));
    } catch (e) {
      emit(SettingsError(error: e.toString()));
    }
  }
}
