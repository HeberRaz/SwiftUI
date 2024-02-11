// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteMovieMutation: GraphQLMutation {
  public static let operationName: String = "DeleteMovie"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteMovie($movieToDelete: ID!) { deleteMovie(id: $movieToDelete) { __typename id title genre poster year } }"#
    ))

  public var movieToDelete: ID

  public init(movieToDelete: ID) {
    self.movieToDelete = movieToDelete
  }

  public var __variables: Variables? { ["movieToDelete": movieToDelete] }

  public struct Data: MoviesSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteMovie", DeleteMovie?.self, arguments: ["id": .variable("movieToDelete")]),
    ] }

    public var deleteMovie: DeleteMovie? { __data["deleteMovie"] }

    /// DeleteMovie
    ///
    /// Parent Type: `Movie`
    public struct DeleteMovie: MoviesSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Movie }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", MoviesSchema.ID.self),
        .field("title", String.self),
        .field("genre", String.self),
        .field("poster", String.self),
        .field("year", String.self),
      ] }

      public var id: MoviesSchema.ID { __data["id"] }
      public var title: String { __data["title"] }
      public var genre: String { __data["genre"] }
      public var poster: String { __data["poster"] }
      public var year: String { __data["year"] }
    }
  }
}
