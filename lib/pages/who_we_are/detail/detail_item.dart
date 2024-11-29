import 'package:flutter/material.dart';
import 'package:flutter_webapp/utils/text_utils.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Detail Item $id", style: TextUtils.headerStyle()),
    );
  }
}
