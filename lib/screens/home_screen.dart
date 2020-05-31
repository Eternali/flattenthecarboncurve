import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isSel1 = false;
  bool _isSel2 = false;
  bool _isSel3 = false;
  bool _isSel4 = false;
  bool _isSel5 = false;
  bool _isSel6 = false;
  bool _isSel7 = false;
  int toInt(bool x) {
	x ? 1 : 0;
  }

  double totalFootprint() {
    double out = 0.1315068493*toInt(_isSel1) + 14.83013699*toInt(_isSel2) + 13.15068493*toInt(_isSel3) + 4.383561644*toInt(_isSel4) + 0.5835616438*toInt(_isSel5) + 0.4328767123*toInt(_isSel6) + 0.4876712329*toInt(_isSel7);
	print(out);
	return out;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	  backgroundColor: Color.fromRGBO(158, 255, 138, 0.8),
      body: Center(
        child: new Column (
			children: [
				Text('\nFlatten the Carbon Curve - Daily Updater',
					  style: TextStyle(fontSize: 25),
				    ),
				/*TextField(
					decoration: InputDecoration(
					border: InputBorder.none,
					hintText: 'Enter your daily average from the previous page'
					),
				),*/
				Text('\nToday, did you...',
				     style: TextStyle(fontSize: 20),
				    ),
				CheckboxListTile(
					title: const Text('Plant a tree?'),
					value: _isSel1,
					onChanged: (val) {
						setState(() =>
							_isSel1 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Walk or bike to work (if you do not usually)?'),
					value: _isSel2,
					onChanged: (val) {
						setState(() =>
							_isSel2 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Use public transport (if you usually drive?)'),
					value: _isSel3,
					onChanged: (val) {
						setState(() =>
							_isSel3 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Choose to wash your clothes in cold water?'),
					value: _isSel4,
					onChanged: (val) {
						setState(() =>
							_isSel4 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Buy from a thrift store instead of a retailer?'),
					value: _isSel5,
					onChanged: (val) {
						setState(() =>
							_isSel5 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Use re-usable utensils at a fast food restaraunt?'),
					value: _isSel6,
					onChanged: (val) {
						setState(() =>
							_isSel6 = val);
					}
				),
				CheckboxListTile(
					title: const Text('Use re-usable shopping bags?'),
					value: _isSel7,
					onChanged: (val) {
						setState(() =>
							_isSel7 = val);
					}
				),
				const SizedBox(height: 30),
					RaisedButton(
						onPressed: totalFootprint,
						child: const Text(
						'Calculate Daily Average Footprint Deduction!',
						style: TextStyle(fontSize: 20)
					),
				),
			],
		),
      ),
    );
  }
}


