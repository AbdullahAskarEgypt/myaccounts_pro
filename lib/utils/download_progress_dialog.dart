/* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'code_updater.dart';
import 'CodeUpdater.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'download_progress_dialog.dart';

class DownloadProgressDialog extends StatefulWidget {
  final List<dynamic> files;

  const DownloadProgressDialog(this.files, {super.key});

  @override
  _DownloadProgressDialogState createState() => _DownloadProgressDialogState();
}

class _DownloadProgressDialogState extends State<DownloadProgressDialog> {
  double _progress = 0.0;
  String _status = "جارٍ التحميل...";
  int _currentFileIndex = 0;

  @override
  void initState() {
    super.initState();
    _startDownload();
  }
  /// ✅ استرجاع مسار التخزين المحلي للملفات
static Future<File> _getLocalFile(String filename) async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/$filename');
}


  /// ✅ بدء تنزيل الملفات
  Future<void> _startDownload() async {
    for (int i = 0; i < widget.files.length; i++) {
      final file = widget.files[i];

      setState(() {
        _status = "تحميل الملف ${i + 1} من ${widget.files.length}";
        _currentFileIndex = i + 1;
      });

      try {
        final response = await http.get(Uri.parse(file["url"]));
        if (response.statusCode == 200) {
          // File localFile = await CodeUpdater._getLocalFile(file["path"]);
          // File localFile = await CodeUpdater._getLocalFile(file["path"]);
File localFile = await CodeUpdater._getLocalFile(file["path"]);
await localFile.writeAsBytes(response.bodyBytes);

          await localFile.writeAsString(response.body);
          setState(() {
            _progress = (i + 1) / widget.files.length;
          });
        } else {
          _showError("❌ فشل تحميل الملف: ${file["path"]}");
          return;
        }
      } catch (e) {
        _showError("❌ خطأ أثناء تنزيل الملف: ${file["path"]}");
        return;
      }
    }

    _completeDownload();
  }

  /// ✅ إنهاء التنزيل بنجاح
  void _completeDownload() {
    setState(() {
      _status = "✅ تم التنزيل بنجاح!";
      _progress = 1.0;
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // ✅ إغلاق نافذة التحميل
      CodeUpdater._reloadApp(); // ✅ إعادة تشغيل التطبيق بعد التحديث
    });
  }

  /// ❌ إظهار رسالة خطأ
  void _showError(String message) {
    setState(() {
      _status = message;
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context); // ✅ إغلاق النافذة بعد الخطأ
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("🔄 تحميل التحديث"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _progress),
          const SizedBox(height: 10),
          Text(_status),
        ],
      ),
    );
  }
}
 */