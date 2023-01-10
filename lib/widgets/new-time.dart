import 'package:flutter/material.dart';

import '../provider/time_provider.dart';

class NewTime extends StatelessWidget {
  const NewTime({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final TimeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => provider.selectTime(context),
        child: const ListTile(
          iconColor: Colors.white70,
          leading: Icon(Icons.add),
          title: Text(
            'Nueva alarma',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'TextFuture',
            ),
          ),
        ),
      ),
    );
  }
}
