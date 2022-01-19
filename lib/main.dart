import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TelegramChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Чаты'),
    );
  }
}

final List<MenuRowData> menuRow = [
  MenuRowData(
      Icons.notifications_on, 'Архив', 'Фрольченков, Бар на диване, коктейли'),
  MenuRowData(Icons.privacy_tip, 'Оля',
      'что dsdffgh jklhkgjhfj klhkgjfhdgjhkj jldfkjlksjdflj jkljsdlkjldksjто'),
  MenuRowData(Icons.storage, 'Папа', 'Иван, сын моего однокласс=ника'),
  MenuRowData(Icons.brush, 'Данила', 'Видео'),
  MenuRowData(Icons.language, 'Килограмм срача',
      'Салават Газизов ну поднималовь до 132'),
  MenuRowData(Icons.print, 'LazyLoad Dart', 'Dmitry Dmitry'),
  MenuRowData(Icons.airplane_ticket, 'Новороссийск ДТП', 'ДТП было в 5 утра.'),
];

class MenuRowData {
  final IconData avatar;
  final String contactName;
  final String textMessage;

  MenuRowData(this.avatar, this.contactName, this.textMessage);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            tabs: [
              Text('Все'),
              Text('New'),
              Text('Personal'),
              Text('Unread'),
              Text('Job'),
            ],
          ),
          leading: Center(
            child: Text(
              'Изм.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          title: Text(widget.title),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Icon(Icons.note),
            )
          ],
        ),
        body: ListView(
          children: menuRow.map((e) => WidgetRow(data: e)).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Контакты',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Звонки',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Чаты',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            ),
          ],
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}

class WidgetRow extends StatelessWidget {
  final MenuRowData data;
  const WidgetRow({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Icon(
              data.avatar,
              size: 40,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.contactName,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  data.textMessage,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
