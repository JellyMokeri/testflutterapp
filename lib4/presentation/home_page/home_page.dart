import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testappgulyaev/data/repositories/potter_repository.dart';
import 'package:testappgulyaev/presentation/details_page/details_page.dart';
import 'package:testappgulyaev/domain/models/card.dart';

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
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();
  late Future<List<CardData>?> data;

  final repo = PotterRepository();

  @override
  void initState() {
    data = repo.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CupertinoSearchTextField(
              controller: searchController,
              onChanged: (search) {
                setState(() {
                  data = repo.loadData(q: search);
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<List<CardData>?>(
                future: data,
                builder: (context, snapshot) => SingleChildScrollView(
                  child: snapshot.hasData
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data?.map((data) {
                      return _Card.fromData(
                        data,
                        onLike: (String title, bool isLiked) =>
                            _showSnackBar(context, title, isLiked),
                        onTap: () => _navToDetails(context, data),
                      );
                    }).toList() ??
                        [],
                  )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
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
          '$title ${isLiked ? 'liked!' : 'disliked :('}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }
}