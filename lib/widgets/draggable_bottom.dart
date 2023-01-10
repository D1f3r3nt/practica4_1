import 'package:flutter/material.dart';

class DraggableBottom extends StatelessWidget {
  const DraggableBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('A'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
