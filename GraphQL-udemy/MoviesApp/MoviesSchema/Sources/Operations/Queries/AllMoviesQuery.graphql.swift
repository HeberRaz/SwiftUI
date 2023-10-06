// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AllMoviesQuery: GraphQLQuery {
  public static let operationName: String = "AllMovies"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AllMovies($genre: String = null) { movies(filter: {genre: $genre}) { __typename id title year genre poster } }"#
    ))

  public var genre: GraphQLNullable<String>

  public init(genre: GraphQLNullable<String> = .null) {
    self.genre = genre
  }

  public var __variables: Variables? { ["genre": genre] }

  public struct Data: MoviesSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("movies", [Movie?]?.self, arguments: ["filter": ["genre": .variable("genre")]]),
    ] }

    public var movies: [Movie?]? { __data["movies"] }

    /// Movie
    ///
    /// Parent Type: `Movie`
    public struct Movie: MoviesSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Movie }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", MoviesSchema.ID.self),
        .field("title", String.self),
        .field("year", String.self),
        .field("genre", String.self),
        .field("poster", String.self),
      ] }

      public var id: MoviesSchema.ID { __data["id"] }
      public var title: String { __data["title"] }
      public var year: String { __data["year"] }
      public var genre: String { __data["genre"] }
      public var poster: String { __data["poster"] }
    }
  }
}
