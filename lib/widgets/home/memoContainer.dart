import 'package:flutter/material.dart';

import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

class MemoContainer extends StatelessWidget {
  final TextEditingController commentController;
  final Function onCommentSubmit;

  MemoContainer({
    @required this.commentController,
    @required this.onCommentSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Text(
                  "테스트 스트 제목",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "피어나는 착목한는 곳이 무엇을 발휘하기 보이는 위하여서. 우는 그들에게 청춘 옷을 심장의 싶이 약동하다. 구하기 주며, 아니더면, 꽃이 물방아 이것이다. 이상은 용기가 하는 방황하였으며, 얼마나 바이며, 그러므로 이상을 소담스러운 것이다. 하는 청춘의 더운지라 전인 이상의 산야에 풀이 대한 것이다. 못할 발휘하기 무엇을 있음으로써 황금시대다. 청춘이 인도하겠다는 들어 운다. 우리의 너의 그러므로 힘있다. 이것을 곧 길을 것이다. 인간의 발휘하기 갑 이상의 사막이다. 산야에 보내는 온갖 설산에서 뼈 갑 것이다.\n\n피는 인생을 거친 힘차게 이상의 인간의 아니다. 피부가 힘차게 꽃 풀밭에 얼마나 인생에 이것이다. 우는 얼마나 하여도 품고 것이다. 옷을 석가는 우는 속에서 열매를 발휘하기 무한한 그것은 이 힘있다. 같이, 그와 얼음 그들은 찬미를 사는가 이상은 끓는 이것이다. 용감하고 노년에게서 천하를 몸이 사랑의 생명을 이상 것이다. 피고, 예가 보배를 만천하의 사랑의 싹이 천지는 황금시대다. 살았으며, 인생에 새 용기가 보이는 그들에게 되려니와, 운다. 미인을 청춘에서만 같이, 동력은 봄바람이다. 작고 인도하겠다는 시들어 소담스러운 이상 아니더면, 있으랴? 그들에게 모래뿐일 유소년에게서 같이, 쓸쓸하랴?\n\n내는 위하여서, 자신과 어디 무엇이 이상 그들의 무엇을 철환하였는가? 때에, 끓는 얼음이 사는가 그들은 이상이 이것이다. 착목한는 끓는 길을 날카로우나 원질이 든 쓸쓸하랴? 끓는 트고, 대중을 가치를 있는 철환하였는가? 따뜻한 앞이 곧 품으며, 행복스럽고 예가 눈에 얼음이 때문이다. 이것을 수 구하지 예수는 앞이 방지하는 것이다. 새 든 보내는 우리 얼마나 그리하였는가? 인도하겠다는 방황하였으며, 뭇 그러므로 아니다. 방지하는 긴지라 그들에게 않는 것은 위하여 피는 것이다.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomInput(
            controller: commentController,
            initialValue: "",
            placeholder: "따듯한 한마디를 남겨주세요.",
          ),
          CustomDefaultButton(
            text: "화이팅!",
            onPressed: onCommentSubmit,
          ),
        ],
      ),
    );
  }
}
