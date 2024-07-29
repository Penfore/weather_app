# Weather App

## Objective

An Android app to visualize the weather conditions of 4 major cities where a rock band is touring. The app displays a card for each city with current temperature and weather condition and also the forecast for the next 5 days.
The app also works offline, but a first successful connection is needed.
I kept the app as a weather app in case of future functionalities that turn it into a more generic weather application, so it is useful despite the band's tour.

## Technologies Used

- Flutter 3.22.3

### Requirements

- [Flutter SDK 3.22.3](https://docs.flutter.dev/get-started/install)
- [OpenWeather API account](https://openweathermap.org/api)
  - You will need to register an account, fill the billing information and create or use the API Key.
  - The reason for the need to fill the billing is because the app uses One Call API 3.0. You can use 1000 calls for free.
  - It takes some time for the key to work after it is first registered. In case of unexpected 401, that's the reason.

### Steps to tun
- Clone the repository and enter the folder with your terminal;
- If you are using [VSCode](https://code.visualstudio.com/), create a `.vscode` in the root of the application folder;
- Inside the `.vscode` folder, create a `launch.json` file and fill with this information:
  - `{
   "configurations": [
        {
            "name": "Weather App Production",
            "request": "launch",
            "type": "dart",
            "toolArgs": [
                "--dart-define",
                "API_KEY={YOUR-API-KEY}"
            ],
        },
    ]
}`
  - Change `{YOUR-API-KEY}` for the key you got in the [OpeanWeather keys section](https://home.openweathermap.org/api_keys);
- Run `Flutter pub get` to install the dependencies;
- Run `dart run build_runner build` to generate the models;
- Press F5 if using VSCode.
  - NOTICE: If you are not using VSCode, do not forget to use the `--dart-define` variable passing you key to the `API_KEY` variable, otherwise the app will not work.

### Enjoy :D

## License

Software licensed under the [MIT license](https://opensource.org/licenses/MIT).
