import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izy_shop/app/core/configs/core_config.dart';
import 'package:izy_shop/app/core/consts/color.dart';
import 'package:izy_shop/app/core/consts/img.dart';
import 'package:izy_shop/app/core/presentation/widgets/custom_statusbar.dart';
import 'package:izy_shop/app/modules/home/presentation/pages/store_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  final _homeCtrllr = Modular.get<HomeController>();

  @override
  void initState() {
    _homeCtrllr.tabCtrllr = TabController(length: 2, vsync: this);
    super.initState();
  }

  Text _stores = Text(
    'Lojas',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  );

  TabBar _buildTabBar() => TabBar(
        controller: _homeCtrllr.tabCtrllr,
        indicatorColor: Colors.transparent,
        physics: NeverScrollableScrollPhysics(),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
        labelColor: Colors.black,
        labelStyle: TextStyle(
          color: PRIMARY_COLOR,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
        tabs: [
          Tab(text: 'Populares'),
          Tab(text: 'Histórico'),
        ],
      );

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _homeCtrllr.tabCtrllr,
      children: [StorePage(), StorePage()],
    );
  }

  Widget _buildContainerContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _stores,
          SizedBox(height: 10.0),
          _buildTabBar(),
          SizedBox(height: 20.0),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildTodayButtom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.black12.withOpacity(0.1)),
      child: Row(children: [
        SvgPicture.asset(HOME_ICON, width: 16),
        SizedBox(width: 4.0),
        Text('Hoje',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
      ]),
    );
  }

  Widget _buildBottomNavBarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(60.0),
              onTap: () {},
              child: _buildTodayButtom()),
          InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(60.0),
              child: SvgPicture.asset(SEARCH_ICON)),
          InkWell(
            onTap: () =>
                Modular.to.pushNamedAndRemoveUntil('/auth', (_) => false),
            borderRadius: BorderRadius.circular(60.0),
            child: SvgPicture.asset(USER_ICON),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
        height: 70.0,
        width: getWidth(context) / 2.0,
        child: Card(
            elevation: 7.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70.0),
            ),
            child: _buildBottomNavBarContent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Stack(children: [
        _buildContainerContent(),
        Positioned(
            bottom: 10.0,
            left: getWidth(context) / 4,
            child: _buildBottomNavBar(context)),
        // CustomStatusBar()
      ]),
    );
  }
}
