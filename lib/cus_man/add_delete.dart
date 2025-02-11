import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'add_transaction.dart';
import 'search.dart';
import '../main.dart';

class AddDeletePage extends StatefulWidget {
  const AddDeletePage({super.key});

  @override
  State<AddDeletePage> createState() => _AddDeletePageState();
}

class _AddDeletePageState extends State<AddDeletePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _customers = [];
  List<Map<String, dynamic>> _agents = [];
  bool _showCustomersTable = true; // متغير للتبديل بين الجداول
  bool _showSearchField = false; // للتحكم في إظهار حقل البحث
  String _searchQuery = ''; // لتخزين نص البحث

  @override
  void initState() {
    super.initState();
    _loadCustomers();
    _loadAgents();

    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        _nameController.selection = TextSelection.fromPosition(
          TextPosition(offset: _nameController.text.length),
        );
      }
    });
  }

  void _loadCustomers() async {
    final data = await _dbHelper.getAllCustomers();

    setState(() {
      _customers = data;
    });
  }

  void _loadAgents() async {
    final data = await _dbHelper.getAllAgents();
    setState(() {
      _agents = data;
    });
  }

  void _toggleTable(bool showCustomers) {
    setState(() {
      _showCustomersTable = showCustomers;
    });
  }

  void _showAddAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'إضافة حساب جديد',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showAddCustomerDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('عميل'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showAddAgentDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('وكيل'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: const Color(0xFFF6F6F6),
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'إضافة عميل',
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
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'الاسم',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.blue,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _saveCustomer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'حفظ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).then((_) {
      _nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameController.text.length),
      );
    });
  }

  void _showAddAgentDialog() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: const Color(0xFFF6F6F6),
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
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'إضافة وكيل',
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
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'الاسم',
                          labelStyle: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0),
                          ),
                        ),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.orange,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _saveAgent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'حفظ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).then((_) {
      _nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameController.text.length),
      );
    });
  }

  void _saveCustomer() async {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      await _dbHelper.insertCustomer(
        _nameController.text,
        _phoneController.text,
      );
      _nameController.clear();
      _phoneController.clear();
      _showSuccessMessage('تم حفظ العميل بنجاح');
      _loadCustomers();
    } else {
      _showErrorMessage('يرجى إدخال جميع البيانات');
    }
    if (!mounted) return;

    Navigator.pop(context);
  }

  void _saveAgent() async {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      await _dbHelper.insertAgent(
        _nameController.text,
        _phoneController.text,
      );
      _nameController.clear();
      _phoneController.clear();
      _showSuccessMessage('تم حفظ الوكيل بنجاح');
      _loadAgents();
    } else {
      _showErrorMessage('يرجى إدخال جميع البيانات');
    }
    if (!mounted) return;

    Navigator.pop(context);
  }

  void _showTotalSummaryDialog() async {
    // استدعاء الدالة للحصول على النتائج
    final summary = await _dbHelper.getTotalSummary();

    // عرض النافذة المنبثقة
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        Color textColor;
        if (summary['totalOutstanding']!.toDouble() > 0) {
          textColor = Colors.orange;
        } else if (summary['totalOutstanding']!.toDouble() < 0) {
          textColor = Colors.red;
        } else {
          textColor = Colors.black;
        }

        int numString = summary['totalOutstanding']!.toInt();
        return Dialog(
          backgroundColor: const Color(0xFFE1E1E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: const Text(
                  ' معلومات العملاء',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.blue, width: 3.0),
                    bottom: BorderSide(color: Colors.blue, width: 3.0),
                  ),
                ),
                child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(5.0),
                      1: FlexColumnWidth(5.0),
                    },
                    border: TableBorder.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                    children: [
                      _buildInfoRow(
                          summary['totalCustomers']!.toString(), 'عدد العملاء'),
                      _buildInfoRow(summary['totalAdditions']!.toString(),
                          'إجمالي الإضافات'),
                      _buildInfoRow(summary['totalPayments']!.toString(),
                          'إجمالي التسديدات'),
                    ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.blue, width: 3),
                ),
                child: Column(
                  children: [
                    const Text(
                      'المبلغ المستحق على العملاء لك ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      numString.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 3,
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // إغلاق النافذة
                  },
                  child: const Text(
                    'إغلاق',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTotalAgeentsSummaryDialog() async {
    // استدعاء الدالة للحصول على النتائج
    final summary = await _dbHelper.getTotalAgeensSummary();

    // عرض النافذة المنبثقة
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        Color textColor;
        if (summary['totalOutstanding']!.toDouble() > 0) {
          textColor = Colors.red;
        } else if (summary['totalOutstanding']!.toDouble() < 0) {
          textColor = Colors.green;
        } else {
          textColor = Colors.black;
        }

        int numString = summary['totalOutstanding']!.toInt();
        return Dialog(
          backgroundColor: const Color(0xFFE1E1E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: const Text(
                  ' معلومات الموردين',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.orange, width: 3.0),
                    bottom: BorderSide(color: Colors.orange, width: 3.0),
                  ),
                ),
                child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(5.0),
                      1: FlexColumnWidth(5.0),
                    },
                    border: TableBorder.all(
                      color: Colors.orange,
                      width: 2.0,
                    ),
                    children: [
                      _buildInfoRow(summary['totalCustomers']!.toString(),
                          'عدد الموردين'),
                      _buildInfoRow(summary['totalAdditions']!.toString(),
                          'إجمالي القروض'),
                      _buildInfoRow(summary['totalPayments']!.toString(),
                          'إجمالي التسديدات'),
                    ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.orange, width: 3),
                ),
                child: Column(
                  children: [
                    const Text(
                      'المبلغ المستحق عليك للموردين ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      numString.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 3,
                color: Colors.orange,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // إغلاق النافذة
                  },
                  child: const Text(
                    'إغلاق',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // تصفية القائمة بناءً على نص البحث
    final filteredList = _showCustomersTable
        ? _customers
            .where((customer) => customer['name']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
            .toList()
        : _agents
            .where((agent) => agent['name']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
            .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEBEB),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'إدارة الحسابات',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22.0),
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.home,
                size: 35,
                color: Color(0xFFF26157),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      isDarkMode: true,
                      onThemeToggle: () {},
                    ), // استبدل AddTransactionPage بالصفحة المستهدفة
                  ),
                );
              }),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_balance_wallet,
                size: 30,
                color: Color(0xFFFF9334),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTransactionPage(),
                  ),
                );
              },
            ),
            const SizedBox(width: 18),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 106, 245, 111),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchClientPage(),
                  ),
                );
              },
            ),
            const SizedBox(width: 18),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // حقل البحث (يظهر على يمين الشاشة بجانب الأيقونات)
                  if (_showSearchField)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'ابحث بالاسم...',

                            hintStyle: TextStyle(color: Colors.grey[600]),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.red), // أيقونة إغلاق
                              onPressed: () {
                                setState(() {
                                  _showSearchField = false; // إخفاء حقل البحث
                                  _searchQuery = ''; // إعادة تعيين نص البحث
                                });
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0), // جعل الحقل أصغر
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchQuery =
                                  value; // تحديث نص البحث عند تغيير النص
                            });
                          },
                        ),
                      ),
                    ),

                  // أيقونتي العملاء والوكلاء
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width: 150.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.people,
                                  color: _showCustomersTable
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () => _toggleTable(true),
                              ),
                              Text(
                                'العملاء',
                                style: TextStyle(
                                    color: _showCustomersTable
                                        ? Colors.blue
                                        : Colors.grey,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.business,
                                  color: !_showCustomersTable
                                      ? Colors.orange
                                      : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () => _toggleTable(false),
                              ),
                              Text(
                                'الوكلاء',
                                style: TextStyle(
                                    color: !_showCustomersTable
                                        ? Colors.orange
                                        : Colors.grey,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            _showCustomersTable ? Colors.blue : Colors.orange,
                        width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              _showCustomersTable ? Colors.blue : Colors.orange,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text(
                                'الاسم',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            if (_showCustomersTable) // إظهار العمود الجديد فقط إذا كان _showCustomersTable يساوي true
                              const Expanded(
                                flex: 3,
                                child: Text(
                                  'المبلغ علية',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            if (!_showCustomersTable) // إظهار العمود الجديد فقط إذا كان _showCustomersTable يساوي true
                              const Expanded(
                                flex: 3,
                                child: Text(
                                  'المبلغ عليك',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            const Expanded(
                              flex: 2,
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
                          itemCount:
                              filteredList.length, // استخدام القائمة المصفاة
                          itemBuilder: (context, index) {
                            final item = filteredList[
                                index]; // استخدام العنصر من القائمة المصفاة
                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.grey[100]
                                    : Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                      color: _showCustomersTable
                                          ? Colors.blue
                                          : Colors.orange,
                                      width: 2.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Text(
                                        item['name'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2.0,
                                    height: 48,
                                    color: _showCustomersTable
                                        ? Colors.blue
                                        : Colors.orange,
                                  ),
                                  if (_showCustomersTable)
                                    Expanded(
                                      flex: 3,
                                      child:
                                          FutureBuilder<Map<String, dynamic>>(
                                        future: _dbHelper
                                            .getSummaryByName(item['name']),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'خطأ: ${snapshot.error}');
                                          } else {
                                            final outstanding =
                                                snapshot.data!['outstanding'];
                                            Color textColor;

                                            if (outstanding > 0) {
                                              textColor = Colors.red;
                                            } else if (outstanding < 0) {
                                              textColor = Colors.green;
                                            } else {
                                              textColor = Colors.black;
                                            }

                                            return Text(
                                              outstanding.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.w600,
                                                color: textColor,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  if (!_showCustomersTable)
                                    Expanded(
                                      flex: 3,
                                      child:
                                          FutureBuilder<Map<String, dynamic>>(
                                        future:
                                            _dbHelper.getSummaryAgeentByName(
                                                item['name']),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'خطأ: ${snapshot.error}');
                                          } else {
                                            final outstanding =
                                                snapshot.data!['outstanding'];
                                            Color textColor;

                                            if (outstanding > 0) {
                                              textColor = Colors.red;
                                            } else if (outstanding < 0) {
                                              textColor = Colors.green;
                                            } else {
                                              textColor = Colors.black;
                                            }

                                            return Text(
                                              outstanding.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.w600,
                                                color: textColor,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  Container(
                                    width: 2.0,
                                    height: 48,
                                    color: _showCustomersTable
                                        ? Colors.blue
                                        : Colors.orange,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.info,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        if (_showCustomersTable) {
                                          FocusScope.of(context).unfocus();
                                          _showCustomerDetails(
                                            item['name'],
                                            item['phone'],
                                            item['id'],
                                          );
                                        } else {
                                          FocusScope.of(context).unfocus();
                                          _showAgentDetails(
                                            item['name'],
                                            item['phone'],
                                            item['id'],
                                          );
                                        }
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
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0x8300BBD4),
                  border: Border(top: BorderSide(width: 3, color: Colors.cyan)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          _showSearchField =
                              !_showSearchField; // تبديل حالة إظهار حقل البحث
                          _searchQuery =
                              ''; // إعادة تعيين نص البحث عند إخفاء الحقل
                        });
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add,
                            size: 30, color: Colors.white),
                        onPressed: _showAddAccountDialog,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: _showCustomersTable
                          ? _showTotalSummaryDialog
                          : _showTotalAgeentsSummaryDialog,
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

  TableRow _buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 6.0, 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void _deleteCustomer(int id) async {
    await _dbHelper.deleteCustomer(id);
    _showSuccessMessage('تم حذف العميل بنجاح');
    _loadCustomers();
  }

  void _showCustomerDetails(String name, String phone, int id) async {
    final summary = await _dbHelper.getSummaryByName(name);
    if (!mounted) return;

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFFF6F6F6),
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
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      ' تفاصيل العميل',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3.5),
                          1: FlexColumnWidth(6.5),
                        },
                        border: TableBorder.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        children: [
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'الاسم',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          _buildInfoRow(phone, 'الهاتف'),
                          _buildInfoRow(summary['totalAdditions'].toString(),
                              'كل الديون'),
                          _buildInfoRow(summary['totalPayments'].toString(),
                              'كل التسديدات'),
                          _buildInfoRow(
                              summary['outstanding'].toString(), ' المستحق لك'),
                        ]),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10.0),

                  // تحسين تنسيق أزرار التعديل والحذف بشكل عصري
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // زر الحذف
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          _deleteCustomer(id);
                        },
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white, // لون الخلفية
                            shape: BoxShape.circle, // شكل دائري
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 30.0,
                          ),
                        ),
                      ),
                      // زر التعديل
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          _updateCustomer(id, name, phone);
                        },
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white, // لون الخلفية
                            shape: BoxShape.circle, // شكل دائري
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.orangeAccent[400],
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  // زر الإغلاق
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.blue,
                  ),

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
        });
  }

  void _updateCustomer(int id, String name, String phone) async {
    _nameController.text = name;
    _phoneController.text = phone;

    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
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
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'تعديل بيانات عميل',
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
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: _nameController,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                            labelText: 'الاسم',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 6,
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                            labelText: 'رقم الهاتف',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.blue,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'إلغاء',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _dbHelper.updateCustomer(
                                id,
                                _nameController.text,
                                _phoneController.text,
                              );
                              _showSuccessMessage(
                                  'تم تعديل بيانات العميل بنجاح');
                              _loadCustomers();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _showAgentDetails(String name, String phone, int id) async {
    // تحميل البيانات أولًا
    final summaryAgeen = await _dbHelper.getSummaryAgeentByName(name);

    // التحقق من أن الـ BuildContext لا يزال صالحًا
    if (!mounted) return;

    // عرض الـ Dialog
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFFF6F6F6),
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
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'تفاصيل المورد',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(4.0),
                      1: FlexColumnWidth(6.0),
                    },
                    border: TableBorder.all(
                      color: Colors.orange,
                      width: 2.5,
                    ),
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'الاسم',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      _buildInfoRow(phone, 'الهاتف'),
                      _buildInfoRow(
                        summaryAgeen['totalAdditions'].toString(),
                        'كل القروضات',
                      ),
                      _buildInfoRow(
                        summaryAgeen['totalPayments'].toString(),
                        'كل التسديدات',
                      ),
                      _buildInfoRow(
                        summaryAgeen['outstanding'].toString(),
                        'المبلغ المستحق',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(height: 10.0),

                // تحسين تنسيق أزرار التعديل والحذف بشكل عصري
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // زر الحذف
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        _deleteAgent(id);
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white, // لون الخلفية
                          shape: BoxShape.circle, // شكل دائري
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                          size: 30.0,
                        ),
                      ),
                    ),
                    // زر التعديل
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        _updateAgent(id, name, phone);
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white, // لون الخلفية
                          shape: BoxShape.circle, // شكل دائري
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.orangeAccent[400],
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                // زر الإغلاق
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.orangeAccent,
                ),
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
      },
    );
  }

  void _deleteAgent(int id) async {
    await _dbHelper.deleteAgent(id);
    _showSuccessMessage('تم حذف الوكيل بنجاح');
    _loadAgents();
  }

  void _updateAgent(int id, String name, String phone) async {
    _nameController.text = name;
    _phoneController.text = phone;

    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
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
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'تعديل بيانات وكيل',
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
                    color: Colors.orange,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: _nameController,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                            labelText: 'الاسم',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 6,
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                            labelText: 'رقم الهاتف',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.orange,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'إلغاء',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _dbHelper.updateAgent(
                                id,
                                _nameController.text,
                                _phoneController.text,
                              );
                              _showSuccessMessage(
                                  'تم تعديل بيانات الوكيل بنجاح');
                              _loadAgents();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
