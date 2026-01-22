import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract interface class PortfolioRemoteDataSource {
  Future<int> getCoffeeCount();
  Future<void> incrementCoffeeCount();
  Future<void> changeName(String name);
}

@LazySingleton(as: PortfolioRemoteDataSource)
class PortfolioRemoteDataSourceFirebaseImpl
    implements PortfolioRemoteDataSource {
  final FirebaseFirestore _firestore;

  PortfolioRemoteDataSourceFirebaseImpl(this._firestore);

  @override
  Future<int> getCoffeeCount() async {
    final collection = _firestore.collection('stats');
    final doc = await collection.doc('coffee').get();
    return doc.data()!['count'];
  }

  @override
  Future<void> incrementCoffeeCount() async {
    await _firestore.collection('stats').doc('coffee').update({
      'count': FieldValue.increment(1),
    });
  }

  @override
  Future<void> changeName(String name) async {
    await _firestore.collection('websites').doc('massi-dev.vercel.app').update({
      'name': name,
    });
  }
}
