import 'package:app_buy_events/models/event_model.dart';
import 'package:app_buy_events/screens/event/event_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BuyEvent"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: event.length,
          itemBuilder: (context, index) {
            return eventCard(context, index);
          },
        ));
  }

  Widget eventCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EventScreen(event: event[index]),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: event[index].id,
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(event[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(15),
                  // ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event[index].nome,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 20, 0),
              child: Text('Data do evento : ' +
                  event[index].data +
                  ' às ' +
                  event[index].hora),
            ),
          ],
        ),
      ),
    );
  }
}
