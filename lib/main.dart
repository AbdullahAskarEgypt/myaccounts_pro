/* import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'cus_man/add_delete.dart';
import 'cus_man/add_transaction.dart';
import 'cus_man/search.dart';
import 'dily_cont/daily_account_page.dart';
import 'backjes.dart';
// import 'utils/code_updater.dart'; // ✅ إضافة كود التحديث
import 'utils/CodeUpdater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CodeUpdater.checkForUpdate(
          context); // ✅ التحقق من التحديث عند تشغيل التطبيق
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(
          onThemeToggle: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, required this.onThemeToggle, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'حساباتي',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
        ),
        actions: const [
          Icon(Icons.wallet_outlined, size: 40, color: Colors.tealAccent),
          SizedBox(width: 28),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
              ),
              child: Column(
                children: [
                  const Icon(Icons.account_circle,
                      size: 100, color: Colors.white),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    width: double.infinity,
                    child: const Text(
                      'الاسم',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(width: double.infinity, height: 3, color: Colors.cyan),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(
                isDarkMode ? 'الوضع الفاتح' : 'الوضع الداكن',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: onThemeToggle,
            ),
            Container(width: double.infinity, height: 3, color: Colors.cyan),
            ListTile(
              leading: const Icon(Icons.system_update),
              title: const Text(
                "التحقق من التحديث",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pop(context);
                CodeUpdater.checkForUpdate(context); // ✅ زر التحديث اليدوي
              },
              // onTap: () =>
              //     CodeUpdater.checkForUpdate(context), // ✅ زر التحديث اليدوي
            ),
            Container(width: double.infinity, height: 3, color: Colors.cyan),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
          children: [
            _buildIconCard(context, Icons.assignment_ind_outlined,
                'إدارة الحسابات', Colors.blue),
            _buildIconCard(context, Icons.account_balance_wallet,
                'إضافة عملية مالية', Colors.orange),
            _buildIconCard(
                context, Icons.search, 'البحث عن حساب', Colors.green),
            _buildIconCard(context, Icons.attach_money_sharp, 'حسابي الشخصي',
                Colors.tealAccent),
            _buildIconCard(context, Icons.backup_outlined, 'النسخ والاستعادة',
                Colors.brown),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCard(
      BuildContext context, IconData icon, String label, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          if (label == 'إدارة الحسابات') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDeletePage()));
          } else if (label == 'إضافة عملية مالية') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddTransactionPage()));
          } else if (label == 'البحث عن حساب') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchClientPage()));
          } else if (label == 'حسابي الشخصي') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DailyAccountPage()));
          } else if (label == 'النسخ والاستعادة') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BackupRestorePage()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'cus_man/add_delete.dart';
import 'cus_man/add_transaction.dart';
import 'cus_man/search.dart';
import 'dily_cont/daily_account_page.dart';
import 'backjes.dart';
import 'utils/CodeUpdater.dart';
// ==================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(
          onThemeToggle: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, required this.onThemeToggle, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          ' حساباتي',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
        ),
        actions: const [
          Icon(Icons.wallet_outlined, size: 40, color: Colors.tealAccent),
          SizedBox(width: 28),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
              ),
              child: Column(
                children: [
                  const Icon(Icons.account_circle,
                      size: 100, color: Colors.white),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    width: double.infinity,
                    child: const Text(
                      'الاسم',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(width: double.infinity, height: 3, color: Colors.cyan),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(
                isDarkMode ? 'الوضع الفاتح' : 'الوضع الداكن',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: onThemeToggle,
            ),
            const ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text(
                // isDarkMode ? 'الوضع الفاتح' : 'الوضع الداكن',
                'معلوماتي',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              // onTap: onThemeToggle,
            ),
            ListTile(
              leading: const Icon(Icons.system_update),
              title: const Text(
                "التحقق من التحديث",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () => checkForUpdate(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
          children: [
            _buildIconCard(context, Icons.assignment_ind_outlined,
                'إدارة الحسابات', Colors.blue),
            _buildIconCard(context, Icons.account_balance_wallet,
                'إضافة عملية مالية', Colors.orange),
            _buildIconCard(
                context, Icons.search, 'البحث عن حساب', Colors.green),
            _buildIconCard(context, Icons.attach_money_sharp, 'حسابي الشخصي',
                Colors.tealAccent),
            _buildIconCard(context, Icons.backup_outlined, 'النسخ  والاستعاده',
                Colors.brown),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCard(
      BuildContext context, IconData icon, String label, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          if (label == 'إدارة الحسابات') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDeletePage()));
          } else if (label == 'إضافة عملية مالية') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddTransactionPage()));
          } else if (label == 'البحث عن حساب') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchClientPage()));
          } else if (label == 'حسابي الشخصي') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DailyAccountPage()));
          } else if (label == 'النسخ  والاستعاده') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BackupRestorePage()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void checkForUpdate(BuildContext context) async {
  const String githubVersionUrl =
      "https://raw.githubusercontent.com/Esmaelasid/myaccounts_pro/main/version.json";
  const String updateUrl =
      "https://esmaelasid.github.io/Html-And-Css-Template-Three/";

  // ✅ إغلاق القائمة الجانبية
  Navigator.pop(context);

  // ✅ التحقق من الاتصال بالإنترنت
  bool isConnected = await _isConnectedToInternet();
  if (!isConnected) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("⚠️ تحقق من الوصول للإنترنت"),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  try {
    // ✅ جلب رقم الإصدار الجديد من GitHub
    final response = await http.get(Uri.parse(githubVersionUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> latestData = jsonDecode(response.body);
      String latestVersion = latestData["latest_version"];

      // ✅ جلب رقم الإصدار المحلي من التطبيق
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version;

      if (currentVersion != latestVersion) {
        // ✅ يوجد تحديث جديد → فتح المتصفح للتحديث
        if (await canLaunchUrl(Uri.parse(updateUrl))) {
          await launchUrl(Uri.parse(updateUrl));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("❌ فشل في فتح الرابط"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // ✅ التطبيق محدث → إظهار رسالة
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("✅ التطبيق محدث إلى آخر إصدار"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ فشل في التحقق من التحديث"),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("❌ خطأ أثناء جلب التحديث: $e"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// ✅ دالة التحقق من توفر الإنترنت بدون `connectivity_plus`
Future<bool> _isConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (_) {
    return false;
  }
}
 




















// ===================================================

