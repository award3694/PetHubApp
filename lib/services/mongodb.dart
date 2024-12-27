import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pet_hub/utils/constants.dart';

class MongoDatabase {
  static connection() async {
    var db = await Db.create(mongoUrl);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(collectionName);
    print(await collection.find().toList());
  }
}
