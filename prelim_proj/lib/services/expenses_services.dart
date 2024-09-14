import 'package:prelim_proj/models/expenses.dart';
import 'package:riverpod/riverpod.dart';

class ExpensesServices {
  final Ref container;
  final List<Expenses> _expenses = [];
  int _currentId = 0;

  ExpensesServices(this.container);

  void addExpenses(String title, String category, double amount, DateTime date) {
    _currentId++;
    _expenses.add(Expenses(id: _currentId, title: title, category: category, amount: amount, date: date));
    print('Expenses added: $_currentId, $title, $amount, $date');
  }

  void removeExpenses(int id) {
    bool expensesExists = _expenses.any((expenses) => expenses.id == id);

    if (!expensesExists) {
      print('Expenses does not exist: $id');
      return;
    }
    _expenses.removeWhere((element) => element.id == id);
    print('Expenses removed: $id');
  }

  void updateExpenses(int id, String title, String category, double amount, DateTime date) {
    bool expensesExists = _expenses.any((expenses) => expenses.id == id);

    if (!expensesExists) {
      print('Expenses does not exist: $id');
      return;
    }
    _expenses.forEach((element) {
      if (element.id == id) {
        element.title = title;
        element.category = category;
        element.amount = amount;
        element.date = date;
      }
    });
    print('Expenses updated: $id, $title,  $amount, $date');
  }

  void viewExpenses() {
    bool expensesExists = _expenses.isNotEmpty;

    if (!expensesExists) {
      print('No expenses available');
      return;
    }
    _expenses.forEach((element) {
      print(element);
    });
  }
  double getTotalExpenses() {
    double totalAmount = _expenses.fold(0, (sum, budget) => sum + budget.amount);
    print('Total Budgets: $totalAmount');
    return totalAmount;
  }
}
