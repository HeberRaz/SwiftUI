// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WeatherByCoordinatesQuery: GraphQLQuery {
  public static let operationName: String = "WeatherByCoordinates"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query WeatherByCoordinates {
        weather(
          apiKey: "jpiHqwtdg1sh6SNvmdVHqrC3uk1kBzmW"
          lat: 41.87
          lon: -87.62
          source: mock
          units: us
          windSpeed: kn
        ) {
          __typename
          currently {
            __typename
            temperature
            windSpeed
          }
          daily {
            __typename
            data {
              __typename
              temperatureMax
              temperatureMin
            }
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: MyWeatherAppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MyWeatherAppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("weather", Weather?.self, arguments: [
        "apiKey": "jpiHqwtdg1sh6SNvmdVHqrC3uk1kBzmW",
        "lat": 41.87,
        "lon": -87.62,
        "source": "mock",
        "units": "us",
        "windSpeed": "kn"
      ]),
    ] }

    public var weather: Weather? { __data["weather"] }

    /// Weather
    ///
    /// Parent Type: `Weather`
    public struct Weather: MyWeatherAppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MyWeatherAppSchema.Objects.Weather }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("currently", Currently?.self),
        .field("daily", Daily?.self),
      ] }

      public var currently: Currently? { __data["currently"] }
      public var daily: Daily? { __data["daily"] }

      /// Weather.Currently
      ///
      /// Parent Type: `Currently`
      public struct Currently: MyWeatherAppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { MyWeatherAppSchema.Objects.Currently }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("temperature", Double?.self),
          .field("windSpeed", Double?.self),
        ] }

        public var temperature: Double? { __data["temperature"] }
        public var windSpeed: Double? { __data["windSpeed"] }
      }

      /// Weather.Daily
      ///
      /// Parent Type: `Daily`
      public struct Daily: MyWeatherAppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { MyWeatherAppSchema.Objects.Daily }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("data", [Datum]?.self),
        ] }

        public var data: [Datum]? { __data["data"] }

        /// Weather.Daily.Datum
        ///
        /// Parent Type: `Day`
        public struct Datum: MyWeatherAppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { MyWeatherAppSchema.Objects.Day }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("temperatureMax", Double?.self),
            .field("temperatureMin", Double?.self),
          ] }

          public var temperatureMax: Double? { __data["temperatureMax"] }
          public var temperatureMin: Double? { __data["temperatureMin"] }
        }
      }
    }
  }
}
