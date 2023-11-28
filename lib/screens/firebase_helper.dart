import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper._();
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFirestoreHelper._()
      : _firebaseFirestore = FirebaseFirestore.instance {
    Firebase.initializeApp(); // Initialize Firebase app
  }
  FirebaseFirestore getFirebaseFirestoreInstance() {
    return _firebaseFirestore;
  }

  Future<void> addActivitiesForUser(String userId, List<Map<String,dynamic>> activitiesString,
      String interests, String place) async {
    try {
      FirebaseFirestore firestore = _firebaseFirestore;
      DocumentSnapshot userDoc = await firestore.collection('Usersss').doc(
          userId).get();
      if (!userDoc.exists) {
        await firestore.collection('Usersss').doc(userId).set({});
      }

      DocumentReference wishlistRef = firestore.collection('Usersss').doc(
          userId).collection('wishlist').doc();

      await wishlistRef.set({
        'itinerary': activitiesString,
        'interests': interests,
        'place': place,
      });
      print('Itinerary saved to the database');
    } catch (e) {
      print('Error adding activities for user: $e');
    }
  }

  Future<void> addTravelHistoryForUser(String userId,
      String fromDate,
      String toDate,
      String deptCity,
      String arrivalCity,
      String travelType,
      String stayType,
      String interests,
      Map<String,dynamic> modeOfAccommodation,
      Map<String,dynamic> modeOfTransport,
      List<Map<String,dynamic>> activitiesString,) async {
    try {
      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = _firebaseFirestore;

      // Check if the user document exists
      DocumentSnapshot userDoc = await firestore.collection('Usersss').doc(
          userId).get();
      if (!userDoc.exists) {
        // If the user document does not exist, create the document with the user ID
        await firestore.collection('Usersss').doc(userId).set({});
      }

      // Use a unique identifier, such as a timestamp, as part of the document ID
      String timestamp = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      String documentId = 'travel_$timestamp';

      // Add the travel history data to the "travel_history" subcollection
      await firestore.collection('Usersss').doc(userId).collection(
          'travel_history').doc(documentId).set({
        'fromDate': fromDate,
        'toDate': toDate,
        'modeOfAccommodation': modeOfAccommodation,
        'modeOfTransport': modeOfTransport,
        'itinerary': activitiesString,
        'interests': interests, // Convert List to a comma-separated string
        'dept_city':deptCity,
        'arrival_city':arrivalCity,
        'travelType':travelType,
        'stayType':stayType,
      });

    } catch (e) {
      print('Error adding travel history: $e');
    }
  }
}   //Firebase_Helper_Database