import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testappgulyaev/presentation/details_page/details_page.dart';

part 'card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: const MyWidget.Body(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget.Body({super.key}); // ключи

  @override
  Widget build(BuildContext context) {
    final data = [
      CardData(
          'Меню',
          descriptionText: 'Сделайте свой день ярче! Попробуйте новое меню',
          icon: Icons.restaurant_menu,
          imageUrl:
          'https://bk43.ru/assets/images/0000000000000000000000000000000000000______0000000000000000000000000/2013-1-12-019.jpg'
      ),
      CardData(
          'Подарочная карта',
          descriptionText: 'Найдите идеальный подарок для близких',
          icon: Icons.card_giftcard,
          imageUrl:
          'https://www.pharmacosmetica.ru/files/pharmacosmetica/reg_images/eh99989436614.jpg'
      ),
      CardData(
          'Событие',
          descriptionText: 'Узнайте о самых интересных событиях в вашем городе',
          icon: Icons.event_note,
          imageUrl:
          'https://www.m24.ru/b/d/nBkSUhL2hFkln86zJL6BrNOp2Z3z8Zj21iDEh_fH_nKUPXuaDyXTjHou4MVO6BCVoZKf9GqVe5Q_CPawk214LyWK9G1N5ho=s1V2rVz4a-OifSmjwHOLfw.jpg'
      ),
      CardData(
          'Знакомства',
          descriptionText: 'Познакомьтесь с новыми людьми',
          icon: Icons.group,
          imageUrl:
          'https://avatars.dzeninfra.ru/get-zen_doc/9505890/pub_641796ec9eb89c7eda8498c3_641797013c58ad20cbb3cad0/scale_1200'
      ),
      CardData(
          'Книги',
          descriptionText: 'Откройте для себя мир новых знаний',
          icon: Icons.book,
          imageUrl:
          'https://www.buro247.ru/images/2023/07/1689083547842077.jpg'
      ),
      CardData(
          'Отдых',
          descriptionText: 'Позвольте себе отдохнуть и насладиться природой',
          icon: Icons.landscape,
          imageUrl:
          'https://all.accor.com/magazine/imagerie/kartinka-1-c1eb.jpg'
      ),
      CardData(
          'Фитнес',
          descriptionText: 'Попробуйте новые фитнес-тренировки',
          icon: Icons.fitness_center,
          imageUrl:
          'https://recordfit63.ru/wp-content/uploads/2022/02/jbr_2774-e1646913609603-1600x893.jpeg'
      ),
      CardData(
          'Стиль',
          descriptionText: 'Создайте уникальный стиль',
          icon: Icons.style,
          imageUrl:
          'https://amanibrand.com/wp-content/uploads/2022/08/kak-sozdat-svoj-unikalnyj-stil-v-odezhde-dlja-devushki-v-astane.jpg'
      ),
      CardData(
          'Эмоции',
          descriptionText: 'Поделитесь своими эмоциями',
          icon: Icons.message,
          imageUrl:
          'https://youtalk.ru/static/6e9dc64b34d8592a3b18c9a1306e68d1/b1d89/rasp.png'
      ),
      CardData(
          'Рецепты',
          descriptionText: 'Попробуйте новые рецепты для здорового питания',
          icon: Icons.local_offer ,
          imageUrl:
          'https://www.oum.ru/upload/iblock/d5b/drzrfnz66s1i1ovp8x0mzozqm4loihwu.png'
      ),
      CardData(
          'Языки',
          descriptionText: 'Изучите языки, чтобы расширить свои горизонты',
          icon: Icons.language,
          imageUrl:
          'https://horosho-ili.net/wp-content/uploads/2023/07/Letnie-shkoly-inostrannyh-yazykov.webp'
      ),
      CardData(
          'Мечта',
          descriptionText: 'Забронируйте путешествие своей мечты',
          icon: Icons.flight_takeoff,
          imageUrl:
          'https://novate.ru/files/u34852/personal-trips-1.jpg'
      ),
      CardData(
          'Технологии',
          descriptionText: 'Узнайте о новых технологиях и гаджетах',
          icon: Icons.devices,
          imageUrl:
          'https://img.freepik.com/premium-photo/group-of-students-using-gadgets-to-learn-new-technology-with-teacher-during-lesson-in-the-classroom_249974-17264.jpg'
      ),
      CardData(
          'Творчество',
          descriptionText: 'Найдите вдохновение для творческих проектов',
          icon: Icons.lightbulb,
          imageUrl:
          'https://nyblog.ru/wp-content/uploads/2022/12/kak-nayti-vdohnovenie.jpg'
      ),
      CardData(
          'Благотворительность',
          descriptionText: 'Займитесь благотворительностью и помогите нуждающимся',
          icon: Icons.volunteer_activism,
          imageUrl:
          'https://cdn.lifehacker.ru/wp-content/uploads/2019/04/98B7A29B-0007-4617-89EF-4DD8E5449264_1567515010-1024x512.jpeg'
      ),
      CardData(
          'Работа',
          descriptionText: 'Найдите работу своей мечты!',
          icon: Icons.work,
          imageUrl:
          'https://proforientir42.ru/wp-content/uploads/2021/03/rabota-mechty-1024x512.jpg'
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((data) {
            return _Card.fromData(
              data,
              onLike: (String title, bool isLiked) =>
                  _showSnackBar(context, title, isLiked),
              onTap: () => _navToDetails(context, data),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Card $title ${isLiked ? 'liked!': 'disliked :('}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }
}

