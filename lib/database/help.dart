

/* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void checkForUpdate(BuildContext context) async {
  const String githubVersionUrl =
      "https://raw.githubusercontent.com/Esmaelasid/myaccounts_pro/main/version.json";
  const String updateUrl =
      "https://mritasid.github.io/Html_And_Css_template_tow/#flanding";

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


 */



/* class DatabaseHelper {
  // ... (الدوال الأخرى موجودة مسبقًا)

  // استرجاع جميع الوكلاء
  Future<List<Map<String, dynamic>>> getAllAgents() async {
    final db = await database;
    return await db.query('agents');
  }

  // حذف وكيل
  Future<int> deleteAgent(int id) async {
    final db = await database;
    return await db.delete('agents', where: 'id = ?', whereArgs: [id]);
  }

  // تعديل وكيل
  Future<int> updateAgent(int id, String name, String phone) async {
    final db = await database;
    return await db.update(
      'agents',
      {'name': name, 'phone': phone},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
 */
/* import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

Future<File> exportDatabase() async {
  final db = await database;
  final dbPath = await getDatabasesPath();
  final dbFile = File(join(dbPath, 'app_database.db'));

  // الحصول على مسار الذاكرة الخارجية
  final directory = Directory('/storage/emulated/0/Documents');
  if (!await directory.exists()) {
    throw Exception('لا يمكن الوصول إلى مجلد Documents');
  }

  // إنشاء مجلد "MritPro" داخل مجلد "Documents" إذا لم يكن موجودًا
  final mritProDir = Directory('${directory.path}/MritPro');
  if (!await mritProDir.exists()) {
    await mritProDir.create(recursive: true);
  }

  // نسخ قاعدة البيانات إلى مجلد MritPro
  final backupFile = File(
      '${mritProDir.path}/app_database_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.db');
  await dbFile.copy(backupFile.path);

  return backupFile;
}

 */

