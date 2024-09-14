import 'package:riverpod/riverpod.dart';
import 'package:prelim_proj/services/budget_services.dart';
import 'package:prelim_proj/services/expenses_services.dart';

final budgetServiceProvider = Provider((ref) => BudgetServices(ref));
final expensesServiceProvider = Provider((ref) => ExpensesServices(ref));