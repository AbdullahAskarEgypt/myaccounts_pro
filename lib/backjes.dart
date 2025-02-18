import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as google_sign_in;
import 'package:shared_preferences/shared_preferences.dart';
import 'database/database_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BackupRestorePageState createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final google_sign_in.GoogleSignIn _googleSignIn =
      google_sign_in.GoogleSignIn(scopes: ['email']);
  Map<String, String?>? _currentUserData;

  @override
  void initState() {
    super.initState();
    _loadUserFromLocalStorage();
  }

  /// ✅ **تحميل بيانات المستخدم المخزنة محليًا**
  Future<void> _loadUserFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('user_email');
    String? displayName = prefs.getString('user_name');
    String? photoUrl = prefs.getString('user_photo');

    if (email != null) {
      setState(() {
        _currentUserData = {
          "email": email,
          "displayName": displayName,
          "photoUrl": photoUrl,
        };
      });
    }
  }

  /// ✅ **حفظ بيانات المستخدم عند تسجيل الدخول**
  Future<void> _saveUserToLocalStorage(
      google_sign_in.GoogleSignInAccount user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', user.email);
    await prefs.setString('user_name', user.displayName ?? '');
    await prefs.setString('user_photo', user.photoUrl ?? '');

    setState(() {
      _currentUserData = {
        "email": user.email,
        "displayName": user.displayName,
        "photoUrl": user.photoUrl,
      };
    });
  }

  /// 🟢 **تسجيل الدخول**
  Future<void> _handleSignIn() async {
    try {
      final google_sign_in.GoogleSignInAccount? user =
          await _googleSignIn.signIn();

      if (user == null) {
        // print("⚠️ المستخدم ألغى تسجيل الدخول");
        return;
      }

      await _saveUserToLocalStorage(user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ تم تسجيل الدخول بنجاح: ${user.displayName}')),
      );
    } catch (error) {
      print("❌ خطأ في تسجيل الدخول: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ فشل تسجيل الدخول: $error')),
      );
    }
  }

  /// 🔴 **تسجيل الخروج**
  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // ✅ حذف بيانات المستخدم من التخزين المحلي
      setState(() {
        _currentUserData = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تسجيل الخروج بنجاح')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ فشل تسجيل الخروج: $error')),
      );
    }
  }

