import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Чаты'),
    );
  }
}

final List<MenuRowData> menuRow = [
  MenuRowData(Icons.notifications_on, 'Архив',
      'Фрольченков, Бар на диване, коктейли', '10:44'),
  MenuRowData(
      Icons.privacy_tip,
      'Оля',
      'что dsdffgh jklhkgjhfj klhkgjfhdgjhkj jldfkjlksjdflj jkljsdlkjldksjто',
      'вчера'),
  MenuRowData(Icons.storage, 'Папа', 'Иван, сын моего однокласс=ника', '10:44'),
  MenuRowData(Icons.brush, 'Данила', 'Видео', '14:22'),
  MenuRowData(Icons.language, 'Килограмм срача',
      'Салават Газизов ну поднималовь до 132', '21:55'),
  MenuRowData(Icons.print, 'LazyLoad Dart', 'Dmitry Dmitry', '4:54'),
  MenuRowData(
      Icons.airplane_ticket, 'Новороссийск ДТП', 'ДТП было в 5 утра.', '10:20'),
];

class MenuRowData {
  final IconData avatar;
  final String contactName;
  final String textMessage;
  final String messageTime;

  MenuRowData(
      this.avatar, this.contactName, this.textMessage, this.messageTime);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
          title: Text('Чаты'),
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
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ),
          );
        },
        leading: CircleAvatar(
          child: Icon(data.avatar),
        ),
        title: Text(data.contactName),
        subtitle: Text(data.textMessage),
        trailing: Column(
          children: [
            Text(data.messageTime),
            Expanded(child: Icon(Icons.chevron_right)),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбранный чат'),
      ),
    );
  }
}
