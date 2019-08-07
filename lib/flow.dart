import 'package:flutter/material.dart';
import 'Custepper.dart';
class flow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('111'),
      ),
      body:CustomStepper2(
        currentStep: 2,
        type: CustomStepperType2.vertical,
        steps: ['提交任务', '本金返款', '评价返佣金', '追评返佣金', '任务完结','任务完结']
            .map(
              (s) => CustomStep2(title: Text(s), content: Container(), isActive: true),
        )
            .toList(),
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Container();
        },
      ),
    );
  }
}
