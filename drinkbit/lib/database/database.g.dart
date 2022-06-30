// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CaloriesDao? _CaloriesInstance;

  DrinkDao? _drinkDaoInstance;

  StepsDao? _StepsInstance;

  DistanceDao? _DistanceInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Calories` (`day` INTEGER NOT NULL, `calories` REAL NOT NULL, PRIMARY KEY (`day`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Drink` (`ingredients` TEXT NOT NULL, `cal` REAL NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`ingredients`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Distance` (`day` INTEGER NOT NULL, `distance` REAL NOT NULL, PRIMARY KEY (`day`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Steps` (`day` INTEGER NOT NULL, `steps` REAL NOT NULL, PRIMARY KEY (`day`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CaloriesDao get Calories {
    return _CaloriesInstance ??= _$CaloriesDao(database, changeListener);
  }

  @override
  DrinkDao get drinkDao {
    return _drinkDaoInstance ??= _$DrinkDao(database, changeListener);
  }

  @override
  StepsDao get Steps {
    return _StepsInstance ??= _$StepsDao(database, changeListener);
  }

  @override
  DistanceDao get Distance {
    return _DistanceInstance ??= _$DistanceDao(database, changeListener);
  }
}

class _$CaloriesDao extends CaloriesDao {
  _$CaloriesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _caloriesInsertionAdapter = InsertionAdapter(
            database,
            'Calories',
            (Calories item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'calories': item.calories
                }),
        _caloriesDeletionAdapter = DeletionAdapter(
            database,
            'Calories',
            ['day'],
            (Calories item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'calories': item.calories
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Calories> _caloriesInsertionAdapter;

  final DeletionAdapter<Calories> _caloriesDeletionAdapter;

  @override
  Future<List<Calories>> findAllCaloriess() async {
    return _queryAdapter.queryList('SELECT * FROM Calories',
        mapper: (Map<String, Object?> row) => Calories(
            _dateTimeConverter.decode(row['day'] as int),
            row['calories'] as double));
  }

  @override
  Future<void> insertCalories(Calories calories) async {
    await _caloriesInsertionAdapter.insert(calories, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteCalories(Calories calories) async {
    await _caloriesDeletionAdapter.delete(calories);
  }
}

class _$DrinkDao extends DrinkDao {
  _$DrinkDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _drinkInsertionAdapter = InsertionAdapter(
            database,
            'Drink',
            (Drink item) => <String, Object?>{
                  'ingredients': item.ingredients,
                  'cal': item.cal,
                  'name': item.name
                }),
        _drinkUpdateAdapter = UpdateAdapter(
            database,
            'Drink',
            ['ingredients'],
            (Drink item) => <String, Object?>{
                  'ingredients': item.ingredients,
                  'cal': item.cal,
                  'name': item.name
                }),
        _drinkDeletionAdapter = DeletionAdapter(
            database,
            'Drink',
            ['ingredients'],
            (Drink item) => <String, Object?>{
                  'ingredients': item.ingredients,
                  'cal': item.cal,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Drink> _drinkInsertionAdapter;

  final UpdateAdapter<Drink> _drinkUpdateAdapter;

  final DeletionAdapter<Drink> _drinkDeletionAdapter;

  @override
  Future<List<Drink>> findAllDrinks() async {
    return _queryAdapter.queryList('SELECT * FROM Drink',
        mapper: (Map<String, Object?> row) => Drink(row['name'] as String,
            row['cal'] as double, row['ingredients'] as String));
  }

  @override
  Future<void> insertDrink(Drink drink) async {
    await _drinkInsertionAdapter.insert(drink, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDrink(Drink drink) async {
    await _drinkUpdateAdapter.update(drink, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteDrink(Drink task) async {
    await _drinkDeletionAdapter.delete(task);
  }
}

class _$StepsDao extends StepsDao {
  _$StepsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _stepsInsertionAdapter = InsertionAdapter(
            database,
            'Steps',
            (Steps item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'steps': item.steps
                }),
        _stepsDeletionAdapter = DeletionAdapter(
            database,
            'Steps',
            ['day'],
            (Steps item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'steps': item.steps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Steps> _stepsInsertionAdapter;

  final DeletionAdapter<Steps> _stepsDeletionAdapter;

  @override
  Future<List<Steps>> findAllStepss() async {
    return _queryAdapter.queryList('SELECT * FROM Steps',
        mapper: (Map<String, Object?> row) => Steps(
            _dateTimeConverter.decode(row['day'] as int),
            row['steps'] as double));
  }

  @override
  Future<void> insertSteps(Steps steps) async {
    await _stepsInsertionAdapter.insert(steps, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteSteps(Steps steps) async {
    await _stepsDeletionAdapter.delete(steps);
  }
}

class _$DistanceDao extends DistanceDao {
  _$DistanceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _distanceInsertionAdapter = InsertionAdapter(
            database,
            'Distance',
            (Distance item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'distance': item.distance
                }),
        _distanceDeletionAdapter = DeletionAdapter(
            database,
            'Distance',
            ['day'],
            (Distance item) => <String, Object?>{
                  'day': _dateTimeConverter.encode(item.day),
                  'distance': item.distance
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Distance> _distanceInsertionAdapter;

  final DeletionAdapter<Distance> _distanceDeletionAdapter;

  @override
  Future<List<Distance>> findAllDistances() async {
    return _queryAdapter.queryList('SELECT * FROM Distance',
        mapper: (Map<String, Object?> row) => Distance(
            _dateTimeConverter.decode(row['day'] as int),
            row['distance'] as double));
  }

  @override
  Future<void> insertDistance(Distance distance) async {
    await _distanceInsertionAdapter.insert(distance, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteDistance(Distance distance) async {
    await _distanceDeletionAdapter.delete(distance);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
