// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class TopRepositoriesForUsernameQuery: GraphQLQuery {
  public static let operationName: String = "TopRepositoriesForUsername"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query TopRepositoriesForUsername($username: String!, $first: Int!) {
        user(login: $username) {
          __typename
          repositories(first: $first, orderBy: {field: STARGAZERS, direction: ASC}) {
            __typename
            nodes {
              __typename
              id
              name
              createdAt
              description
              url
              stargazerCount
            }
          }
        }
      }
      """#
    ))

  public var username: String
  public var first: Int

  public init(
    username: String,
    first: Int
  ) {
    self.username = username
    self.first = first
  }

  public var __variables: Variables? { [
    "username": username,
    "first": first
  ] }

  public struct Data: GitHubAppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("username")]),
    ] }

    /// Lookup a user by login.
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: GitHubAppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("repositories", Repositories.self, arguments: [
          "first": .variable("first"),
          "orderBy": [
            "field": "STARGAZERS",
            "direction": "ASC"
          ]
        ]),
      ] }

      /// A list of repositories that the user owns.
      public var repositories: Repositories { __data["repositories"] }

      /// User.Repositories
      ///
      /// Parent Type: `RepositoryConnection`
      public struct Repositories: GitHubAppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.RepositoryConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.Repositories.Node
        ///
        /// Parent Type: `Repository`
        public struct Node: GitHubAppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.Repository }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GitHubAppSchema.ID.self),
            .field("name", String.self),
            .field("createdAt", GitHubAppSchema.DateTime.self),
            .field("description", String?.self),
            .field("url", GitHubAppSchema.URI.self),
            .field("stargazerCount", Int.self),
          ] }

          public var id: GitHubAppSchema.ID { __data["id"] }
          /// The name of the repository.
          public var name: String { __data["name"] }
          /// Identifies the date and time when the object was created.
          public var createdAt: GitHubAppSchema.DateTime { __data["createdAt"] }
          /// The description of the repository.
          public var description: String? { __data["description"] }
          /// The HTTP URL for this repository
          public var url: GitHubAppSchema.URI { __data["url"] }
          /// Returns a count of how many stargazers there are on this object
          public var stargazerCount: Int { __data["stargazerCount"] }
        }
      }
    }
  }
}
