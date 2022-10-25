import 'package:flutter/material.dart';
import '../../../util/ColorsUtil.dart';

//动账明细
class DynamicDillList extends StatefulWidget {
  @override
  _DynamicDillListState createState() => _DynamicDillListState();
}

class _DynamicDillListState extends State<DynamicDillList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '动账明细',
          style: TextStyle(fontSize: 18, color: ColorsUtil.hexColor(0x2A2D37)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '提现记录',
                style: TextStyle(
                    fontSize: 16, color: ColorsUtil.hexColor(0x2A2D37)),
              ))
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 0, 14),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/calendar.png'),width: 16,),
                  SizedBox(width: 8,),
                  Text('动帐记录筛查',style: TextStyle(
                    fontSize: 14,
                    color: ColorsUtil.hexColor(0x2A2D37),
                  ),
                  ),
                  Image(image: AssetImage('assets/bar_share.png'),width: 16,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
