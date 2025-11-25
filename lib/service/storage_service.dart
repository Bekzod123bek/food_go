import 'package:get_storage/get_storage.dart';

class StorageService {
  static GetStorage cache = GetStorage();

  static Future<void> writeData(dynamic data, String key) async {
    await GetStorage().write(key, data);
  }

  static Future<void> removeData(String key) async {
    await GetStorage().remove(key);
  }

  static dynamic getInfo(String key)  {
    final data =  GetStorage().read(key);
    return data;
  }
}
