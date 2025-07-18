import 'package:hive_flutter/hive_flutter.dart';

class LocalHiveDBService {
  LocalHiveDBService._internal();

  static final LocalHiveDBService _singleton = LocalHiveDBService._internal();

  factory LocalHiveDBService() {
    return _singleton;
  }

  static const String _defaultBoxName = 'appData';
  Box? _box;
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) {
      print('Hive already initialized');
      return;
    }

    try {
      print('Initializing Hive...');
      await Hive.initFlutter();
      _box = await Hive.openBox(_defaultBoxName);
      _isInitialized = true;
      print('Hive initialized successfully');
    } catch (e) {
      print('Error initializing Hive: $e');
      _isInitialized = false;
      rethrow;
    }
  }

  bool get isInitialized => _isInitialized;

  void printStatus() {
    print('Hive Status:');
    print('- Is Initialized: $_isInitialized');
    print('- Default Box Open: ${Hive.isBoxOpen(_defaultBoxName)}');
    print('- Box Reference: ${_box != null ? 'Valid' : 'Null'}');
    if (_box != null) {
      print('- Box Is Open: ${_box!.isOpen}');
    }
  }

  Future<Box> _getBox([String? boxName]) async {
    if (!_isInitialized) {
      try {
        if (Hive.isBoxOpen(_defaultBoxName)) {
          _box = Hive.box(_defaultBoxName);
          _isInitialized = true;
        } else {
          await init();
        }
      } catch (e) {
        await init();
      }
    }

    if (boxName != null) {
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box(boxName);
      }
      return await Hive.openBox(boxName);
    }

    if (_box != null && _box!.isOpen) {
      return _box!;
    }

    if (Hive.isBoxOpen(_defaultBoxName)) {
      _box = Hive.box(_defaultBoxName);
    } else {
      _box = await Hive.openBox(_defaultBoxName);
    }

    return _box!;
  }

  Future<void> put(String key, dynamic value, [String? boxName]) async {
    try {
      final box = await _getBox(boxName);
      await box.put(key, value);
      await box.flush();  
      print('Data stored: $key = $value');
    } catch (e) {
      print('Error storing data: $e');
      rethrow;
    }
  }

  Future<T?> get<T>(String key, [String? boxName]) async {
    try {
      final box = await _getBox(boxName);
      final value = box.get(key) as T?;
      print('Data retrieved: $key = $value');
      return value;
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
  }

  Future<void> delete(String key, [String? boxName]) async {
    try {
      final box = await _getBox(boxName);
      await box.delete(key);
      await box.flush(); 
      print('Data deleted: $key');
    } catch (e) {
      print('Error deleting data: $e');
      rethrow;
    }
  }

  Future<void> clear([String? boxName]) async {
    try {
      final box = await _getBox(boxName);
      await box.clear();
      await box.flush(); 
      print('Box cleared: ${boxName ?? _defaultBoxName}');
    } catch (e) {
      print('Error clearing box: $e');
      rethrow;
    }
  }

  Future<void> closeAll() async {
    try {
      await Hive.close();
      _box = null;
      _isInitialized = false;
      print('All Hive boxes closed');
    } catch (e) {
      print('Error closing Hive boxes: $e');
    }
  }
}
