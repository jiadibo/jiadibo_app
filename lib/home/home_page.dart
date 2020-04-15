import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final name;
  final img;

  HomePage({this.name, this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blue[700],
                expandedHeight: 100,
                excludeHeaderSemantics: true,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Row(children: <Widget>[Text("Berburubukaan")]),
                  background: ColoredBox(
                    color: Colors.blue[700],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.only(left: 20, right: 20),
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.blue[200],
                      tabs: [
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "Timeline",
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 36, left: 16, right: 16, bottom: 8),
              child: Column(children: <Widget>[
                Container(
                  height: 66,
                  width: 66,
                  child: CircleAvatar(
                    child: Image.network('https://media-exp1.licdn.com/dms/image/C5103AQELshs2CQjl2A/profile-displayphoto-shrink_200_200/0?e=1592438400&v=beta&t=lLUnVoTkRJLWtb9RIdEe6J6P17yUU0DbfIdF-zAG1U8'),
                  ),
                ),
                Text(
                  "Selamat datang $name",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lengkapi data diri anda segera",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
