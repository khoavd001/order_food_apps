
import 'package:firebase_database/firebase_database.dart';

Future<int> getServerTimeOffset() async{
  int offset = 0;
  var source = await FirebaseDatabase.instance
  .reference()
  .child('.info/serverTimeOffset')
  .once();
  offset = source.value;
  int estimateServerTimeInMs = DateTime.now().millisecondsSinceEpoch+offset;
  return estimateServerTimeInMs;
}