import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // 新增了这一行

//void main() => runApp(new MyApp1());

void main() {
  // 创建一个 MyApp
  //runApp(MyApp());
  //runApp(MyApp1());
  //runApp(MyApp2());
  runApp(MyApp3());
}

//*********************案例四******************************
class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildings = [
      Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
      Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
      Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),

      // double 一下
      Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
      Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
      Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
    ];


    return MaterialApp(
      title: 'ListView demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buildings'),
        ),
        body: BuildingListView(buildings, (index)=>debugPrint('item $index, clickd')),
      ),
    );
  }
}

enum BuildingType { theater, restaurant }

class Building {
  final BuildingType type;
  final String title;
  final String address;

  Building(this.type, this.title, this.address);
}

class ItemView extends StatelessWidget {
  final int position;
  final Building building;

  final OnItemClickListener listener;

  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      building.type == BuildingType.restaurant
          ? Icons.restaurant
          : Icons.theaters,
      color: Colors.blue[500]
    );

    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: icon,
        ),

        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                building.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(building.address)
            ],
          ),
        )
      ],
    );
    return InkWell(
      onTap: ()=>listener(position),
      child: widget,
    );
  }
}

class BuildingListView extends StatelessWidget{
  final List<Building> buildings;
  final OnItemClickListener listener;

  BuildingListView(this.buildings, this.listener);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: buildings.length,
      itemBuilder: (context, index) {
        return new ItemView(index, buildings[index], listener);
      },
    );
  }
}

typedef OnItemClickListener = void Function(int postion);

//*********************案例三******************************
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);

    final buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );

    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter UI basic 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 660.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(starCount.toString())
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}

//这个Widget作用于这个应用的顶层widget
//无状态的widget：StatelessWidget
//有状态的widget：StatefulWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPir = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our first Flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Flutter rolling demo'),
        ),
        body: Center(
          child: RollingButton(),
        ),
      ),
    );
  }
}

class RollingButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RollingState();
  }
}

class _RollingState extends State<RollingButton> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  List<int> _roll() {
    final roll1 = _random.nextInt(6) + 1;
    final roll2 = _random.nextInt(6) + 1;
    return [roll1, roll2];
  }

  void _onPressed() {
    debugPrint('_onPressed');

    final rollResults = _roll();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Roll result:(${rollResults[0]}, ${rollResults[1]})'),
          );
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final WordPair wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 对于每个建议的单词对都会调用一次 itemBuilder，
      // 然后将单词对添加到 ListTile 行中
      // 在偶数行，该函数会为单词对添加一个 ListTile row.
      // 在奇数行，该行书湖添加一个分割线 widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。

      itemBuilder: (BuildContext _context, int i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) {
          return new Divider();
        }
        // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
        // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，
        // 这可以计算出 ListView 中减去分隔线后的实际单词对数量

        final int index = i ~/ 2;
        // 如果是建议列表中最后一个单词对

        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
