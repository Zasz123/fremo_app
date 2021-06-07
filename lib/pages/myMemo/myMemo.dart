import 'package:flutter/material.dart';
import 'package:fremo_app/models/memo.dart';
import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/memoProvider.dart';

class MyMemo extends StatelessWidget {
  const MyMemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();

    List<Memo> memoList = memoProvider.memoMyList;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          memoList.length <= 0
              ? Text('데이터 없음 ㅋㅋ.')
              : GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  itemCount: memoList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) {
                    return CustomWidgetWrapper(
                      padding: EdgeInsets.all(10.0),
                      child: Text("${memoList[index].title}"),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
