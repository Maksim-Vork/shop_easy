import 'package:chill_market/features/cart/data/models/product%D1%81_model.dart';
import 'package:chill_market/features/cart/data/models/product_cart_model.dart';
import 'package:chill_market/features/profile/data/model/settings_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    final appDorDir = await getApplicationDocumentsDirectory();
    Hive.init(appDorDir.path);
    Hive.registerAdapter(ProductCartModelAdapter());

    Hive.registerAdapter(ProductCModelAdapter());
    if (!Hive.isBoxOpen('cartBox')) {
      await Hive.openBox<ProductCartModel>('cartBox');
    }

    Hive.registerAdapter(SettingsModelAdapter());
    Hive.openBox<SettingsModel>('profile');
  }

  Box<T> getBox<T>(String name) => Hive.box<T>(name);
}
