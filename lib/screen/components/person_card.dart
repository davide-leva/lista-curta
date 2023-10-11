import 'package:flutter/material.dart';

import '../../costants.dart';
import '../../service/data.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          right: defaultPadding,
          bottom: defaultPadding,
        ),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: person.hasEntered
                  ? Colors.lightBlue
                  : person.hasPaid
                      ? Colors.green
                      : Colors.red,
              size: 26,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Text(
              person.name,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ));
  }
}
