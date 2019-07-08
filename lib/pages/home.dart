import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medi/widgets/card.dart';
import 'package:medi/widgets/homeItem.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: SvgPicture.asset('assets/illusts/undraw_reminder.svg', height: 300,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            '걱정마세요,\n저희가 챙겨드릴게요.',
                            style: Theme.of(context).textTheme.title.copyWith(
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.white,
                                  offset: Offset(3.0, 3.0),
                                ),
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'PillWhen에 오신걸 환영합니다.',
                          style: Theme.of(context).textTheme.caption.copyWith(
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.white,
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            HomeItem(
              title: '오늘 예정된 복약',
              listItems: <Widget>[
                PwCard(),
                Padding(padding:EdgeInsets.only(right: 10.0)),
                PwCard(),
                Padding(padding:EdgeInsets.only(right: 10.0)),
                PwCard(),
              ],
              badgeText: "2",
            ),
            HomeItem(
              title: '즐겨찾는 사람들',
              listItems: <Widget>[
                PwCard(),
                Padding(padding:EdgeInsets.only(right: 10.0)),
                PwCard(),
                Padding(padding:EdgeInsets.only(right: 10.0)),
                PwCard(),
              ],
            )
          ],
        ),
      );
  }
}


