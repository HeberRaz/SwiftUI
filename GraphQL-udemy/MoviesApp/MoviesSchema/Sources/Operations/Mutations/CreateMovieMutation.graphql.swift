// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateMovieMutation: GraphQLMutation {
  public static let operationName: String = "CreateMovie"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateMovie($movie: MovieInput) { addMovie(movie: $movie) { __typename id } }"#
    ))

  public var movie: GraphQLNullable<MovieInput>

  public init(movie: GraphQLNullable<MovieInput>) {
    self.movie = movie
  }

  public var __variables: Variables? { ["movie": movie] }

  public struct Data: MoviesSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addMovie", AddMovie?.self, arguments: ["movie": .variable("movie")]),
    ] }

    public var addMovie: AddMovie? { __data["addMovie"] }

    /// AddMovie
    ///
    /// Parent Type: `Movie`
    public struct AddMovie: MoviesSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MoviesSchema.Objects.Movie }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", MoviesSchema.ID.self),
      ] }

      public var id: MoviesSchema.ID { __data["id"] }
    }
  }
}
