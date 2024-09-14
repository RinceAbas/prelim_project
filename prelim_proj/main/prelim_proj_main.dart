import 'dart:io';
import 'package:prelim_proj/global_providers.dart';
import 'package:prelim_proj/services/expenses_services.dart';
import 'package:prelim_proj/services/budget_services.dart';
import 'package:riverpod/riverpod.dart';

void main(){
  final container = ProviderContainer();
  final expensesServices = container.read(expensesServiceProvider);
  final budgetServices = container.read(budgetServiceProvider);

    bool isRunning = true;

  while (isRunning){
    print('\Financial Tracker Application');
    print('a. Add a Budget');
    print('b. Delete a Budget');
    print('c. Update a Budget');
    print('d. View Budget');
    print('e. Add a Expense');
    print('f. Delete a Expense');
    print('g. Update a Expense');
    print('h. View Expenses');
    print('i. View Summary');
    print('j. Exit');
    print('Enter Your Choice: ');

    String? choice = stdin.readLineSync();

    if (choice != null){
      print('You entered: $choice');
    }
    else{
      print('You entered: null');
    }
    switch(choice){
      case 'A':
      case 'a':
        addBudget(budgetServices);
        break;

      case 'B':
      case 'b':
        viewBudget(budgetServices);
        deleteBudget(budgetServices); 
        viewBudget(budgetServices);
        break;

      case 'C':
      case 'c':
        updateBudget(budgetServices);
        break;

      case 'D':
      case 'd':
        viewBudget(budgetServices);
        break;

      case 'E':
      case 'e':
        addExpense(expensesServices);
        break;

      case 'F':
      case 'f':
        viewExpenses(expensesServices);
        deleteExpense(expensesServices);
        viewExpenses(expensesServices);
        break;

      case 'G': 
      case 'g':
        updateExpense(expensesServices);
        break;

      case 'H':
      case 'h':
        viewExpenses(expensesServices);
        break; 
      
      case 'I':
      case 'i':
        viewSummary(expensesServices, budgetServices);
        break;

      case 'J':
      case 'j':
        isRunning = false;
        print('Thank You!');
      default:
        print('Invalid choice. Please try again');
    }
  }
}

void addExpense(ExpensesServices expensesServices) {
  print('Enter Expense Title:');
  String title = stdin.readLineSync()!;
  print('Enter Expense Category:');
  String category = stdin.readLineSync()!;
  print('Enter Expense Amount:');
  double amount = double.parse(stdin.readLineSync()!);
  DateTime date = DateTime.now();

  expensesServices.addExpenses(title, category, amount, date);
  print('Expense added successfully.');
}

void deleteExpense(ExpensesServices expensesServices) {
  print('Enter Expense ID:');
   int id = int.parse(stdin.readLineSync()!);

  expensesServices.removeExpenses(id);
  print('Expense deleted successfully.');
}

void updateExpense(ExpensesServices expensesServices) {
  print('Enter Expense ID:');
  int id = int.parse(stdin.readLineSync()!);
  print('Enter Expense Title:');
  String title = stdin.readLineSync()!;
  print('Enter Expense Category:');
  String category = stdin.readLineSync()!;
  print('Enter Expense Amount:');
  double amount = double.parse(stdin.readLineSync()!);
  DateTime date = DateTime.now();

  expensesServices.updateExpenses(id, title, category, amount, date);
  print('Expense updated successfully.');
}

void viewExpenses(ExpensesServices expensesServices) {
  expensesServices.viewExpenses();
  expensesServices.getTotalExpenses();
}

void addBudget(BudgetServices budgetServices) {
  print('Enter Budget Name:');
  String name = stdin.readLineSync()!;
  print('Enter Budget Amount:');
  double amount = double.parse(stdin.readLineSync()!);
  DateTime date = DateTime.now();

  budgetServices.addBudget(name, amount, date);
  print('Budget added successfully.');
}

void deleteBudget(BudgetServices budgetServices) {
  print('Enter Budget ID:');
  int id = int.parse(stdin.readLineSync()!);

  budgetServices.removeBudget(id);
  print('Budget deleted successfully.');
}

void updateBudget(BudgetServices budgetServices) {
  print('Enter Budget Name:');
  String name = stdin.readLineSync()!;
  print('Enter Budget Amount:');
  double amount = double.parse(stdin.readLineSync()!);
  DateTime date = DateTime.now();

  budgetServices.updateBudget(name, amount, date);
  print('Budget updated successfully.');
}

void viewBudget(BudgetServices budgetServices) {
  budgetServices.viewBudgets();
  budgetServices.getTotalBudget();
}

void viewSummary(ExpensesServices expensesServices, BudgetServices budgetServices) {
  expensesServices.viewExpenses();
  budgetServices.viewBudgets();

  double totalBudget = budgetServices.getTotalBudget();
  double totalExpenses = expensesServices.getTotalExpenses();
  double difference = totalBudget - totalExpenses;

  if (difference >= 0) {
    print('You are financially on track.');
  } else {
    print('You overspent by \$${difference.toStringAsFixed(2)}.');
  }
}