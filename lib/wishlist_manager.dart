import 'dart:collection';

class WishlistManager {
  static final WishlistManager _instance = WishlistManager._internal();
  factory WishlistManager() => _instance;
  WishlistManager._internal();

  final List<Map<String, dynamic>> _wishlistTutors = [];

  UnmodifiableListView<Map<String, dynamic>> get wishlistTutors => UnmodifiableListView(_wishlistTutors);

  void addTutor(Map<String, dynamic> tutor) {
    // Avoid duplicates by name and subject
    if (!_wishlistTutors.any((t) => t['name'] == tutor['name'] && t['subject'] == tutor['subject'])) {
      _wishlistTutors.add(Map<String, dynamic>.from(tutor));
    }
  }

  void removeTutor(Map<String, dynamic> tutor) {
    _wishlistTutors.removeWhere((t) => t['name'] == tutor['name'] && t['subject'] == tutor['subject']);
  }

  void clear() {
    _wishlistTutors.clear();
  }
} 