// =========================================================
// =========================================================
// =========================================================
  Future<void> requestStoragePermission(BuildContext context) async {
    if (await Permission.storage.request().isGranted) {
      // إذن الوصول ممنوح
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم رفض إذن الوصول إلى الذاكرة الخارجية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _createBackup(BuildContext context) async {
    try {
      await requestStoragePermission(context);
      final backupFile = await dbHelper.exportDatabase();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إنشاء النسخة الاحتياطية: ${backupFile.path}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل إنشاء النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _restoreBackup(BuildContext context) async {
    try {
      await requestStoragePermission(context);
      final result = await FilePicker.platform.pickFiles(type: FileType.any);

      if (result != null) {
        final file = File(result.files.single.path!);
        if (await file.exists()) {
          await dbHelper.importDatabase(file);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم استعادة النسخة الاحتياطية بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('الملف غير موجود'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل استعادة النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _backupToGoogleDrive(BuildContext context) async {
    String result = await dbHelper.backupToGoogleDrive();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
        backgroundColor: result.contains('✅') ? Colors.green : Colors.red,
      ),
    );
  }

  Future<void> _restoreBackupFromGoogleDrive(BuildContext context) async {
    String result = await dbHelper.restoreBackupFromGoogleDrive();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
        backgroundColor: result.contains('✅') ? Colors.green : Colors.red,
      ),
    );
  }

// =========================================================
// =========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // تعيين المفتاح هنا

      appBar: AppBar(title: const Text('النسخ الاحتياطي والاستعادة')),

      drawer: Drawer(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Text('حساباتي'),
              ],
            ),
          ),
          Container(width: double.infinity, height: 3, color: Colors.cyan),
          // const SizedBox(height: 50),

          if (_currentUserData != null) ...[
            Container(
              width: double.infinity,
              // height: 160,
              decoration: BoxDecoration(
                // border: Border(left: BorderSide(width: 3, color: Colors.cyan)),
                image: DecorationImage(
                  image: AssetImage(
                    'images/google.jpg',
                  ), // استبدل باسم الصورة
                  fit: BoxFit.cover, // تغطية الخلفية بالصورة
                ),
              ),
              child: Container(
                  color: Color.fromARGB(168, 0, 0, 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'تم تسجيل الدخول الى قوقل بواسطة ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // CircleAvatar(
                      //   backgroundImage: _currentUserData!["photoUrl"] != null
                      //       ? NetworkImage(_currentUserData!["photoUrl"]!)
                      //       : null,
                      //   child: _currentUserData!["photoUrl"] == null
                      //       ? const Icon(Icons.account_circle, size: 80)
                      //       : null,
                      // ),
                      CircleAvatar(
                        radius: 30, // يمكنك تعديل حجم الدائرة
                        backgroundImage:
                            _currentUserData!["photoUrl"] != null &&
                                    _currentUserData!["photoUrl"]!
                                        .startsWith("http")
                                ? NetworkImage(_currentUserData![
                                    "photoUrl"]!) // تحميل الصورة إذا كانت صالحة
                                : null, // لا تحميل صورة إذا كانت غير صالحة
                        child: _currentUserData!["photoUrl"] == null ||
                                !_currentUserData!["photoUrl"]!
                                    .startsWith("http")
                            ? const Icon(
                                Icons.account_circle,
                                size: 60,
                                //  color: Colors.grey
                              )
                            // عرض الأيقونة فقط إذا كانت الصورة غير صالحة
                            : null, // لا تعرض أي شيء إذا كانت الصورة صالحة
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _currentUserData!["displayName"] ?? 'مستخدم غير معروف',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _currentUserData!["email"] ?? 'بريد غير متاح',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
            ),
            Container(
              width: double.infinity,
              height: 3,
              color: Colors.cyan,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignOut,
              child: const Text('تسجيل الخروج'),
            ),
          ] else ...[
            ElevatedButton(
              onPressed: _handleSignIn,
              child: const Text('تسجيل الدخول باستخدام Google'),
            ),
          ],
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ==================================================================
            Expanded(
                child: Column(
              children: [
                // مربع النسخ الاحتياطي المحلي
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.cyan, width: 2.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // العنوان
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'محلي',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => _createBackup(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text('💾 إنشاء نسخة احتياطية محليًا'),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => _restoreBackup(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text('📥 استعادة نسخة احتياطية محليًا'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // مربع Google Drive
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.cyan, width: 2.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // العنوان
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'Google Drive',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => _backupToGoogleDrive(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                              '📤 رفع النسخة الاحتياطية إلى Google Drive'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              _restoreBackupFromGoogleDrive(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                              '📥 استعادة النسخة الاحتياطية من Google Drive'),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}









/*
 // ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // أضف هذا الاستيراد
import 'database/database_helper.dart';
import 'dart:io';

class BackupRestorePage extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper();

  BackupRestorePage({super.key});

  // دالة لطلب إذن الوصول إلى الذاكرة الخارجية
  Future<void> requestStoragePermission(BuildContext context) async {
    if (await Permission.storage.request().isGranted) {
      // print('تم منح إذن الوصول إلى الذاكرة الخارجية');
    } else {
      // print('تم رفض إذن الوصول إلى الذاكرة الخارجية');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم رفض إذن الوصول إلى الذاكرة الخارجية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _createBackup(BuildContext context) async {
    try {
      // طلب إذن الوصول إلى الذاكرة الخارجية قبل إنشاء النسخة الاحتياطية
      await requestStoragePermission(context);

      final backupFile = await dbHelper.exportDatabase();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إنشاء النسخة الاحتياطية: ${backupFile.path}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل إنشاء النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _restoreBackup(BuildContext context) async {
    try {
      // طلب إذن الوصول إلى الذاكرة الخارجية قبل استعادة النسخة الاحتياطية
      await requestStoragePermission(context);

      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        // allowedExtensions: ['db'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);

        // التحقق من وجود الملف
        if (await file.exists()) {
          await dbHelper.importDatabase(file);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم استعادة النسخة الاحتياطية بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('الملف غير موجود'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل استعادة النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النسخ الاحتياطي والاستعادة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _createBackup(context),
              child: const Text('إنشاء نسخة احتياطية'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _restoreBackup(context),
              child: const Text('استعادة نسخة احتياطية'),
            ),
          ],
        ),
      ),
    );
  }
}
 */











/* import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'database/database_helper.dart';
import 'dart:io';

class BackupRestorePage extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper();

  BackupRestorePage({super.key});

  Future<void> _createBackup(BuildContext context) async {
    try {
      final backupFile = await dbHelper.exportDatabase();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إنشاء النسخة الاحتياطية: ${backupFile.path}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل إنشاء النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _restoreBackup(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        // allowedExtensions: ['db'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);

        // التحقق من وجود الملف
        if (await file.exists()) {
          await dbHelper.importDatabase(file);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم استعادة النسخة الاحتياطية بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('الملف غير موجود'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل استعادة النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النسخ الاحتياطي والاستعادة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _createBackup(context),
              child: const Text('إنشاء نسخة احتياطية'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _restoreBackup(context),
              child: const Text('استعادة نسخة احتياطية'),
            ),
          ],
        ),
      ),
    );
  }
}
 */












/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// import 'database_helper.dart';
import 'database/database_helper.dart';

class BackupRestorePage extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> _createBackup(BuildContext context) async {
    try {
      final backupFile = await dbHelper.exportDatabase();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إنشاء النسخة الاحتياطية: ${backupFile.path}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل إنشاء النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _restoreBackup(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['db'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        await dbHelper.importDatabase(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم استعادة النسخة الاحتياطية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل استعادة النسخة الاحتياطية: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('النسخ الاحتياطي والاستعادة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _createBackup(context),
              child: Text('إنشاء نسخة احتياطية'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _restoreBackup(context),
              child: Text('استعادة نسخة احتياطية'),
            ),
          ],
        ),
      ),
    );
  }
}


 */











