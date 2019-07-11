import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/widgets/peopleItem.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';

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
                  child: SvgPicture.asset(
                    'assets/illusts/undraw_reminder.svg',
                    height: 300,
                  ),
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
                                color: Theme.of(context).primaryColor,
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'PillWhen에 오신걸 환영합니다.',
                        style: Theme.of(context).textTheme.caption.copyWith(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Theme.of(context).primaryColor,
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
            child: SizedBox(
                height: 200.0,
                child: ScrollConfiguration(
                  behavior: EmptyScrollBehavior(),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)
                            .copyWith(bottom: 25.0),
                    children: <Widget>[
                      PwCard(
                        child: Text('감기약 세 알\n아침 7:30'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      PwCard(
                        child: Text('감기약 세 알 \n비타민제 세 알\n점심 12:00'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      PwCard(
                        child: Text('감기약 세 알'),
                      ),
                    ],
                  ),
                )),
            badgeText: "2",
          ),
          HomeItem(
            title: '즐겨찾는 사람들',
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  PwCard(
                      child: PeopleItem(
                    image: Image.network(
                            'https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/32508762_606806973014817_9098627413276884992_o.jpg?_nc_cat=101&_nc_oc=AQm3rfLuQFqNXWTwzKesqM860EJMhtOTraxwhypoUE9-qU2t9z8I3liU9CF7_NEFcDk&_nc_ht=scontent-icn1-1.xx&oh=95bb70124ab9a7e5f4869b16316b3c74&oe=5D79DE07')
                        .image,
                    name: '김대용',
                    desc: '24분 늦음',
                  )),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  PwCard(
                      child: PeopleItem(
                    image: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDx00Ipz5DFjyCa_o5wtLPUf9AlnIpnYIUD-Kek1Jj-KJ4a6XQ3Q')
                        .image,
                    name: '김대용',
                    desc: 'OK',
                  )),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  PwCard(
                      child: PeopleItem(
                    image: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDx00Ipz5DFjyCa_o5wtLPUf9AlnIpnYIUD-Kek1Jj-KJ4a6XQ3Q')
                        .image,
                    name: '김대용',
                    desc: 'OK',
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
