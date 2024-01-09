abstract class CurrentWeatherEvent {
  const CurrentWeatherEvent();
}

class AwaitCurrentWeather extends CurrentWeatherEvent {
  const AwaitCurrentWeather();
}

class GetCurrentWeather extends CurrentWeatherEvent {
  const GetCurrentWeather();
}
