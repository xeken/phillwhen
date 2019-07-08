import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text('걱정마세요,\n저희가 챙겨드릴게요.', style: Theme.of(context).textTheme.title,)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('PillWhen에 오신걸 환영합니다.', style: Theme.of(context).textTheme.caption, textAlign: TextAlign.left,),
            )
          ],
        ),
      );
  }
}
