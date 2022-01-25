import 'package:flutter/material.dart';
import 'package:untitled1/userProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
  MenuRowData(Icons.storage, 'Папа', 'Иван, сын моего одноклассника', '10:44'),
  MenuRowData(Icons.brush, 'Данила', 'Видео', '14:22'),
  MenuRowData(Icons.language, 'Килограмм срача',
      'Салават Газизов ну поднималовь до 132', '21:55'),
  MenuRowData(Icons.print, 'LazyLoad Dart', 'Dmitry Dmitry', '4:54'),
  MenuRowData(
      Icons.airplane_ticket, 'Новороссийск ДТП', 'ДТП было в 5 утра.', '10:20'),
  MenuRowData(Icons.notifications_on, 'Архив',
      'Фрольченков, Бар на диване, коктейли', '10:44'),
  MenuRowData(
      Icons.privacy_tip,
      'Оля',
      'что dsdffgh jklhkgjhfj klhkgjfhdgjhkj jldfkjlksjdflj jkljsdlkjldksjто',
      'вчера'),
  MenuRowData(Icons.storage, 'Папа', 'Иван, сын моего одноклассника', '10:44'),
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
        body: ListView.builder(
            itemCount: menuRow.length,
            itemBuilder: (context, index) {
              return WidgetRow(data: menuRow[index]);
            }),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}


class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          print("Контакты");
          break;
        case 1:
          print("Звонки");
          break;
        case 2:
          print("Чаты");
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfile()),
          );
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      onTap: onItemTapped,
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
              settings: RouteSettings(arguments: data),
            ),
          );
        },
        leading: CircleAvatar(
          child: Icon(data.avatar),
        ),
        title: Text(data.contactName),
        subtitle: Text(
          data.textMessage,
          maxLines: 1,
        ),
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
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as MenuRowData;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(data.contactName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(data.textMessage),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Назад'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
