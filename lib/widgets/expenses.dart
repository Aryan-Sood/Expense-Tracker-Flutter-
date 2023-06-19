import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 499,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Keyboard',
        amount: 2199,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseoverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const newExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseoverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}
