import 'package:prelim_proj/models/budget.dart';
import 'package:riverpod/riverpod.dart';

class BudgetServices {
  final Ref container;
  final List<Budget> _budgets = [];
  int _currentId = 0;  // Starts with 0

  BudgetServices(this.container);

  void addBudget(String name, double amount, DateTime date) {
    bool budgetExists = _budgets.any((budget) => budget.name == name);

    if (budgetExists) {
      print('Budget already exists: $name');
      return;
    }

    // Assign the current id and increment for the next budget
    _budgets.add(Budget(id: _currentId++, name: name, amount: amount, date: date));
    print('Budget added: id: $_currentId, name: $name, amount: $amount, date: $date');
  }

void removeBudget(int id) {
  bool budgetExists = _budgets.any((budget) => budget.id == id);

  if (!budgetExists) {
    print('Budget does not exist: $id');
    return;
  }

  _budgets.removeWhere((element) => element.id == id);
  print('Budget removed: $id');
}

  void updateBudget(String name, double amount, DateTime date) {
    bool budgetExists = _budgets.any((budget) => budget.name == name);

    if (!budgetExists) {
      print('Budget does not exist: $name');
      return;
    }

    for (var element in _budgets) {
      if (element.name == name) {
        element.amount = amount;
        element.date = date;
        print('Budget updated: $name, $amount, $date');
        break;
      }
    }
  }

  void viewBudgets() {
    bool budgetExists = _budgets.isNotEmpty;

    if (!budgetExists) {
      print('No budgets available');
      return;
    }
    _budgets.forEach((element) {
      print(element);
    });
  }
  double getTotalBudget() {
    double totalAmount = _budgets.fold(0, (sum, expenses) => sum + expenses.amount);
    print('Total Expenses: $totalAmount');
    return totalAmount;
  }
}