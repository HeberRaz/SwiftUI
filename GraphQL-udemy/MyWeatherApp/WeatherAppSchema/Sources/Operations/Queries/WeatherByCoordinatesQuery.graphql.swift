// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WeatherByCoordinatesQuery: GraphQLQuery {
  public static let operationName: String = "WeatherByCoordinates"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query WeatherByCoordinates($latitude: Float!, $longitude: Float!) {
        weather(
          apiKey: "jpiHqwtdg1sh6SNvmdVHqrC3uk1kBzmW"
          lat: $latitude
          lon: $longitude
          source: tomorrow_io
          units: si
          windSpeed: kmh
        ) {
          __typename
          currently {
            __typename
            temperature
            apparentTemperature
            icon
            windSpeed
          }
          daily {
            __typename
            data {
              __typename
              temperatureMax
              temperatureMin
              time
              sunriseTime
              sunsetTime
            }
          }
          timezone
        }
      }
      """#
    ))

  public var latitude: Double
  public var longitude: Double

  public init(
    latitude: Double,
    longitude: Double
  ) {
    self.latitude = latitude
    self.longitude = longitude
  }

  public var __variables: Variables? { [
    "latitude": latitude,
    "longitude": longitude
  ] }

  public struct Data: WeatherAppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { WeatherAppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("weather", Weather?.self, arguments: [
        "apiKey": "jpiHqwtdg1sh6SNvmdVHqrC3uk1kBzmW",
        "lat": .variable("latitude"),
        "lon": .variable("longitude"),
        "source": "tomorrow_io",
        "units": "si",
        "windSpeed": "kmh"
      ]),
    ] }

    public var weather: Weather? { __data["weather"] }

    /// Weather
    ///
    /// Parent Type: `Weather`
    public struct Weather: WeatherAppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { WeatherAppSchema.Objects.Weather }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("currently", Currently?.self),
        .field("daily", Daily?.self),
        .field("timezone", String?.self),
      ] }

      public var currently: Currently? { __data["currently"] }
      public var daily: Daily? { __data["daily"] }
      public var timezone: String? { __data["timezone"] }

      /// Weather.Currently
      ///
      /// Parent Type: `Currently`
      public struct Currently: WeatherAppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { WeatherAppSchema.Objects.Currently }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("temperature", Double?.self),
          .field("apparentTemperature", Double?.self),
          .field("icon", String?.self),
          .field("windSpeed", Double?.self),
        ] }

        public var temperature: Double? { __data["temperature"] }
        public var apparentTemperature: Double? { __data["apparentTemperature"] }
        public var icon: String? { __data["icon"] }
        public var windSpeed: Double? { __data["windSpeed"] }
      }

      /// Weather.Daily
      ///
      /// Parent Type: `Daily`
      public struct Daily: WeatherAppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { WeatherAppSchema.Objects.Daily }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("data", [Datum]?.self),
        ] }

        public var data: [Datum]? { __data["data"] }

        /// Weather.Daily.Datum
        ///
        /// Parent Type: `Day`
        public struct Datum: WeatherAppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { WeatherAppSchema.Objects.Day }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("temperatureMax", Double?.self),
            .field("temperatureMin", Double?.self),
            .field("time", Int?.self),
            .field("sunriseTime", Int?.self),
            .field("sunsetTime", Int?.self),
          ] }

          public var temperatureMax: Double? { __data["temperatureMax"] }
          public var temperatureMin: Double? { __data["temperatureMin"] }
          public var time: Int? { __data["time"] }
          public var sunriseTime: Int? { __data["sunriseTime"] }
          public var sunsetTime: Int? { __data["sunsetTime"] }
        }
      }
    }
  }
}
