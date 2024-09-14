class Expenses{
  int id;
  String title;
  double amount;
  DateTime date;
  String category; 

  Expenses({required this.id, required this.title, required this.category, required this.amount, required this.date});

  @override
  String toString() {
    return 'Expenses{id: $id, title: $title, category: $category, amount: $amount, date: $date}';
  }
}