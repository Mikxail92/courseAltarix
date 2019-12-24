




struct WeatherForecastModel: Codable {
    let weather: [WeatherModel]
    let main: MainWeatherModel
    let wind: WindWeatherModel
    let id: Int
    let name: String
    let sys: CountryWeatherModel
}












