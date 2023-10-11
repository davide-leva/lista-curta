import 'package:flutter/material.dart';
import 'package:lista/costants.dart';
import 'package:lista/screen/components/person_card.dart';

import '../../service/data.dart';

class ListaCard extends StatelessWidget {
  const ListaCard({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  bottom: defaultPadding * 3),
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Lista ${group.title}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: List.generate(group.numberOfPeople,
                        (index) => PersonCard(person: group.people[index])),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
