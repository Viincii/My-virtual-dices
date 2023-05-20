import 'package:flutter/material.dart';
import 'package:my_virtual_dices/blocs/bloc_dice.dart';
import 'package:my_virtual_dices/blocs/bloc_int.dart';
import 'package:my_virtual_dices/ui/tiles/dice_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfFaces = 6;
    BlocInt blocNumberOfDices = BlocInt(1);
    List<BlocDice> listBlocs = [];

    List<int> listResults = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('My Virtual Dices'),
      ),
      body: StreamBuilder<int>(
          stream: blocNumberOfDices.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            for (var i = 0; i < snapshot.data!; i++){
              listBlocs.add(BlocDice(numberOfFaces: numberOfFaces));
            }
            return Column(
            children: [
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.all(30),
                      child: const Text('Number of dices :')
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width /2.5,
                    margin: const EdgeInsets.all(20),
                    color: Colors.blueGrey[50],
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onSubmitted: (value) => {
                        if (int.tryParse(value) != null) {
                          blocNumberOfDices.changeValue(int.parse(value))
                        }
                      },
                    ),
                  )
                ],
              ),
              //Text('Results: $listResults'),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount: snapshot.data,
                    itemBuilder: (BuildContext ctx, index){
                      return Center(child: DiceTile(
                        numberOfFaces: numberOfFaces,
                        blocDice: listBlocs[index],
                      ),);
                    },
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120),
                  ),
                ),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () async {
          listResults = await BlocDice.rollAllDices(listBlocs);
        },
        child: const Text('Roll'),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}