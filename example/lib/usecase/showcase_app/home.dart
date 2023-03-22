import 'package:flutter/material.dart';

import '../../usecase/showcase_app/data.dart';

int selectedIndex = 0;

//ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int selectedItem = 0;
  HomePage({super.key, required this.selectedItem});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        appBar: const MainHeader(),
        backgroundColor: backgroundColor,
        body: Row(
          children: [
            if (!displayMobileLayout)
              Drawer(
                width: 250,
                backgroundColor: backgroundColor,
                child: ListView(
                  children: [
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {},
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) =>
                                  const ListTile(
                            leading: Icon(
                              Icons.linear_scale_outlined,
                              color: Colors.red,
                            ),
                            title: Text(
                              'Linear Gauge',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          body: DrawerListView(
                            onSelected: (i) {
                              setState(() {
                                selectedIndex = i;
                              });
                            },
                          ),
                          isExpanded: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(
              width: displayMobileLayout ? null : 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ], borderRadius: const BorderRadius.all(Radius.circular(20))),
                margin: displayMobileLayout ? null : const EdgeInsets.all(5),
                child: Scaffold(
                  appBar: AppBar(
                    iconTheme:
                        const IconThemeData().copyWith(color: Colors.black),
                    elevation: 0,
                    centerTitle: false,
                    title: Text(
                      linearGaugeUseCases[selectedIndex]["title"],
                      style: const TextStyle(color: Colors.black),
                    ),
                    automaticallyImplyLeading:
                        displayMobileLayout ? true : false,
                    backgroundColor: backgroundColor,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.code_outlined),
                        tooltip: 'Source Code',
                        color: Colors.red,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('This is a snackbar')));
                        },
                      ),
                    ],
                  ),
                  drawer: displayMobileLayout
                      ? Drawer(
                          child: ListView(
                            children: [
                              ExpansionPanelList(
                                children: [
                                  ExpansionPanel(
                                    headerBuilder: (BuildContext context,
                                            bool isExpanded) =>
                                        const ListTile(
                                      leading: Icon(
                                        Icons.linear_scale_outlined,
                                        color: Colors.red,
                                      ),
                                      title: Text(
                                        'Linear Gauge',
                                      ),
                                    ),
                                    body: DrawerListView(
                                      onSelected: (i) {
                                        setState(() {
                                          selectedIndex = i;
                                        });
                                      },
                                    ),
                                    isExpanded: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : null,
                  body: linearGaugeUseCases[selectedIndex]["widget"],
                ),
              ),
            )
          ],
        ));
  }
}

class MainHeader extends StatelessWidget with PreferredSizeWidget {
  const MainHeader({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text(
        "Flutter Gauges",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              onPressed: () {},
              icon: const Icon(Icons.get_app),
              label: const Text("Download Package")),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class DrawerListView extends StatelessWidget {
  final Function(int) onSelected;
  const DrawerListView({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    int useCaseCount =
        linearGaugeUseCases.where((item) => item['type'] == 'UseCase').length;

    return Column(
      children: [
        // for  loop iterate over linearGaugeUseCases
        for (var i = 0; i < useCaseCount; i++)
          DrawerListTile(
              onSelected: onSelected, index: linearGaugeUseCases[i]["index"]),
        const Divider(),
        // API playgrounds
        DrawerListTile(onSelected: onSelected, index: 7),
        DrawerListTile(onSelected: onSelected, index: 8),
        DrawerListTile(onSelected: onSelected, index: 9),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.onSelected,
    required this.index,
  });
  final int index;
  final Function(int p1) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      selected: index == selectedIndex ? true : false,
      hoverColor: Colors.red.withOpacity(0.1),
      selectedColor: Colors.red,
      onTap: () {
        onSelected(index);
      },
      title: Text(
        linearGaugeUseCases[index]["title"],
      ),
    );
  }
}

Color getBackgroundColor(int index) {
  if (selectedIndex == index) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}

Color getTextColor(int index) {
  if (selectedIndex == index) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}
