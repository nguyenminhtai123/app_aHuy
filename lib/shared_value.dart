// This global SharedValue can be shared across the entire app
import 'package:shared_value/shared_value.dart';

final SharedValue<String> name_player = SharedValue(
  value: "", // initial value
  key: "name_player", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<String> phone_player = SharedValue(
  value: "", // initial value
  key: "phone_player", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<List> history_score = SharedValue(
  value: [], // initial value
  key: "history_score", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
