class Budget {
  int id;
  String name;
  double amount;
  DateTime date;

  Budget({required this.id, required this.name, required this.amount, required this.date});

  @override
  String toString() {
    return 'Budget{id: $id, name: $name, amount: $amount, date: $date}';
  }
}