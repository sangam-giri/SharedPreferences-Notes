Shared Preferences

In this Flutter project we will be learning about the shared preferences. Shared preferences is used to store user data locally in the device
. Data like user setting, login credentials and more. It is recommended to use shared preferences for only the small amount of data
whereas for complex and huge data a Database is suggested.


Flutter provides us with a package - shared preferences

Run command: 
flutter pub add shared_preferences

or manually add - in dependencies

  shared_preferences: ^latest_version


  Note: Avoide colliding project name with the package's name that will throw error and will cause problems down the line