# Image Gallery From Url

Mobile application made with Flutter <3
Upload images when an url, You must have internet connection for download and save in the device.

Show your image data even if you dont have internet connection.

# Preview

Youtube Video.

[![Video](https://i.ytimg.com/vi/p9IXjdVhyis/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLBhoEQ2uGgzZO6nbR9o_XuOwFHmYg)](https://www.youtube.com/watch?v=p9IXjdVhyis)



# About project
- Clean architecture
- State management Bloc
- Dependency injection with GetIt
- Android and iOS
- Folder structure
    - Feature name
        - UI
            - Page
            - Widgets
            - Bloc
            - Utils
        - Domain
            - Entities
            - Failures
            - Repositories
        - Data
            - Repositories


# Features

### Login:
 - Login with email and password
    - email: `freyien@me.com`
    - password: `123456`
 - Validate text inputs
    - email format
    - password not empty
 - Error toast when credentials are not valid
 - Save session for next time you open the app

 ### Home:
 - Tabs
    - Upload
    - Gallery

 ### Upload:
 - Input search validations
    - url starts with:
        - https
        - http
        - www
    - Disable when 5 images are loaded
    - Enable when 4 or less images are loaded

- Upload button validations
    - Disable when 5 images are loaded
    - Enable when 4 or less images are loaded
    - Error toast when no internet connection
    - Error toast when url not contains an image
    - Error toast when occurs an unexpected error

- Image preview list
    - Delete image
        - Show alert to confirm
    - Tap for view complete image
    - Alignment center

- Get image data from local database
    - You can see content with out internet when you previously update images
        - NOTE: For upload images you must have internet connection
- Save images in device
- Save record in local database

### Gallery:
- Show the uploaded images
- If images length is Odd the first image take 2 spaces

# Pending Features

### Log out:


# Used packages
- Dependencies
    - [flutter_bloc](https://pub.dev/packages/flutter_bloc)
    - [formz](https://pub.dev/packages/formz)
    - [dartz](https://pub.dev/packages/dartz)
    - [get_it](https://pub.dev/packages/get_it)
    - [dio](https://pub.dev/packages/dio)
    - [bot_toast](https://pub.dev/packages/bot_toast)
    - [loader_overlay](https://pub.dev/packages/loader_overlay)
    - [lottie](https://pub.dev/packages/lottie)
    - [connectivity_plus](https://pub.dev/packages/connectivity_plus)
    - [sqflite](https://pub.dev/packages/sqflite)
    - [path](https://pub.dev/packages/path)
    - [uuid](https://pub.dev/packages/uuid)
    - [path_provider](https://pub.dev/packages/path_provider)
    - [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)


# To build and run this project:

1. Get Flutter [here](https://flutter.dev) if you don't already have it
2. Clone this repository.
3. `cd` into the repo folder.
4. run `flutter run`

NOTE: This project was built with Flutter version 3.3.2 and Dart version 2.18.1

# To run tests (Unit and Widget)
1. Sorry, time did not reach me


# Extra
Do you wanna know more about the project? Call me or send me a message :) 