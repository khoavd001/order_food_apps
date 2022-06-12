
import '../../firebase/restaurant_reference.dart';
import '../../model/restaurant_model.dart';
import 'main_view_model.dart';


class MainViewModelImp implements MainViewModel{
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
    return getRestaurantList();
  }

}