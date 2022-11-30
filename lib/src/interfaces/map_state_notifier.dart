import 'package:independent_map/src/interfaces/map_state_subscriber.dart';

abstract class MapStateNotifier {
  void subscribe(MapStateSubscriber mapStateSubscriber);

  void unsubscribe(MapStateSubscriber mapStateSubscriber);

  void notifySubscribers();
}
