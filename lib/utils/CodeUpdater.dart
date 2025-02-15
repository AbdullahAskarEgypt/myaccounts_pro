/* import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'download_progress_dialog.dart';

class CodeUpdater {
  static const String versionUrl =
      "https://raw.githubusercontent.com/Esmaelasid/mritapp/main/version.json";

  /// ✅ التحقق من التحديث
  static Future<void> checkForUpdate(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(versionUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> remoteVersion = jsonDecode(response.body);
        String latestVersion = remoteVersion["version"];

        // ✅ الحصول على رقم الإصدار الحالي
        String currentVersion = await _getLocalVersion();

        if (currentVersion != latestVersion) {
          _showUpdateDialog(context, remoteVersion);
        } else {
          _showMessage(context, "✅ التطبيق محدث إلى آخر إصدار");
        }
      }
    } catch (e) {
      _showMessage(context, "❌ خطأ أثناء التحقق من التحديثات: $e");
    }
  }

  /// ✅ تنزيل وتحديث الملفات مع مؤشر التحميل
  static Future<void> updateFiles(List<dynamic> files, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // ❌ عدم إغلاق النافذة أثناء التنزيل
      builder: (context) {
        return DownloadProgressDialog(files);
      },
    );
  }

  /// ✅ إعادة تشغيل التطبيق بعد التحديث
  static void _reloadApp() {
    exit(0); // يغلق التطبيق ويجب على المستخدم فتحه مجددًا
  }

  /// ✅ حفظ رقم الإصدار الجديد
  static Future<void> _saveLocalVersion(String version) async {
    File file = await _getLocalFile("version.json");
    await file.writeAsString(jsonEncode({"version": version}));
  }

  /// ✅ استرجاع رقم الإصدار الحالي
  static Future<String> _getLocalVersion() async {
    try {
      File file = await _getLocalFile("version.json");
      if (await file.exists()) {
        Map<String, dynamic> versionData = jsonDecode(await file.readAsString());
        return versionData["version"];
      }
    } catch (_) {}
    return "0.0.0"; // إذا لم يتم العثور على إصدار محلي
  }

  // /// ✅ استرجاع مسار التخزين المحلي للملفات
  // static Future<File> _getLocalFile(String filename) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return File('${directory.path}/$filename');
  // }
  /// ✅ استرجاع مسار الملف المحلي لحفظ التحديثات
static Future<File> _getLocalFile(String relativePath) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final fullPath = '${directory.path}/$relativePath';
    final file = File(fullPath);

    // ✅ التأكد من أن المجلد موجود
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    return file;
  } catch (e) {
    print("❌ خطأ أثناء استرجاع مسار الملف: $e");
    rethrow;
  }
}


  /// ✅ إظهار رسالة
  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  /// ✅ إظهار نافذة التحديث
  static void _showUpdateDialog(BuildContext context, Map<String, dynamic> remoteVersion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🔔 تحديث جديد متاح"),
        content: Text("يوجد تحديث جديد للإصدار ${remoteVersion["version"]}. هل تريد التحديث الآن؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              updateFiles(remoteVersion["files"], context);
              await _saveLocalVersion(remoteVersion["version"]);
            },
            child: const Text("تحديث"),
          ),
        ],
      ),
    );
  }
}
 */


/* import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_code_push/flutter_code_push.dart';
import 'package:path_provider/path_provider.dart';

class CodeUpdater {
  static const String versionUrl =
      // "https://raw.githubusercontent.com/Esmaelasid/mritapp/main/version.json";
      "https://raw.githubusercontent.com/Esmaelasid/myaccounts_pro/main/version.json";

  /// ✅ التحقق من التحديث
  static Future<void> checkForUpdate(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(versionUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> remoteVersion = jsonDecode(response.body);
        String latestVersion = remoteVersion["version"];

        // ✅ الحصول على رقم الإصدار الحالي من التخزين المحلي
        String currentVersion = await _getLocalVersion();

        if (currentVersion != latestVersion) {
          _showUpdateDialog(context, remoteVersion);
        } else {
          _showMessage(context, "✅ التطبيق محدث إلى آخر إصدار");
        }
      }
    } catch (e) {
      _showMessage(context, "❌ خطأ أثناء التحقق من التحديثات: $e");
    }
  }





  /// ✅ تنزيل وتحديث الملفات
  static Future<void> updateFiles(List<dynamic> files) async {
    for (var file in files) {
      try {
        final response = await http.get(Uri.parse(file["url"]));
        if (response.statusCode == 200) {
          File localFile = await _getLocalFile(file["path"]);
          await localFile.writeAsString(response.body);
        }
      } catch (e) {
        print("❌ فشل تحديث الملف: ${file["path"]}");
      }
    }
    _reloadApp;
  }







  /// ✅ إظهار نافذة التحديث
  static void _showUpdateDialog(
      BuildContext context, Map<String, dynamic> remoteVersion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🔔 تحديث جديد متاح"),
        content: Text(
            "يوجد تحديث جديد للإصدار ${remoteVersion["version"]}. هل تريد التحديث الآن؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              _showMessage(context, "⏳ يتم الآن تنزيل التحديث...");
              await updateFiles(remoteVersion["files"]);
              await _saveLocalVersion(remoteVersion["version"]);
              _showMessage(
                  context, "✅ تم التحديث بنجاح! سيتم إعادة تشغيل التطبيق.");
            },
            child: const Text("تحديث"),
          ),
        ],
      ),
    );
  }

  // /// ✅ إعادة تشغيل التطبيق بعد التحديث
  // static void _reloadApp() {
  //   FlutterCodePush.instance.reloadApp();
  // }
//   static void _reloadApp() {
//   exit(0); // ✅ إغلاق التطبيق بعد التحديث
// }
  static void _reloadApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🔄 إعادة تشغيل التطبيق"),
        content: const Text(
            "تم تنزيل التحديث بنجاح! يرجى إعادة تشغيل التطبيق لتطبيق التعديلات."),
        actions: [
          TextButton(
            onPressed: () => exit(0), // إغلاق التطبيق يدويًا
            child: const Text("إعادة تشغيل"),
          ),
        ],
      ),
    );
  }

  /// ✅ حفظ رقم الإصدار الجديد
  static Future<void> _saveLocalVersion(String version) async {
    File file = await _getLocalFile("version.json");
    await file.writeAsString(jsonEncode({"version": version}));
  }

  /// ✅ استرجاع رقم الإصدار الحالي
  static Future<String> _getLocalVersion() async {
    try {
      File file = await _getLocalFile("version.json");
      if (await file.exists()) {
        Map<String, dynamic> versionData =
            jsonDecode(await file.readAsString());
        return versionData["version"];
      }
    } catch (_) {}
    return "0.0.0"; // إذا لم يتم العثور على إصدار محلي
  }

  /// ✅ استرجاع مسار التخزين المحلي للملفات
  static Future<File> _getLocalFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }

  /// ✅ إظهار رسالة
  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}


 */










