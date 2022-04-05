import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskaia/model/memory.dart';

class MemoriesController extends GetxController {
  RxInt stepIndex = 0.obs;

  void onNextStep() {
    stepIndex++;
  }

  void onPreviousStep() {
    stepIndex--;
  }

  void onSelectStep(int value) {
    stepIndex.value = value;
  }

  List<Memory> memories = [
    Memory(
      id: 1,
      title: 'Step 1',
      memory:
          'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
      dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
    ),
    Memory(
      id: 2,
      title: 'Step 2',
      memory:
          'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
      dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
    ),
    Memory(
      id: 3,
      title: 'Step 3',
      memory:
          'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
      dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
    ),
    Memory(
      id: 4,
      title: 'Step 4',
      memory:
          'MediaQuery. I am a noob, so would really like to understand. Otherwise, MediaQuery. I am a noob, so would really like to understand. Otherwise,',
      dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
    ),
    Memory(
      id: 5,
      title: 'Step 5',
      memory:
          'MediaQuery. I am a noob, so would really like to understand. Otherwise, MediaQuery. I am a noob, so would really like to understand. Otherwise,MediaQuery. I am a noob, so would really like to understand. Otherwise,',
      dateTime: DateFormat.yMEd().format(DateTime.now()).toString(),
    ),
  ];
}
