// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alert": MessageLookupByLibrary.simpleMessage("Alert!"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "cancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "comments": MessageLookupByLibrary.simpleMessage("Comments"),
        "confirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete all posts?"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "loadApi": MessageLookupByLibrary.simpleMessage(
            "Press the button to load the data"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noFavoritePosts":
            MessageLookupByLibrary.simpleMessage("No favorite posts"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "post": MessageLookupByLibrary.simpleMessage("Post"),
        "posts": MessageLookupByLibrary.simpleMessage("Posts"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "website": MessageLookupByLibrary.simpleMessage("Website")
      };
}
