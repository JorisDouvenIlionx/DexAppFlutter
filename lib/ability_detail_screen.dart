import 'package:flutter/material.dart';

import 'ability_model.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails({super.key, required this.ability});

  final Ability ability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (Text(ability.name ?? "No Name")),
        ),
        body: Center(child: Text(ability.effect ?? "No Effect")));
  }
}
