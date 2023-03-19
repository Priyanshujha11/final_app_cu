import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageController {
  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );
  final storage = FlutterSecureStorage();
  // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  checkForAuth() async {
    String? value = await storage.read(key: "phone");
    return value;

    // Map<String, String> allValues = await storage.readAll();

    // await storage.delete(key: key);

    // await storage.deleteAll();
  }

  addForAuth(phone) async {
    await storage.write(key: "phone", value: phone);
  }
  deleteAuth() async {
    await storage.delete(key: "phone");
  }
}
