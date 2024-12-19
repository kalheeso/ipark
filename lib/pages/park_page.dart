import 'package:flutter/material.dart';

class ParkPage extends StatefulWidget {
  const ParkPage({super.key});

  @override
  State<ParkPage> createState() => _ParkPageState();
}

class _ParkPageState extends State<ParkPage> {

  bool isParked = false;

  @override
  void initState() {
    // _controller.getVehicleStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Visibility(
        visible: isParked,
        replacement: NotParkedRightNowWidget(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/mini_image.png',
              alignment: Alignment.center,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Placa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("BRA2020", style: TextStyle(fontSize: 14)),
              ],
            ),
            Divider(color: Colors.white.withOpacity(0.6), height: 32,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Estacionamento", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("Flamboyant Shopping", style: TextStyle(fontSize: 14)),
              ],
            ),
            Divider(color: Colors.white.withOpacity(0.6), height: 32,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Valor atual", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("R\$16,00", style: TextStyle(fontSize: 14)),
              ],
            ),
            Divider(color: Colors.white.withOpacity(0.6), height: 32,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sesssão", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("G", style: TextStyle(fontSize: 14)),
              ],
            ),
            Divider(color: Colors.white.withOpacity(0.6), height: 32,),
          ],
        ),
      ),
    );
  }
}

class NotParkedRightNowWidget extends StatelessWidget {
  const NotParkedRightNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/park_image.png', width: 300,),
        SizedBox(height: 16,),
        Text('Entre em algum de nossos estacionamentos para acompanhar os detalhes sobre seu uso.', style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
      ],
    );
  }
}