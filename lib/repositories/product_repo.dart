import 'package:shopping_app/util/typedef/type_def.dart';

import '../network/api_service/api_service.dart';
import '../util/app_url/app_url.dart';

class ProductRepo {
  EitherResponse getProducts() async =>
      await Api.getApi(Urls.baseUrl + Urls.getProduct);
}
