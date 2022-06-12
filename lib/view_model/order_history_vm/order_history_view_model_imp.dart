




import '../../firebase/order_reference.dart';
import '../../model/order_model.dart';
import 'order_history_view_model.dart';

class OrderHisToryViewModelImp implements OrderHistoryViewModel{
  @override
  Future<List<OrderModel>> getUserHistory(String restaurantId,String statusMode) {
    return getUserOrdersByRestaurant(restaurantId,statusMode);
  }
  
}