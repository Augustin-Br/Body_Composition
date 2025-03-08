import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _imcDouble = await secureStorage.getDouble('ff_imcDouble') ?? _imcDouble;
    });
    await _safeInitAsync(() async {
      _IsIMCBoolean =
          await secureStorage.getBool('ff_IsIMCBoolean') ?? _IsIMCBoolean;
    });
    await _safeInitAsync(() async {
      _BodyFatString =
          await secureStorage.getString('ff_BodyFatString') ?? _BodyFatString;
    });
    await _safeInitAsync(() async {
      _IsBodyFatBoolean = await secureStorage.getBool('ff_IsBodyFatBoolean') ??
          _IsBodyFatBoolean;
    });
    await _safeInitAsync(() async {
      _CaloriePerDayString =
          await secureStorage.getString('ff_CaloriePerDayString') ??
              _CaloriePerDayString;
    });
    await _safeInitAsync(() async {
      _IsCalorieBoolean = await secureStorage.getBool('ff_IsCalorieBoolean') ??
          _IsCalorieBoolean;
    });
    await _safeInitAsync(() async {
      _ListWeight = (await secureStorage.getStringList('ff_ListWeight'))
              ?.map(double.parse)
              .toList() ??
          _ListWeight;
    });
    await _safeInitAsync(() async {
      _ListBodyFat = (await secureStorage.getStringList('ff_ListBodyFat'))
              ?.map(double.parse)
              .toList() ??
          _ListBodyFat;
    });
    await _safeInitAsync(() async {
      _ListeDate = (await secureStorage.getStringList('ff_ListeDate'))
              ?.map(int.parse)
              .toList() ??
          _ListeDate;
    });
    await _safeInitAsync(() async {
      _DateString =
          await secureStorage.getStringList('ff_DateString') ?? _DateString;
    });
    await _safeInitAsync(() async {
      _isImperial = await secureStorage.getBool('ff_isImperial') ?? _isImperial;
    });
    await _safeInitAsync(() async {
      _count = (await secureStorage.getStringList('ff_count'))
              ?.map(int.parse)
              .toList() ??
          _count;
    });
    await _safeInitAsync(() async {
      _lastUpdate = await secureStorage.read(key: 'ff_lastUpdate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_lastUpdate'))!)
          : _lastUpdate;
    });
    await _safeInitAsync(() async {
      _DayFromInstall = (await secureStorage.getStringList('ff_DayFromInstall'))
              ?.map(int.parse)
              .toList() ??
          _DayFromInstall;
    });
    await _safeInitAsync(() async {
      _Hip = await secureStorage.getDouble('ff_Hip') ?? _Hip;
    });
    await _safeInitAsync(() async {
      _Waist = await secureStorage.getDouble('ff_Waist') ?? _Waist;
    });
    await _safeInitAsync(() async {
      _Chest = await secureStorage.getDouble('ff_Chest') ?? _Chest;
    });
    await _safeInitAsync(() async {
      _Neck = await secureStorage.getDouble('ff_Neck') ?? _Neck;
    });
    await _safeInitAsync(() async {
      _Genre = await secureStorage.getString('ff_Genre') ?? _Genre;
    });
    await _safeInitAsync(() async {
      _BodyFatUSNavy =
          await secureStorage.getDouble('ff_BodyFatUSNavy') ?? _BodyFatUSNavy;
    });
    await _safeInitAsync(() async {
      _isBodyFatNavyValue =
          await secureStorage.getBool('ff_isBodyFatNavyValue') ??
              _isBodyFatNavyValue;
    });
    await _safeInitAsync(() async {
      _FatMass = await secureStorage.getDouble('ff_FatMass') ?? _FatMass;
    });
    await _safeInitAsync(() async {
      _LeanMass = await secureStorage.getDouble('ff_LeanMass') ?? _LeanMass;
    });
    await _safeInitAsync(() async {
      _Age = await secureStorage.getInt('ff_Age') ?? _Age;
    });
    await _safeInitAsync(() async {
      _firstLunch = await secureStorage.getBool('ff_firstLunch') ?? _firstLunch;
    });
    await _safeInitAsync(() async {
      _AccpetPolicy =
          await secureStorage.getBool('ff_AccpetPolicy') ?? _AccpetPolicy;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _imcDouble = 0.0;
  double get imcDouble => _imcDouble;
  set imcDouble(double value) {
    _imcDouble = value;
    secureStorage.setDouble('ff_imcDouble', value);
  }

  void deleteImcDouble() {
    secureStorage.delete(key: 'ff_imcDouble');
  }

  bool _IsIMCBoolean = false;
  bool get IsIMCBoolean => _IsIMCBoolean;
  set IsIMCBoolean(bool value) {
    _IsIMCBoolean = value;
    secureStorage.setBool('ff_IsIMCBoolean', value);
  }

  void deleteIsIMCBoolean() {
    secureStorage.delete(key: 'ff_IsIMCBoolean');
  }

  String _BodyFatString = '';
  String get BodyFatString => _BodyFatString;
  set BodyFatString(String value) {
    _BodyFatString = value;
    secureStorage.setString('ff_BodyFatString', value);
  }

  void deleteBodyFatString() {
    secureStorage.delete(key: 'ff_BodyFatString');
  }

  bool _IsBodyFatBoolean = false;
  bool get IsBodyFatBoolean => _IsBodyFatBoolean;
  set IsBodyFatBoolean(bool value) {
    _IsBodyFatBoolean = value;
    secureStorage.setBool('ff_IsBodyFatBoolean', value);
  }

  void deleteIsBodyFatBoolean() {
    secureStorage.delete(key: 'ff_IsBodyFatBoolean');
  }

  String _CaloriePerDayString = '';
  String get CaloriePerDayString => _CaloriePerDayString;
  set CaloriePerDayString(String value) {
    _CaloriePerDayString = value;
    secureStorage.setString('ff_CaloriePerDayString', value);
  }

  void deleteCaloriePerDayString() {
    secureStorage.delete(key: 'ff_CaloriePerDayString');
  }

  bool _IsCalorieBoolean = false;
  bool get IsCalorieBoolean => _IsCalorieBoolean;
  set IsCalorieBoolean(bool value) {
    _IsCalorieBoolean = value;
    secureStorage.setBool('ff_IsCalorieBoolean', value);
  }

  void deleteIsCalorieBoolean() {
    secureStorage.delete(key: 'ff_IsCalorieBoolean');
  }

  List<double> _ListWeight = [];
  List<double> get ListWeight => _ListWeight;
  set ListWeight(List<double> value) {
    _ListWeight = value;
    secureStorage.setStringList(
        'ff_ListWeight', value.map((x) => x.toString()).toList());
  }

  void deleteListWeight() {
    secureStorage.delete(key: 'ff_ListWeight');
  }

  void addToListWeight(double value) {
    ListWeight.add(value);
    secureStorage.setStringList(
        'ff_ListWeight', _ListWeight.map((x) => x.toString()).toList());
  }

  void removeFromListWeight(double value) {
    ListWeight.remove(value);
    secureStorage.setStringList(
        'ff_ListWeight', _ListWeight.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListWeight(int index) {
    ListWeight.removeAt(index);
    secureStorage.setStringList(
        'ff_ListWeight', _ListWeight.map((x) => x.toString()).toList());
  }

  void updateListWeightAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    ListWeight[index] = updateFn(_ListWeight[index]);
    secureStorage.setStringList(
        'ff_ListWeight', _ListWeight.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListWeight(int index, double value) {
    ListWeight.insert(index, value);
    secureStorage.setStringList(
        'ff_ListWeight', _ListWeight.map((x) => x.toString()).toList());
  }

  List<double> _ListBodyFat = [12.0, 12.3, 12.5, 11.7, 18.4];
  List<double> get ListBodyFat => _ListBodyFat;
  set ListBodyFat(List<double> value) {
    _ListBodyFat = value;
    secureStorage.setStringList(
        'ff_ListBodyFat', value.map((x) => x.toString()).toList());
  }

  void deleteListBodyFat() {
    secureStorage.delete(key: 'ff_ListBodyFat');
  }

  void addToListBodyFat(double value) {
    ListBodyFat.add(value);
    secureStorage.setStringList(
        'ff_ListBodyFat', _ListBodyFat.map((x) => x.toString()).toList());
  }

  void removeFromListBodyFat(double value) {
    ListBodyFat.remove(value);
    secureStorage.setStringList(
        'ff_ListBodyFat', _ListBodyFat.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListBodyFat(int index) {
    ListBodyFat.removeAt(index);
    secureStorage.setStringList(
        'ff_ListBodyFat', _ListBodyFat.map((x) => x.toString()).toList());
  }

  void updateListBodyFatAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    ListBodyFat[index] = updateFn(_ListBodyFat[index]);
    secureStorage.setStringList(
        'ff_ListBodyFat', _ListBodyFat.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListBodyFat(int index, double value) {
    ListBodyFat.insert(index, value);
    secureStorage.setStringList(
        'ff_ListBodyFat', _ListBodyFat.map((x) => x.toString()).toList());
  }

  List<int> _ListeDate = [4, 5];
  List<int> get ListeDate => _ListeDate;
  set ListeDate(List<int> value) {
    _ListeDate = value;
    secureStorage.setStringList(
        'ff_ListeDate', value.map((x) => x.toString()).toList());
  }

  void deleteListeDate() {
    secureStorage.delete(key: 'ff_ListeDate');
  }

  void addToListeDate(int value) {
    ListeDate.add(value);
    secureStorage.setStringList(
        'ff_ListeDate', _ListeDate.map((x) => x.toString()).toList());
  }

  void removeFromListeDate(int value) {
    ListeDate.remove(value);
    secureStorage.setStringList(
        'ff_ListeDate', _ListeDate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromListeDate(int index) {
    ListeDate.removeAt(index);
    secureStorage.setStringList(
        'ff_ListeDate', _ListeDate.map((x) => x.toString()).toList());
  }

  void updateListeDateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    ListeDate[index] = updateFn(_ListeDate[index]);
    secureStorage.setStringList(
        'ff_ListeDate', _ListeDate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInListeDate(int index, int value) {
    ListeDate.insert(index, value);
    secureStorage.setStringList(
        'ff_ListeDate', _ListeDate.map((x) => x.toString()).toList());
  }

  List<String> _DateString = [];
  List<String> get DateString => _DateString;
  set DateString(List<String> value) {
    _DateString = value;
    secureStorage.setStringList('ff_DateString', value);
  }

  void deleteDateString() {
    secureStorage.delete(key: 'ff_DateString');
  }

  void addToDateString(String value) {
    DateString.add(value);
    secureStorage.setStringList('ff_DateString', _DateString);
  }

  void removeFromDateString(String value) {
    DateString.remove(value);
    secureStorage.setStringList('ff_DateString', _DateString);
  }

  void removeAtIndexFromDateString(int index) {
    DateString.removeAt(index);
    secureStorage.setStringList('ff_DateString', _DateString);
  }

  void updateDateStringAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DateString[index] = updateFn(_DateString[index]);
    secureStorage.setStringList('ff_DateString', _DateString);
  }

  void insertAtIndexInDateString(int index, String value) {
    DateString.insert(index, value);
    secureStorage.setStringList('ff_DateString', _DateString);
  }

  bool _isImperial = false;
  bool get isImperial => _isImperial;
  set isImperial(bool value) {
    _isImperial = value;
    secureStorage.setBool('ff_isImperial', value);
  }

  void deleteIsImperial() {
    secureStorage.delete(key: 'ff_isImperial');
  }

  List<int> _count = [];
  List<int> get count => _count;
  set count(List<int> value) {
    _count = value;
    secureStorage.setStringList(
        'ff_count', value.map((x) => x.toString()).toList());
  }

  void deleteCount() {
    secureStorage.delete(key: 'ff_count');
  }

  void addToCount(int value) {
    count.add(value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void removeFromCount(int value) {
    count.remove(value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCount(int index) {
    count.removeAt(index);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void updateCountAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    count[index] = updateFn(_count[index]);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCount(int index, int value) {
    count.insert(index, value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  DateTime? _lastUpdate;
  DateTime? get lastUpdate => _lastUpdate;
  set lastUpdate(DateTime? value) {
    _lastUpdate = value;
    value != null
        ? secureStorage.setInt('ff_lastUpdate', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastUpdate');
  }

  void deleteLastUpdate() {
    secureStorage.delete(key: 'ff_lastUpdate');
  }

  List<int> _DayFromInstall = [];
  List<int> get DayFromInstall => _DayFromInstall;
  set DayFromInstall(List<int> value) {
    _DayFromInstall = value;
    secureStorage.setStringList(
        'ff_DayFromInstall', value.map((x) => x.toString()).toList());
  }

  void deleteDayFromInstall() {
    secureStorage.delete(key: 'ff_DayFromInstall');
  }

  void addToDayFromInstall(int value) {
    DayFromInstall.add(value);
    secureStorage.setStringList(
        'ff_DayFromInstall', _DayFromInstall.map((x) => x.toString()).toList());
  }

  void removeFromDayFromInstall(int value) {
    DayFromInstall.remove(value);
    secureStorage.setStringList(
        'ff_DayFromInstall', _DayFromInstall.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromDayFromInstall(int index) {
    DayFromInstall.removeAt(index);
    secureStorage.setStringList(
        'ff_DayFromInstall', _DayFromInstall.map((x) => x.toString()).toList());
  }

  void updateDayFromInstallAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    DayFromInstall[index] = updateFn(_DayFromInstall[index]);
    secureStorage.setStringList(
        'ff_DayFromInstall', _DayFromInstall.map((x) => x.toString()).toList());
  }

  void insertAtIndexInDayFromInstall(int index, int value) {
    DayFromInstall.insert(index, value);
    secureStorage.setStringList(
        'ff_DayFromInstall', _DayFromInstall.map((x) => x.toString()).toList());
  }

  double _Hip = 0.0;
  double get Hip => _Hip;
  set Hip(double value) {
    _Hip = value;
    secureStorage.setDouble('ff_Hip', value);
  }

  void deleteHip() {
    secureStorage.delete(key: 'ff_Hip');
  }

  double _Waist = 0.0;
  double get Waist => _Waist;
  set Waist(double value) {
    _Waist = value;
    secureStorage.setDouble('ff_Waist', value);
  }

  void deleteWaist() {
    secureStorage.delete(key: 'ff_Waist');
  }

  double _Chest = 0.0;
  double get Chest => _Chest;
  set Chest(double value) {
    _Chest = value;
    secureStorage.setDouble('ff_Chest', value);
  }

  void deleteChest() {
    secureStorage.delete(key: 'ff_Chest');
  }

  double _Neck = 0.0;
  double get Neck => _Neck;
  set Neck(double value) {
    _Neck = value;
    secureStorage.setDouble('ff_Neck', value);
  }

  void deleteNeck() {
    secureStorage.delete(key: 'ff_Neck');
  }

  String _Genre = '';
  String get Genre => _Genre;
  set Genre(String value) {
    _Genre = value;
    secureStorage.setString('ff_Genre', value);
  }

  void deleteGenre() {
    secureStorage.delete(key: 'ff_Genre');
  }

  double _BodyFatUSNavy = 0.0;
  double get BodyFatUSNavy => _BodyFatUSNavy;
  set BodyFatUSNavy(double value) {
    _BodyFatUSNavy = value;
    secureStorage.setDouble('ff_BodyFatUSNavy', value);
  }

  void deleteBodyFatUSNavy() {
    secureStorage.delete(key: 'ff_BodyFatUSNavy');
  }

  bool _isBodyFatNavyValue = false;
  bool get isBodyFatNavyValue => _isBodyFatNavyValue;
  set isBodyFatNavyValue(bool value) {
    _isBodyFatNavyValue = value;
    secureStorage.setBool('ff_isBodyFatNavyValue', value);
  }

  void deleteIsBodyFatNavyValue() {
    secureStorage.delete(key: 'ff_isBodyFatNavyValue');
  }

  double _FatMass = 0.0;
  double get FatMass => _FatMass;
  set FatMass(double value) {
    _FatMass = value;
    secureStorage.setDouble('ff_FatMass', value);
  }

  void deleteFatMass() {
    secureStorage.delete(key: 'ff_FatMass');
  }

  double _LeanMass = 0.0;
  double get LeanMass => _LeanMass;
  set LeanMass(double value) {
    _LeanMass = value;
    secureStorage.setDouble('ff_LeanMass', value);
  }

  void deleteLeanMass() {
    secureStorage.delete(key: 'ff_LeanMass');
  }

  int _Age = 0;
  int get Age => _Age;
  set Age(int value) {
    _Age = value;
    secureStorage.setInt('ff_Age', value);
  }

  void deleteAge() {
    secureStorage.delete(key: 'ff_Age');
  }

  bool _firstLunch = true;
  bool get firstLunch => _firstLunch;
  set firstLunch(bool value) {
    _firstLunch = value;
    secureStorage.setBool('ff_firstLunch', value);
  }

  void deleteFirstLunch() {
    secureStorage.delete(key: 'ff_firstLunch');
  }

  bool _AccpetPolicy = false;
  bool get AccpetPolicy => _AccpetPolicy;
  set AccpetPolicy(bool value) {
    _AccpetPolicy = value;
    secureStorage.setBool('ff_AccpetPolicy', value);
  }

  void deleteAccpetPolicy() {
    secureStorage.delete(key: 'ff_AccpetPolicy');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