/* import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'database_helper.dart';

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


/* 
// ===================================================
      // Database.dart 
// ===================================================
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:intl/intl.dart'; // مكتبة للتعامل مع التاريخ

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

/*   Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  // إنشاء جدول العملاء

  Future<void> _onCreate(Database db, int version) async {
    // إنشاء جدول العملاء
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');
    await db.execute('''
    CREATE TABLE operations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      client_id INTEGER NOT NULL,
      amount REAL,
      details TEXT,
      type TEXT,
      date TEXT,
      FOREIGN KEY (client_id) REFERENCES clients (id)
  )    
    ''');
        await db.execute('''
      CREATE TABLE daily_account (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        details TEXT NOT NULL,
        type TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }
 */

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');

    // حذف قاعدة البيانات إذا كانت موجودة (للتطوير فقط)
    // await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 2, // زيادة رقم الإصدار
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // إنشاء جدول العملاء
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');

    // إنشاء جدول العمليات
    await db.execute('''
      CREATE TABLE operations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        client_id INTEGER NOT NULL,
        amount REAL,
        details TEXT,
        type TEXT,
        date TEXT,
        FOREIGN KEY (client_id) REFERENCES customers (id)
      )
    ''');

    // إنشاء جدول الحساب اليومي
    await db.execute('''
      CREATE TABLE daily_account (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        details TEXT NOT NULL,
        type TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  // دالة للتحقق من وجود جدول
  Future<bool> doesTableExist(String tableName) async {
    final db = await database;
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'",
    );
    return result.isNotEmpty;
  }

// إضافة عميل جديد
  Future<int> insertCustomer(String name, String phone) async {
    final db = await database;

    // إزالة الفراغات من بداية ونهاية الاسم
    String trimmedName = name.trim();

    return await db.insert('customers', {'name': trimmedName, 'phone': phone});
  }

  // استرجاع جميع العملاء
  Future<List<Map<String, dynamic>>> getAllCustomers() async {
    final db = await database;
    return await db.query('customers');
  }

  // تحديث بيانات عميل
  Future<int> updateCustomer(int id, String name, String phone) async {
    final db = await database;
    String trimmedName = name.trim();

    return await db.update(
      'customers',
      {'name': trimmedName, 'phone': phone},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // حذف عميل
  Future<int> deleteCustomer(int id) async {
    final db = await database;
    return await db.delete(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

// =====================================
  // NEW
// =====================================
  Future<bool> doesClientExist(String name) async {
    final db = await database;
    final result = await db.query(
      'customers',
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }

  Future<int> addClient(String name, String phone) async {
    final db = await database;
    return await db.insert(
      'customers',
      {'name': name, 'phone': phone},
    );
  }


  Future<void> insertOperation(
      int clientId, double amount, String details, String type) async {
    final db = await database;
  String creetDate = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    await db.insert('operations', {
      'client_id': clientId, // حفظ ID العميل
      'amount': amount,
      'details': details,
      'type': type,
      'date': creetDate,
    });
  }

// =====================================
// =====================================

  Future<List<String>> getClientNames(String query) async {
    final db = await database;

    // البحث عن الأسماء التي تحتوي على النص المدخل
    final result = await db.rawQuery(
      "SELECT name FROM customers WHERE name LIKE ?",
      ['%$query%'],
    );

    // تحويل النتائج إلى قائمة من النصوص
    return result.map((row) => row['name'].toString()).toList();
  }


  Future<List<Map<String, dynamic>>> searchClientsByName(String query) async {
    final db = await database;
    return await db.query(
      'customers',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      limit: 10, // تحديد عدد النتائج
    );
  }

  Future<List<Map<String, dynamic>>> getLastTenOperationsWithNames() async {
    final db = await database;
    return await db.rawQuery('''
    SELECT 
      operations.id AS operation_id, 
      operations.client_id, 
      operations.amount, 
      operations.details, 
      operations.type, 
      operations.date,
      customers.name AS client_name
    FROM operations
    LEFT JOIN customers ON operations.client_id = customers.id
    ORDER BY operations.id DESC
    LIMIT 50
  ''');
  }

  Future<int> deleteOperation(int operationId) async {
    final db = await database;
    return await db.delete(
      'operations',
      where: 'id = ?',
      whereArgs: [operationId],
    );
  }


Future<int> updateOperation(
    int id, double amount, String details, String type) async {
  final db = await database;

  // تحديث التاريخ عند التعديل
  String updatedDate = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  return await db.update(
    'operations',
    {
      'amount': amount,
      'details': details,
      'type': type,
      'date': updatedDate,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<List<Map<String, dynamic>>> getOperationsByClientName(String name) async {
  final db = await database;

  // استعلام لاسترجاع العمليات المرتبطة باسم العميل المدخل
  return await db.rawQuery('''
    SELECT 
      operations.id AS operation_id, 
      operations.amount, 
      operations.details, 
      operations.type, 
      operations.date, 
      customers.name AS client_name
    FROM operations
    INNER JOIN customers ON operations.client_id = customers.id
    WHERE customers.name = ?
    ORDER BY operations.date DESC
  ''', [name]);
}

Future<Map<String, dynamic>> getSummaryByName(String name) async {
  final db = await database;

  // استعلام للحصول على إجمالي المبالغ التي نوعها "إضافة"
  final additionsResult = await db.rawQuery(
    '''
    SELECT SUM(o.amount) as totalAdditions
    FROM operations o
    INNER JOIN customers c ON o.client_id = c.id
    WHERE c.name = ? AND o.type = "إضافة"
    ''',
    [name],
  );

  // استعلام للحصول على إجمالي المبالغ التي نوعها "تسديد"
  final paymentsResult = await db.rawQuery(
    '''
    SELECT SUM(o.amount) as totalPayments
    FROM operations o
    INNER JOIN customers c ON o.client_id = c.id
    WHERE c.name = ? AND o.type = "تسديد"
    ''',
    [name],
  );

  // استخراج القيم من النتائج
  final totalAdditions = additionsResult.first['totalAdditions'] ?? 0.0;
  final totalPayments = paymentsResult.first['totalPayments'] ?? 0.0;

  // حساب المبلغ المستحق
  final outstanding = (totalAdditions as double) - (totalPayments as double);

  return {
    'totalAdditions': totalAdditions,
    'totalPayments': totalPayments,
    'outstanding': outstanding,
  };
}

 // دالة لتوليد التاريخ بتنسيق yyyy/MM/dd باستخدام intl
  String getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy/MM/dd'); // تنسيق التاريخ
    return formatter.format(now);
  }

// ===================================

  // دالة لإضافة عملية جديدة
Future<void> insertDailyTransaction(double amount, String details, String type) async {
  final db = await database;
  final date = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()); // تنسيق التاريخ

  await db.insert(
    'daily_account',
    {
      'amount': amount,
      'details': details,
      'type': type,
      'date': date,
    },
  );
}

Future<List<Map<String, dynamic>>> getDailyTransactions() async {
  final db = await database;
  return await db.query('daily_account', orderBy: 'date DESC'); // ترتيب العمليات حسب التاريخ
}


Future<int> deleteDailyTransaction(int id) async {
  final db = await database;
  return await db.delete(
    'daily_account',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<int> updateDailyTransaction(int id, double amount, String details, String type) async {
  final db = await database;
  final date = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()); // تحديث التاريخ

  return await db.update(
    'daily_account',
    {
      'amount': amount,
      'details': details,
      'type': type,
      'date': date,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

}






 */





/* 





import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class DailyAccountPage extends StatefulWidget {
  const DailyAccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DailyAccountPageState createState() => _DailyAccountPageState();
}

class _DailyAccountPageState extends State<DailyAccountPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _transactions = [];
  DateTime _selectedDate = DateTime.now(); // التاريخ المحدد

  @override
  void initState() {
    super.initState();
    _loadTransactions(); // تحميل عمليات اليوم الحالي
  }

  // دالة لتحميل العمليات من قاعدة البيانات
  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getDailyTransactions();
    final today = DateTime.now();
    final filteredTransactions = transactions.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.year == today.year &&
             transactionDate.month == today.month &&
             transactionDate.day == today.day;
    }).toList();

    setState(() {
      _transactions = filteredTransactions;
    });
  }

  // دالة لحذف عملية
  Future<void> _deleteTransaction(int id) async {
    await _dbHelper.deleteDailyTransaction(id);
    _loadTransactions(); // إعادة تحميل العمليات بعد الحذف
  }

  // دالة لعرض تفاصيل العملية في نافذة منبثقة
  void _showTransactionDetails(Map<String, dynamic> transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تفاصيل العملية'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['date']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التفاصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['details']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('المبلغ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['amount'].toString()),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('النوع', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              transaction['type'],
                              style: TextStyle(
                                color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الحذف
                          _deleteTransaction(transaction['id']);
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('حذف'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية التعديل
                          // يمكنك إضافة الكود الخاص بالتعديل هنا
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('تعديل'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // دالة لاختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _filterTransactionsByDate(picked);
    }
  }

  // دالة لتصفية العمليات حسب التاريخ
  Future<void> _filterTransactionsByDate(DateTime date) async {
    final transactions = await _dbHelper.getDailyTransactions();
    final filteredTransactions = transactions.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.year == date.year &&
             transactionDate.month == date.month &&
             transactionDate.day == date.day;
    }).toList();

    if (filteredTransactions.isEmpty) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يوجد عمليات لليوم المحدد'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _transactions = filteredTransactions;
    });
  }

  // دالة لعرض ملخص العمليات
  void _showSummary() {
    // حساب مجموع الكسب
    final totalIncome = _transactions
        .where((transaction) => transaction['type'] == 'كسب')
        .fold(0.0, (sum, transaction) => sum + transaction['amount']);

    // حساب مجموع الصرف
    final totalExpense = _transactions
        .where((transaction) => transaction['type'] == 'صرف')
        .fold(0.0, (sum, transaction) => sum + transaction['amount']);

    // حساب الربح
    final profit = totalIncome - totalExpense;

    showDialog(
      context: context,
      builder: (context) {
        return
                  Dialog(
            backgroundColor: const Color(0xFFEEEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                'ملخص عمليات',

                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    ' ${_selectedDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ),
              
              
              
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(6.5), // الكلمات التعريفية 20%
                          1: FlexColumnWidth(3.5), // البيانات 80%
                        },
                        border: TableBorder.all(
                          color: Colors.cyan,
                          width: 1.5,
                        ),
                        children: [
                            
                          _buildInfoRow('الكسب',totalIncome.toString(), ),
                          _buildInfoRow(
                              'الصرف', totalExpense.toString(),),
                          _buildInfoRow(
                              ' الصافي',  profit.toString(),
                              // TextStyle()
                          
                              ),
                          // _buildInfoRow(
                              // 'المبلغ المستحق', '${summary['outstanding']}'),
                        ]),
                  ),
                  const SizedBox(height: 16.0),
                  // زر الإغلاق
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'إغلاق',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        
        
/*          Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.cyan, // خلفية زرقاء
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'ملخص عمليات',
                style: TextStyle(
                  color: Colors.white, // نص أبيض
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' ${_selectedDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Table(
                    border: TableBorder.all(color: Colors.cyan, width: 2,),
                    children: [
                      // TableRow(
                      //   children: [
                      //     const Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text(
                      //         'الكلمات التعريفية',
                      //         style: TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     const Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text(
                      //         'البيانات',
                      //         style: TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('الكسب', 
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                            totalIncome.toString(),
                             style: TextStyle(color: Colors.green,fontWeight:FontWeight.w800),
                            textAlign: TextAlign.center,

                             ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('الصرف',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(totalExpense.toString(),
                             style: TextStyle(color: Colors.red,fontWeight:FontWeight.w800),
                            textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('الربح',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              profit.toString(),
                              style: TextStyle(
                                color: profit >= 0 ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // إغلاق النافذة
                },
                child: const Text('إغلاق'),
              ),
            ],
          ),
        );
      */
     
     
      },
    );
  }
  TableRow _buildInfoRow(String title, dynamic value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value.toString(),
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

 
 
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false, // إصلاح المشكلة عند ظهور لوحة المفاتيح
        appBar: AppBar(
          title: const Text(
            'حسابي الشخصي اليومي',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.0),
          ),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: const Icon(Icons.home_outlined, size: 35),
            onPressed: () {
              Navigator.pop(context); // العودة إلى الصفحة الرئيسية
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.cyan),
                    top: BorderSide(width: 2, color: Colors.cyan),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(
                      icon: const Icon(
                        Icons.date_range_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => _selectDate(context),
                    ),

                         Text(
                      ' ${_selectedDate.toLocal().toString().split(' ')[0]}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 7, // نسبة 70%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 30%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];

                            // تحديد لون الأيقونة حسب نوع العملية
                            Color iconColor;
                            if (transaction['type'] == 'صرف') {
                              iconColor = Colors.red; // لون أحمر للإضافة
                            } else if (transaction['type'] == 'كسب') {
                              iconColor = Colors.green; // لون أخضر للتسديد
                            } else {
                              iconColor = Colors.blue; // لون افتراضي
                            }

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  // عمود التفاصيل
                                  Expanded(
                                    flex: 7, // نسبة 70%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['details'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 30%
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: iconColor, // اللون يعتمد على نوع العملية
                                      ),
                                      onPressed: () {
                                        _showTransactionDetails(transaction);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(top: BorderSide(width: 3, color: Colors.cyan)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 30, color: Colors.white),
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => const AddTransactionDialog(),
                          );

                          if (result != null && result) {
                            _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: _showSummary, // عرض ملخص العمليات
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// نافذة إضافة عملية جديدة
class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({Key? key}) : super(key: key);

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedType = 'كسب';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        // title: const Text('إضافة عملية جديدة'),
           backgroundColor: const Color(0xFFEEEBEB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
        child: SingleChildScrollView(
          child: Container(
                  // padding: const EdgeInsets.all(0.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                            // 'تعديل العملية'
                            'إضافة عملية جديدة',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                                                const SizedBox(height: 20.0),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

 
  Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'المبلغ',labelStyle:  TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                           border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                    // البوردر الافتراضي
                                  ),
                                           enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 2.0),
                                    // البوردر عند عدم التركيز
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan,
                                        width: 2.0), // البوردر عند التركيز
                                  ),
                                      
                                       ),
                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                  keyboardType: TextInputType.number,
                  
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال المبلغ';
                    }
                    return null;
                  },
                ),
                              const SizedBox(height: 20.0),

                TextFormField(
                  controller: _detailsController,
                  decoration: const InputDecoration(labelText: 'التفاصيل' ,labelStyle:  TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                           border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                    // البوردر الافتراضي
                                  ),
                                                 enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 2.0),
                                    // البوردر عند عدم التركيز
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan,
                                        width: 2.0), // البوردر عند التركيز
                                  ),
                                  ),
                                   style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال التفاصيل';
                    }
                    return null;
                  },
                ),
/*                 DropdownButtonFormField<String>(
                  value: _selectedType,
                  items: ['كسب', 'صرف'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'النوع'),
                ),
            */
              ],
            ),
          ),
  
  ),

                               // الحد العلوي بعرض 3 بكسل
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),

                        const SizedBox(height: 10.0),

                        // اختيار نوع العملية

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              padding:
                                  const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFFFF665B), width: 2.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'صرف',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Radio<String>(
                                    value: 'صرف',
                                    focusColor: Colors.red,
                                    hoverColor: Colors.red,
                                    activeColor: Colors.red,
                                    // fillColor: Colors.red,
                                    groupValue: _selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedType = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFF70FF75), width: 2.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'كسب',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Radio<String>(
                                    value: 'كسب',
                                    focusColor: Colors.green,
                                    hoverColor: Colors.green,
                                    activeColor: Colors.green,
                                    groupValue: _selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedType = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                                            // الحد العلوي بعرض 3 بكسل
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: Colors.cyan,
                        ),
                        const SizedBox(height: 10.0),

                        // أزرار الحفظ والإلغاء
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                           onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                // ignore: use_build_context_synchronously
                Navigator.pop(context, true); // حفظ وإغلاق النافذة
                      ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم حفظ العملية بنجاح'),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
              }
            },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: Colors.cyan,
                                // ignore: deprecated_member_use
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 4,
                              ),
                              child: const Text('حفظ'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: Colors.cyan,
                                // ignore: deprecated_member_use
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 4,
                              ),
                              child: const Text('إلغاء'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                  

],
                  ),
          ),
          
          
          

       
        ),
      
 /*      
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // إلغاء
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                // ignore: use_build_context_synchronously
                Navigator.pop(context, true); // حفظ وإغلاق النافذة
              }
            },
            child: const Text('حفظ'),
          ),
        ],
       */
      
      
      ),
    );
  }
}




// ======================================================================
// good brfeact
// ======================================================

/* import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class DailyAccountPage extends StatefulWidget {
  const DailyAccountPage({Key? key}) : super(key: key);

  @override
  _DailyAccountPageState createState() => _DailyAccountPageState();
}

class _DailyAccountPageState extends State<DailyAccountPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _transactions = [];
  DateTime _selectedDate = DateTime.now(); // التاريخ المحدد

  @override
  void initState() {
    super.initState();
    _loadTransactions(); // تحميل عمليات اليوم الحالي
  }

  // دالة لتحميل العمليات من قاعدة البيانات
  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getDailyTransactions();
    final today = DateTime.now();
    final filteredTransactions = transactions.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.year == today.year &&
             transactionDate.month == today.month &&
             transactionDate.day == today.day;
    }).toList();

    setState(() {
      _transactions = filteredTransactions;
    });
  }

  // دالة لحذف عملية
  Future<void> _deleteTransaction(int id) async {
    await _dbHelper.deleteDailyTransaction(id);
    _loadTransactions(); // إعادة تحميل العمليات بعد الحذف
  }

  // دالة لعرض تفاصيل العملية في نافذة منبثقة
  void _showTransactionDetails(Map<String, dynamic> transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تفاصيل العملية'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['date']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التفاصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['details']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('المبلغ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['amount'].toString()),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('النوع', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              transaction['type'],
                              style: TextStyle(
                                color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الحذف
                          _deleteTransaction(transaction['id']);
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('حذف'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية التعديل
                          // يمكنك إضافة الكود الخاص بالتعديل هنا
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('تعديل'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // دالة لاختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _filterTransactionsByDate(picked);
    }
  }

  // دالة لتصفية العمليات حسب التاريخ
  Future<void> _filterTransactionsByDate(DateTime date) async {
    final transactions = await _dbHelper.getDailyTransactions();
    final filteredTransactions = transactions.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.year == date.year &&
             transactionDate.month == date.month &&
             transactionDate.day == date.day;
    }).toList();

    if (filteredTransactions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يوجد عمليات لليوم المحدد'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _transactions = filteredTransactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false, // إصلاح المشكلة عند ظهور لوحة المفاتيح
        appBar: AppBar(
          title: const Text(
            'حسابي الشخصي اليومي',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.0),
          ),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: const Icon(Icons.home_outlined, size: 35),
            onPressed: () {
              Navigator.pop(context); // العودة إلى الصفحة الرئيسية
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.cyan),
                    top: BorderSide(width: 2, color: Colors.cyan),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'عمليات ${_selectedDate.toLocal().toString().split(' ')[0]}',
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.date_range_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 7, // نسبة 70%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 30%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];

                            // تحديد لون الأيقونة حسب نوع العملية
                            Color iconColor;
                            if (transaction['type'] == 'صرف') {
                              iconColor = Colors.red; // لون أحمر للإضافة
                            } else if (transaction['type'] == 'كسب') {
                              iconColor = Colors.green; // لون أخضر للتسديد
                            } else {
                              iconColor = Colors.blue; // لون افتراضي
                            }

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  // عمود التفاصيل
                                  Expanded(
                                    flex: 7, // نسبة 70%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['details'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 30%
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: iconColor, // اللون يعتمد على نوع العملية
                                      ),
                                      onPressed: () {
                                        _showTransactionDetails(transaction);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(top: BorderSide(width: 3, color: Colors.cyan)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 30, color: Colors.white),
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => const AddTransactionDialog(),
                          );

                          if (result != null && result) {
                            _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
                          }
                        },
                      ),
                    ),
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// نافذة إضافة عملية جديدة
class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({Key? key}) : super(key: key);

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedType = 'كسب';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('إضافة عملية جديدة'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'المبلغ'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال المبلغ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _detailsController,
                  decoration: const InputDecoration(labelText: 'التفاصيل'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال التفاصيل';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  items: ['كسب', 'صرف'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'النوع'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // إلغاء
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                Navigator.pop(context, true); // حفظ وإغلاق النافذة
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}
 */

// ==========================================================================


/* import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class DailyAccountPage extends StatefulWidget {
  const DailyAccountPage({Key? key}) : super(key: key);

  @override
  _DailyAccountPageState createState() => _DailyAccountPageState();
}

class _DailyAccountPageState extends State<DailyAccountPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _transactions = [];
  DateTime _selectedDate = DateTime.now(); // التاريخ المحدد

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  // دالة لتحميل العمليات من قاعدة البيانات
  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getDailyTransactions();
    setState(() {
      _transactions = transactions;
    });
  }

  // دالة لحذف عملية
  Future<void> _deleteTransaction(int id) async {
    await _dbHelper.deleteDailyTransaction(id);
    _loadTransactions(); // إعادة تحميل العمليات بعد الحذف
  }

  // دالة لعرض تفاصيل العملية في نافذة منبثقة
  void _showTransactionDetails(Map<String, dynamic> transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تفاصيل العملية'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['date']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التفاصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['details']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('المبلغ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['amount'].toString()),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('النوع', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              transaction['type'],
                              style: TextStyle(
                                color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الحذف
                          _deleteTransaction(transaction['id']);
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('حذف'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية التعديل
                          // يمكنك إضافة الكود الخاص بالتعديل هنا
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('تعديل'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // دالة لاختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _filterTransactionsByDate(picked);
    }
  }

  // دالة لتصفية العمليات حسب التاريخ
  Future<void> _filterTransactionsByDate(DateTime date) async {
    final transactions = await _dbHelper.getDailyTransactions();
    final filteredTransactions = transactions.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.year == date.year &&
             transactionDate.month == date.month &&
             transactionDate.day == date.day;
    }).toList();

    if (filteredTransactions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يوجد عمليات لليوم المحدد'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _transactions = filteredTransactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false, // إصلاح المشكلة عند ظهور لوحة المفاتيح
        appBar: AppBar(
          title: const Text(
            'حسابي الشخصي اليومي',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.0),
          ),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: const Icon(Icons.home_outlined, size: 35),
            onPressed: () {
              Navigator.pop(context); // العودة إلى الصفحة الرئيسية
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.cyan),
                    top: BorderSide(width: 2, color: Colors.cyan),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'عمليات ${_selectedDate.toLocal().toString().split(' ')[0]}',
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.date_range_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 7, // نسبة 70%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 30%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];

                            // تحديد لون الأيقونة حسب نوع العملية
                            Color iconColor;
                            if (transaction['type'] == 'صرف') {
                              iconColor = Colors.red; // لون أحمر للإضافة
                            } else if (transaction['type'] == 'كسب') {
                              iconColor = Colors.green; // لون أخضر للتسديد
                            } else {
                              iconColor = Colors.blue; // لون افتراضي
                            }

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  // عمود التفاصيل
                                  Expanded(
                                    flex: 7, // نسبة 70%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['details'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 30%
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: iconColor, // اللون يعتمد على نوع العملية
                                      ),
                                      onPressed: () {
                                        _showTransactionDetails(transaction);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(top: BorderSide(width: 3, color: Colors.cyan)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 30, color: Colors.white),
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => const AddTransactionDialog(),
                          );

                          if (result != null && result) {
                            _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
                          }
                        },
                      ),
                    ),
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// نافذة إضافة عملية جديدة
class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({Key? key}) : super(key: key);

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedType = 'كسب';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('إضافة عملية جديدة'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'المبلغ'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال المبلغ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _detailsController,
                  decoration: const InputDecoration(labelText: 'التفاصيل'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال التفاصيل';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  items: ['كسب', 'صرف'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'النوع'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // إلغاء
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                Navigator.pop(context, true); // حفظ وإغلاق النافذة
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}

 */







 */


// =  ===================================================================
// =  ===================================================================
// =  ===================================================================
// =================6
// =  ===================================================================
// =  ===================================================================
/* 



import 'package:flutter/material.dart';
import '../database/database_helper.dart';


class DailyAccountPage extends StatefulWidget {
  const DailyAccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DailyAccountPageState createState() => _DailyAccountPageState();
}

class _DailyAccountPageState extends State<DailyAccountPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _transactions = [];
// ignore: non_constant_identifier_names
final SezhDay = 'اليوم';
  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  // دالة لتحميل العمليات من قاعدة البيانات
  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getDailyTransactions();
    setState(() {
      _transactions = transactions;
    });
  }

  // دالة لحذف عملية
  Future<void> _deleteTransaction(int id) async {
    await _dbHelper.deleteDailyTransaction(id);
    _loadTransactions(); // إعادة تحميل العمليات بعد الحذف
  }

  // دالة لعرض تفاصيل العملية في نافذة منبثقة
  void _showTransactionDetails(Map<String, dynamic> transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تفاصيل العملية'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['date']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('التفاصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['details']),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('المبلغ', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(transaction['amount'].toString()),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('النوع', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              transaction['type'],
                              style: TextStyle(
                                color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الحذف
                          _deleteTransaction(transaction['id']);
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('حذف'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية التعديل
                          // يمكنك إضافة الكود الخاص بالتعديل هنا
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('تعديل'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // إغلاق النافذة
                        },
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:
    
    
     Scaffold(
        resizeToAvoidBottomInset: false, // إصلاح المشكلة عند ظهور لوحة المفاتيح

      appBar: AppBar(
        // title: const Text('حسابي الشخصي اليومي'),
         title: const Text(
            'حسابي الشخصي اليومي',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.0),
          ),
          backgroundColor: Colors.cyan,
      
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, size: 35,),
          onPressed: () {
            Navigator.pop(context); // العودة إلى الصفحة الرئيسية
          },
        ),
      ),


      body: Padding(
          padding:  const EdgeInsets.fromLTRB(0 ,0, 0, 0),
          child: Column(
            children: [
   Container(
                padding:const EdgeInsets.all(5),
           decoration : const BoxDecoration(
                        color: Color(0x8300BBD4),
                        border:Border(
                          bottom:BorderSide(width: 3, color: Colors.cyan),
                          top:BorderSide(width: 2, color: Colors.cyan)
                          )
                    ),
                    child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [                         
                          Text(
                            'عمليات  $SezhDay',                           
                          ),
                            Icon(
      Icons.date_range_sharp, color: Colors.white, size: 40,
    ),
                      ],
                    ),

   ),

                Expanded(
                child: Container(
          margin:  const EdgeInsets.fromLTRB(6 ,10, 6, 0),

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 7, // نسبة 70%
                              child: Text(
                                'التفاصيل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2, // نسبة 30%
                              child: Text(
                                'معلومات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),                
                      Expanded(
                        child: ListView.builder(
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];

                            // تحديد لون الأيقونة حسب نوع العملية
                            Color iconColor;
                            if (transaction['type'] == 'صرف') {
                              iconColor = Colors.red; // لون أحمر للإضافة
                            } else if (transaction['type'] == 'كسب') {
                              iconColor = Colors.green; // لون أخضر للتسديد
                            } else {
                              iconColor = Colors.blue; // لون افتراضي
                            }

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color(0xFFF1F1F1)
                                    : Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: Colors.cyan, width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
              // عمود التفاصيل
                                  Expanded(
                                    flex: 7, // نسبة 70%
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                          right: BorderSide(
                                              color: Colors.cyan, width: 2.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          transaction['details'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // عمود معلومات
                                  Expanded(
                                    flex: 2, // نسبة 30%
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color:
                                            iconColor, // اللون يعتمد على نوع العملية
                                      ),
                                      onPressed: () {
                                        _showTransactionDetails(transaction);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                padding:const EdgeInsets.all(5),
           decoration : const BoxDecoration(
                        color: Color(0x8300BBD4),
                        border:Border(top:BorderSide(width: 3, color: Colors.cyan))
                    ),
                child: Row(
  mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.search_sharp, color: Colors.white, size: 40,
                      ),
          Container(
              decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan,

                  ),
      child: IconButton(
          
             icon: const Icon(Icons.add, size: 30, color: Colors.white, ),
    onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => const AddTransactionDialog(),
          );

          if (result != null && result) {
            _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
          }
        },
        
        ),
    ),
    Icon(
      Icons.info_outline, color: Colors.white, size: 40,
    ),

  ],
),

              ),

            
            ],
          ),
        ),
      //         floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final result = await showDialog(
      //       context: context,
      //       builder: (context) => const AddTransactionDialog(),
      //     );

      //     if (result != null && result) {
      //       _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
      //     }
      //   },
      //   child: Center(
      //     widthFactor: 160,
      //     child: 
      //    const Icon(Icons.add),
          
      //   )
        
        
      // ),
    
   
      ),
     
     

    // ),
 
 
 ); }
}

// نافذة إضافة عملية جديدة
class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({Key? key}) : super(key: key);

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedType = 'كسب';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('إضافة عملية جديدة'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'المبلغ'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال المبلغ';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _detailsController,
                  decoration: const InputDecoration(labelText: 'التفاصيل'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال التفاصيل';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  items: ['كسب', 'صرف'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'النوع'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // إلغاء
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                Navigator.pop(context, true); // حفظ وإغلاق النافذة
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}
/* import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class DailyAccountPage extends StatefulWidget {
  const DailyAccountPage({Key? key}) : super(key: key);

  @override
  _DailyAccountPageState createState() => _DailyAccountPageState();
}

class _DailyAccountPageState extends State<DailyAccountPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  // دالة لتحميل العمليات من قاعدة البيانات
  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getDailyTransactions();
    setState(() {
      _transactions = transactions;
    });
  }

  // دالة لإضافة عملية جديدة
  Future<void> _addTransaction() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AddTransactionDialog(),
    );

    if (result != null && result) {
      _loadTransactions(); // إعادة تحميل العمليات بعد الإضافة
    }
  }

  // دالة لحذف عملية
  Future<void> _deleteTransaction(int id) async {
    await _dbHelper.deleteDailyTransaction(id);
    _loadTransactions(); // إعادة تحميل العمليات بعد الحذف
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حسابي الشخصي اليومي'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // العودة إلى الصفحة الرئيسية
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // جعل الاتجاه RTL
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
/*                   DataTable(
                    columns: const [
                      DataColumn(label: Text('التاريخ')),
                      DataColumn(label: Text('التفاصيل')),
                      DataColumn(label: Text('المبلغ')),
                      DataColumn(label: Text('النوع')),
                    ],
                    rows: _transactions.map((transaction) {
                      return DataRow(cells: [
                        DataCell(Text(transaction['date'])),
                        DataCell(Text(transaction['details'])),
                        DataCell(Text(transaction['amount'].toString())),
                        DataCell(Text(
                          transaction['type'],
                          style: TextStyle(
                            color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
                          ),
                        )),
                        DataCell(IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTransaction(transaction['id']),
                        )),
                      ]);
                    }).toList(),
                  ),
                */
 DataTable(
  columns: const [
    DataColumn(label: Text('التاريخ')),
    DataColumn(label: Text('التفاصيل')),
    DataColumn(label: Text('المبلغ')),
    DataColumn(label: Text('النوع')),
    DataColumn(label: Text('حذف')), // عمود جديد لحذف العمليات
  ],
  rows: _transactions.map((transaction) {
    return DataRow(cells: [
      DataCell(Text(transaction['date'])), // الخلية الأولى: التاريخ
      DataCell(Text(transaction['details'])), // الخلية الثانية: التفاصيل
      DataCell(Text(transaction['amount'].toString())), // الخلية الثالثة: المبلغ
      DataCell(Text(
        transaction['type'],
        style: TextStyle(
          color: transaction['type'] == 'صرف' ? Colors.red : Colors.green,
        ),
      )), // الخلية الرابعة: النوع
      DataCell(IconButton( // الخلية الخامسة: زر الحذف
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => _deleteTransaction(transaction['id']),
      )),
    ]);
  }).toList(),
)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransaction,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// نافذة إضافة عملية جديدة
class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({Key? key}) : super(key: key);

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();
  String _selectedType = 'كسب';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // جعل الاتجاه RTL
      child: AlertDialog(
        title: const Text('إضافة عملية جديدة'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'المبلغ'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال المبلغ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _detailsController,
                decoration: const InputDecoration(labelText: 'التفاصيل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال التفاصيل';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: ['كسب', 'صرف'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'النوع'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // إلغاء
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                final details = _detailsController.text;
                final type = _selectedType;

                final dbHelper = DatabaseHelper();
                await dbHelper.insertDailyTransaction(amount, details, type);

                Navigator.pop(context, true); // حفظ وإغلاق النافذة
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}

 */







 */






/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');

    // حذف قاعدة البيانات إذا كانت موجودة (للتطوير فقط)
    await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 2, // زيادة رقم الإصدار
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // إنشاء جدول العملاء
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');

    // إنشاء جدول العمليات
    await db.execute('''
      CREATE TABLE operations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        client_id INTEGER NOT NULL,
        amount REAL,
        details TEXT,
        type TEXT,
        date TEXT,
        FOREIGN KEY (client_id) REFERENCES customers (id)
      )
    ''');

    // إنشاء جدول الحساب اليومي
    await db.execute('''
      CREATE TABLE daily_account (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        details TEXT NOT NULL,
        type TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  // دالة للتحقق من وجود جدول
  Future<bool> doesTableExist(String tableName) async {
    final db = await database;
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'",
    );
    return result.isNotEmpty;
  }


}

 */







/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'daily_account.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_account (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        details TEXT NOT NULL,
        type TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  // دالة لإضافة عملية جديدة
  Future<void> insertDailyTransaction(double amount, String details, String type) async {
    final db = await database;
    final date = DateTime.now().toString(); // تاريخ العملية

    await db.insert(
      'daily_account',
      {
        'amount': amount,
        'details': details,
        'type': type,
        'date': date,
      },
    );
  }

  // دالة لاسترجاع العمليات
  Future<List<Map<String, dynamic>>> getDailyTransactions() async {
    final db = await database;
    return await db.query('daily_account');
  }


} */