import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mexpense/core/modelclass/modelclass.dart';

class MoneysecationController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var salaryList = <Modelclass>[].obs;
  var expenseList = <Modelclass>[].obs;

  StreamSubscription<QuerySnapshot>? _transactionsSubscription;

  var totalSalary = 0.0.obs;
  var totalExpense = 0.0.obs;

  double get currentBalance => totalSalary.value - totalExpense.value;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        fetchTransactions();
      } else {
        salaryList.clear();
        expenseList.clear();
        totalSalary.value = 0;
        totalExpense.value = 0;
      }
    });
  }

  void fetchTransactions() {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return;

    _transactionsSubscription?.cancel();
    _transactionsSubscription = _firestore
        .collection('users')
        .doc(uid)
        .collection('transactions')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {

      salaryList.clear();
      expenseList.clear();
      double tempSalary = 0;
      double tempExpense = 0;

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();

        Modelclass transaction = Modelclass(
          id: doc.id,
          itemName: data['name'] ?? '',
          amount: (data['amount'] ?? 0).toDouble(),
          date: data['date'] ?? '',
          isExpense: data['isExpense'] ?? false,
        );

        if (transaction.isExpense) {
          expenseList.add(transaction);
          tempExpense += transaction.amount;
        } else {
          salaryList.add(transaction);
          tempSalary += transaction.amount;
        }
      }

      totalSalary.value = tempSalary;
      totalExpense.value = tempExpense;
    });
  }

  //==================== Add Salary =============================================
  Future<void> addSalary(String name, double amount) async {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return;

    String autoDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    try {
      await _firestore.collection('users').doc(uid).collection('transactions').add({
        'name': name,
        'amount': amount,
        'date': autoDate,
        'isExpense': false,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      Get.snackbar("Error", "Salary could not be added: $e");
    }
  }

  //==================== Add Expense=================================================
  Future<void> addExpense(String name, double amount) async {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return;

    String autoDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    try {
      await _firestore.collection('users').doc(uid).collection('transactions').add({
        'name': name,
        'amount': amount,
        'date': autoDate,
        'isExpense': true,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      Get.snackbar("Error", "Expense could not be added: $e");
    }
  }

  //==================== Delete Function ====================
  Future<void> deleteTransaction(String docId) async {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .doc(docId)
          .delete();

      Get.rawSnackbar(
        title: "Deleted",
        message: "Transaction successfully removed",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(15),
        borderRadius: 10,
      );
    } catch (e) {
      Get.snackbar("Error", "Deletion failed: $e",
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //========================================== Confirmation Dialog ==========================================
  void confirmDelete(String? docId, String itemType) {
    if (docId == null) return;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 50, color: Colors.redAccent),
              const SizedBox(height: 15),
              Text(
                "Delete $itemType?",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Are you sure you want to remove this $itemType record?",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => Get.back(),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        deleteTransaction(docId);
                        Get.back();
                      },
                      child: const Text("Delete", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    _transactionsSubscription?.cancel();
    super.onClose();
  }
}