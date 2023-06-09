import 'package:flutter/material.dart';

import '../models/models.dart';
import '../components/components.dart';

class FriendPostTile extends StatelessWidget {
  final Post? post;
  const FriendPostTile({Key? key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (post != null) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleImage(
                imageProvider: AssetImage(post!.profileImageUrl),
                imageRadius: 20),
// 3
            const SizedBox(width: 16),
// 4
            Expanded(
// 5
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(post!.comment),
                  Text('${post!.timestamp} mins ago',
                      style: const TextStyle(fontWeight: FontWeight.w700))
                ]))
          ]);
    } else {
      return Text('no posts');
    }
  }
}
