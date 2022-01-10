import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starwarsbitsports/generated/l10n.dart';
import 'package:starwarsbitsports/models/doc.dart';

class ItemBooks extends StatelessWidget {
  final Doc item;
  const ItemBooks({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title!,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Text(
                    S.current.YearPublication + item.yearPublication!,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Modular.to.pushNamed('/detail', arguments: {
                  'doc': item,
                });
                
              },
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.0,
              ),
            ),
            const SizedBox(
              width: 16.0,
            )
          ],
        ),
      ),
      const Divider()
    ]);
  }
}
