class TodoItemModel{
  
  final int id;
  final String category;
  final String title;
  final String? notes;
  final DateTime? dateTime;
  bool isCompleted;

  TodoItemModel({required this.title, required this.category, this.notes, this.dateTime, required this.isCompleted, required this.id,} );
}