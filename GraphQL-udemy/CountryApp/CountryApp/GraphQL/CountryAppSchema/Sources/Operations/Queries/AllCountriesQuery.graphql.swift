// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AllCountriesQuery: GraphQLQuery {
  public static let operationName: String = "AllCountries"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query AllCountries {
        countries {
          __typename
          code
          name
          capital
          emoji
        }
      }
      """#
    ))

  public init() {}

  public struct Data: CountryAppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountryAppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("countries", [Country].self),
    ] }

    public var countries: [Country] { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountryAppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountryAppSchema.Objects.Country }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("code", CountryAppSchema.ID.self),
        .field("name", String.self),
        .field("capital", String?.self),
        .field("emoji", String.self),
      ] }

      public var code: CountryAppSchema.ID { __data["code"] }
      public var name: String { __data["name"] }
      public var capital: String? { __data["capital"] }
      public var emoji: String { __data["emoji"] }
    }
  }
}
