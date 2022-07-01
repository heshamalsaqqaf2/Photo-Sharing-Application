import 'package:yemen_gallary/errors/servers/app_exception.dart';
import 'package:yemen_gallary/errors/helper/dialog_helper.dart';

class BaseController  {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(descriptionException: message!);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(descriptionException: message!);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          descriptionException: 'Oops! It Took Longer To Response');
    }
  }
}
