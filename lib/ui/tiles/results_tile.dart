import 'package:flutter/material.dart';
import 'package:my_virtual_dices/ui/tiles/dice_display_tile.dart';

class ResultsTile extends StatelessWidget{
  final List<int> listResults;
  const ResultsTile({Key? key, required this.listResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listResults == []){
      return Container();
    }
    Map<int, int> resultMap = listResults.fold({}, (Map<int, int> map, int roll) {
      map[roll] = map.containsKey(roll) ? map[roll]! + 1 : 1;
      return map;
    });
    List<MapEntry<int, int>> sortedEntries = resultMap.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
    resultMap = Map.fromEntries(sortedEntries);
    List<Widget> listResWidgets = [];
    resultMap.forEach((key, value) {
      listResWidgets.add(Container(
        padding: EdgeInsets.symmetric(vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text('$value', style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            ),
            DiceDisplayTile(diceValue: key, size: 50)
          ],
        ),
      ));
    });
    return Column(
      children: [
        const Text('Summary', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal
        ),),
        ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width/3),
            children: listResWidgets)
      ],
    );
  }


}