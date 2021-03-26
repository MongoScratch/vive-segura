import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mujersegura/models/User.dart';


class DatabaseService {
  User user;
  DatabaseService({this.user});

  static final Firestore _firestore = Firestore.instance;

  //Users Collection reference
  final CollectionReference userCollection = _firestore.collection('users');

  //map user snapshot to user data
  User userDataFromSnapshot(DocumentSnapshot snapshot){
    return User(
      userID: snapshot.data['uid'],
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phoneNumber: snapshot.data['phonenumber'],
      gender: snapshot.data['gender'],
      address: snapshot.data['address'],
      active: snapshot.data['active']
    );
  }

  //get user data stream from firebase
  Stream<User> get userData {
    return _firestore.collection('users').document(user.userID).snapshots()
        .map(userDataFromSnapshot);
  }

  Future setUserData() async {
    return await userCollection.document(user.userID).setData({
      'uid': user.userID,
      'name': user.name,
      'email': user.email,
      'phonenumber': user.phoneNumber,
      'gender': user.gender,
    });
  }

  Future updateUserData(String name, String gender) async {
    if(name == null)
      name = user.name;
    return await userCollection.document(user.userID).setData({
      'name': name,
      'gender': gender,
    }, merge: true);
  }

}