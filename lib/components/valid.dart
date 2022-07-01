import 'package:yemen_gallary/constant/message.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputMax $max";
  }
  if (val.isEmpty) {
    return messageInputEmpty;
  }
  if (val.length < min) {
    return "$messageInputMin $min";
  }
}
