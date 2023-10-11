import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista/costants.dart';

import '../service/data.dart';
import 'components/header.dart';
import 'components/lista_card.dart';

class ListaScreen extends StatelessWidget {
  const ListaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Group> groups = <Group>[];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Text(
              Data.partyName,
              style: TextStyle(
                shadows: const [
                  Shadow(
                    color: Color.fromARGB(255, 80, 85, 112),
                    offset: Offset(3, 3),
                    blurRadius: 10,
                  )
                ],
                fontSize: min(MediaQuery.sizeOf(context).width * 0.08, 40),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                border: Border.all(
                  color: Colors.lightBlue.withOpacity(0.4),
                  width: 2.0,
                ),
              ),
              child: Text(
                "${Data.totalPeople} persone",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding * 3,
            ),
            Column(
              children: List.generate(Data.groups.length,
                  (index) => ListaCard(group: Data.groups[index])),
            )
          ],
        ),
      )),
    );
  }
}
