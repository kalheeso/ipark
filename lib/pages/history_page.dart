// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      setState(() {
        if (paymentsLoaded.isEmpty) {
          paymentsLoaded.addAll(payments);
        } else {
          paymentsLoaded.clear();
        }
      });
    _refreshController.refreshCompleted();
  }

  List<ParkUse> payments = [
    ParkUse(
      index: 1,
      location: 'Shopping Flamboyant',
      price: 12.30,
      inDateInTimestamp: 1630000000,
      outDateInTimestamp: 1630006000,
    ),
    ParkUse(
      index: 2,
      location: 'Passeio das Águas Shopping',
      price: 5.0,
      inDateInTimestamp: 1630000000,
      outDateInTimestamp: 1630006000,
    ),
  ];

  List<ParkUse> paymentsLoaded = [];

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: Visibility(
        visible: paymentsLoaded.isNotEmpty,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Não há pagamentos\nainda', style: TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center,),
          ],
        ),
        child: ListView.separated(itemBuilder: (_, i) {
          var payment = paymentsLoaded[i];
          return ParkUseWidget(data: payment);
        }, separatorBuilder: (_, i) {
          return Divider(color: Colors.white.withOpacity(0.5),);
        }, itemCount: paymentsLoaded.length, shrinkWrap: true,),
      ),
    );
  }
}

class ParkUseWidget extends StatelessWidget {
  final ParkUse data;
  const ParkUseWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.location),
              Text('R\$ ${data.price.toStringAsFixed(2)}'),
            ],
          ),
          Spacer(),
          Text('32 min'),
          // Column(
          //   children: [
          //     Text(data.inDateInTimestamp.toString()),
          //     Text(data.outDateInTimestamp.toString()),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ParkUse {
  int index;
  String location;
  double price;
  int inDateInTimestamp;
  int outDateInTimestamp;

  ParkUse({
    required this.index,
    required this.location,
    required this.price,
    required this.inDateInTimestamp,
    required this.outDateInTimestamp,
  });
}