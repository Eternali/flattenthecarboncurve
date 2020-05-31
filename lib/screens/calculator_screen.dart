import 'package:flattenthecarboncurve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final tabs = ['Transportation', 'Diet', 'Household'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = Provider.of<User>(context);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: Text(
                'Your Carbon Footprint',
                style: theme.textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.headline2,
                  children: [
                    TextSpan(text: '${user.totalFootprint.round()} '),
                    TextSpan(
                      text: 'lbs of CO\u2082/year',
                      style: theme.textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'About how many hours do you spend on a plane in a year?',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: TextEditingController()..text = user.planeHours.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (hours) {
                            user.planeHours = int.parse(hours);
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'About how many hours do you spend driving in a day?',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: TextEditingController()..text = user.drivingHours.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (hours) {
                            user.drivingHours = double.parse(hours);
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'And what kind of car do you drive?',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: NeumorphicRadio(
                                groupValue: user.carType,
                                value: CarType.small,
                                onChanged: (type) {
                                  user.carType = type;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'A small one',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: NeumorphicRadio(
                                groupValue: user.carType,
                                value: CarType.average,
                                onChanged: (type) {
                                  user.carType = type;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'An average one',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: NeumorphicRadio(
                                groupValue: user.carType,
                                value: CarType.suv,
                                onChanged: (type) {
                                  user.carType = type;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'An SUV or truck',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: NeumorphicRadio(
                                groupValue: user.carType,
                                value: CarType.hybrid,
                                onChanged: (type) {
                                  user.carType = type;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'A hybrid',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: NeumorphicRadio(
                                groupValue: user.carType,
                                value: CarType.none,
                                onChanged: (type) {
                                  user.carType = type;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'I don\'t drive',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'About how many hours a week do you spend on the bus?',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: TextEditingController()..text = user.busHours.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (hours) {
                            user.busHours = int.parse(hours);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'What kind of diet do you follow?',
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          alignment: WrapAlignment.center,
                          children: [
                            NeumorphicRadio(
                              value: Diet.meatHeavy,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Meat Heavy'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: Diet.average,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Average'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: Diet.lowMeat,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Low Meat'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: Diet.noBeef,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('No Beef'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: Diet.vegetarian,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Vegetarian'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: Diet.vegan,
                              groupValue: user.diet,
                              onChanged: (diet) {
                                user.diet = diet;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Vegan'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'What general size of house do you have?',
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          alignment: WrapAlignment.center,
                          children: [
                            NeumorphicRadio(
                              value: HouseSize.small,
                              groupValue: user.houseSize,
                              onChanged: (size) {
                                user.houseSize = size;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Small'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: HouseSize.average,
                              groupValue: user.houseSize,
                              onChanged: (size) {
                                user.houseSize = size;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Average'),
                              ),
                            ),
                            NeumorphicRadio(
                              value: HouseSize.large,
                              groupValue: user.houseSize,
                              onChanged: (size) {
                                user.houseSize = size;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Text('Large'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_tabController.index > 0)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NeumorphicButton(
                          child: Icon(Icons.chevron_left),
                          onPressed: () {
                            _tabController.animateTo(_tabController.index - 1);
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(tabs[_tabController.index - 1]),
                        ),
                      ],
                    )
                  else
                    Container(),
                  if (_tabController.index < _tabController.length - 1)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(tabs[_tabController.index + 1]),
                        ),
                        NeumorphicButton(
                          child: Icon(Icons.chevron_right),
                          onPressed: () {
                            _tabController.animateTo(_tabController.index + 1);
                            setState(() {});
                          },
                        ),
                      ],
                    )
                  else
                    NeumorphicButton(
                      child: Text('FINISH'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
