import 'package:app_buy_events/models/event_model.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  // const EventScreen({Key? key}) : super(key: key);

  final Event? event;
  EventScreen({this.event});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  void _decrementIngressos() {
    setState(() {
      widget.event!.ingressos--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.event!.id,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.event!.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.my_location_sharp,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.event!.nome,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    color: Colors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.event!.data),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.event!.hora),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.airplane_ticket_outlined,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(widget.event!.ingressos > 0
                        ? widget.event!.ingressos.toString()
                        : '0'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: SizedBox(
                child: Text('Sobre o evento:'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(28, 158, 158, 158),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.event!.descricao,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: widget.event!.ingressos > 0
          ? FloatingActionButton(
              onPressed: () {
                _decrementIngressos();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green[300],
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text('Compra Realizada com sucesso !'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.redAccent,
              tooltip: 'Comprar',
              child: Icon(Icons.shopping_cart_outlined),
            )
          : Text(
              'Ingressos Esgotados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
    );
  }
}
