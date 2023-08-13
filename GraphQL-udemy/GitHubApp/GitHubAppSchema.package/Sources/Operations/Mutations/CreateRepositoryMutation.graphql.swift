// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateRepositoryMutation: GraphQLMutation {
  public static let operationName: String = "CreateRepository"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation CreateRepository($name: String!, $description: String, $visibility: RepositoryVisibility!, $clientMutationId: String!) {
        createRepository(
          input: {name: $name, visibility: $visibility, description: $description, clientMutationId: $clientMutationId}
        ) {
          __typename
          clientMutationId
        }
      }
      """#
    ))

  public var name: String
  public var description: GraphQLNullable<String>
  public var visibility: GraphQLEnum<RepositoryVisibility>
  public var clientMutationId: String

  public init(
    name: String,
    description: GraphQLNullable<String>,
    visibility: GraphQLEnum<RepositoryVisibility>,
    clientMutationId: String
  ) {
    self.name = name
    self.description = description
    self.visibility = visibility
    self.clientMutationId = clientMutationId
  }

  public var __variables: Variables? { [
    "name": name,
    "description": description,
    "visibility": visibility,
    "clientMutationId": clientMutationId
  ] }

  public struct Data: GitHubAppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createRepository", CreateRepository?.self, arguments: ["input": [
        "name": .variable("name"),
        "visibility": .variable("visibility"),
        "description": .variable("description"),
        "clientMutationId": .variable("clientMutationId")
      ]]),
    ] }

    /// Create a new repository.
    public var createRepository: CreateRepository? { __data["createRepository"] }

    /// CreateRepository
    ///
    /// Parent Type: `CreateRepositoryPayload`
    public struct CreateRepository: GitHubAppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubAppSchema.Objects.CreateRepositoryPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("clientMutationId", String?.self),
      ] }

      /// A unique identifier for the client performing the mutation.
      public var clientMutationId: String? { __data["clientMutationId"] }
    }
  }
}
