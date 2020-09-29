import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  static void init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.init(dir.path);
    print('[Debug] Hive path: ${Hive}');
  }
}
