import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/posts.dart';

class LikeController extends GetxController {
  final String postID;
  final String userID;

  LikeController({required this.postID, required this.userID});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(postID + "::::::");
    print("INSIED GET INITSATE");
    checkUserLiked(postID, userID);
    getTotalLikes(postID);
  }

  RxBool alreadyLiked = false.obs;
  RxInt likesTotal = 0.obs;

  Future<bool> checkUserLiked(postID, userID) async {
    print("******||");
    final query = FirebaseFirestore.instance
        .collection('likes')
        .where('postID', isEqualTo: postID)
        .where('userID', isEqualTo: userID);
    print("******");
    final snapshots = await query.get();
    if (snapshots.size == 0) {
      alreadyLiked.value = false;
      return false;
    }
    alreadyLiked.value = true;
    return true;
  }

  getTotalLikes(postID) async {
    final query = FirebaseFirestore.instance
        .collection('likes')
        .where('postID', isEqualTo: postID);
    final snapshots = await query.get();
    final totalLikes = snapshots.size;
    likesTotal.value = totalLikes;

    return totalLikes;
  }

  removeUserLike(postID, userID) async {
    print(postID + "||||| remove user");

    final query = FirebaseFirestore.instance
        .collection('likes')
        .where('postID', isEqualTo: postID)
        .where('userID', isEqualTo: userID);
    final snapshots = await query.get();

    for (final doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  addUserLike(postID, userID) async {
    print(postID + "||||| add user");
    // final like = Like(postID: postID, userID: userID);
    bool alreadyLiked = await checkUserLiked(postID, userID);
    if (alreadyLiked) {
      print("ALready liked");
      return;
    } else {
      FirebaseFirestore.instance
          .collection('likes')
          .add({'userID': userID, 'postID': postID});
    }
    update();
    // Future.delayed(Duration(seconds: 5));
    // getTotalLikes(postID)
  }

  updateLikeField(likes) {
    likesTotal.value = likes;
  }

  updateLikesInDB(postID) {
    FirebaseFirestore.instance
        .collection('livestream')
        .doc(postID)
        .update({'likes': likesTotal.value});
    update();
  }
}
