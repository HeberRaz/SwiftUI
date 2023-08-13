// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubAppSchema.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubAppSchema.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubAppSchema.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubAppSchema.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GitHubAppSchema.Objects.Query
    case "User": return GitHubAppSchema.Objects.User
    case "Bot": return GitHubAppSchema.Objects.Bot
    case "AddedToMergeQueueEvent": return GitHubAppSchema.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GitHubAppSchema.Objects.AddedToProjectEvent
    case "App": return GitHubAppSchema.Objects.App
    case "AssignedEvent": return GitHubAppSchema.Objects.AssignedEvent
    case "AutoMergeDisabledEvent": return GitHubAppSchema.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GitHubAppSchema.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GitHubAppSchema.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GitHubAppSchema.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GitHubAppSchema.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GitHubAppSchema.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GitHubAppSchema.Objects.BaseRefChangedEvent
    case "BaseRefDeletedEvent": return GitHubAppSchema.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GitHubAppSchema.Objects.BaseRefForcePushedEvent
    case "Blob": return GitHubAppSchema.Objects.Blob
    case "Commit": return GitHubAppSchema.Objects.Commit
    case "Discussion": return GitHubAppSchema.Objects.Discussion
    case "Issue": return GitHubAppSchema.Objects.Issue
    case "PullRequest": return GitHubAppSchema.Objects.PullRequest
    case "CommitComment": return GitHubAppSchema.Objects.CommitComment
    case "DiscussionComment": return GitHubAppSchema.Objects.DiscussionComment
    case "GistComment": return GitHubAppSchema.Objects.GistComment
    case "IssueComment": return GitHubAppSchema.Objects.IssueComment
    case "PullRequestReview": return GitHubAppSchema.Objects.PullRequestReview
    case "CommitCommentThread": return GitHubAppSchema.Objects.CommitCommentThread
    case "DependabotUpdate": return GitHubAppSchema.Objects.DependabotUpdate
    case "DiscussionCategory": return GitHubAppSchema.Objects.DiscussionCategory
    case "PinnedDiscussion": return GitHubAppSchema.Objects.PinnedDiscussion
    case "PullRequestCommitCommentThread": return GitHubAppSchema.Objects.PullRequestCommitCommentThread
    case "PullRequestReviewComment": return GitHubAppSchema.Objects.PullRequestReviewComment
    case "TeamDiscussion": return GitHubAppSchema.Objects.TeamDiscussion
    case "CheckRun": return GitHubAppSchema.Objects.CheckRun
    case "StatusContext": return GitHubAppSchema.Objects.StatusContext
    case "ClosedEvent": return GitHubAppSchema.Objects.ClosedEvent
    case "ConvertToDraftEvent": return GitHubAppSchema.Objects.ConvertToDraftEvent
    case "CrossReferencedEvent": return GitHubAppSchema.Objects.CrossReferencedEvent
    case "Gist": return GitHubAppSchema.Objects.Gist
    case "Repository": return GitHubAppSchema.Objects.Repository
    case "Organization": return GitHubAppSchema.Objects.Organization
    case "Enterprise": return GitHubAppSchema.Objects.Enterprise
    case "Team": return GitHubAppSchema.Objects.Team
    case "Topic": return GitHubAppSchema.Objects.Topic
    case "Mannequin": return GitHubAppSchema.Objects.Mannequin
    case "MergedEvent": return GitHubAppSchema.Objects.MergedEvent
    case "Milestone": return GitHubAppSchema.Objects.Milestone
    case "PullRequestCommit": return GitHubAppSchema.Objects.PullRequestCommit
    case "ReadyForReviewEvent": return GitHubAppSchema.Objects.ReadyForReviewEvent
    case "Release": return GitHubAppSchema.Objects.Release
    case "RepositoryTopic": return GitHubAppSchema.Objects.RepositoryTopic
    case "ReviewDismissedEvent": return GitHubAppSchema.Objects.ReviewDismissedEvent
    case "TeamDiscussionComment": return GitHubAppSchema.Objects.TeamDiscussionComment
    case "Workflow": return GitHubAppSchema.Objects.Workflow
    case "WorkflowRun": return GitHubAppSchema.Objects.WorkflowRun
    case "WorkflowRunFile": return GitHubAppSchema.Objects.WorkflowRunFile
    case "RepositoryVulnerabilityAlert": return GitHubAppSchema.Objects.RepositoryVulnerabilityAlert
    case "Project": return GitHubAppSchema.Objects.Project
    case "ProjectV2": return GitHubAppSchema.Objects.ProjectV2
    case "Tag": return GitHubAppSchema.Objects.Tag
    case "Tree": return GitHubAppSchema.Objects.Tree
    case "BranchProtectionRule": return GitHubAppSchema.Objects.BranchProtectionRule
    case "BypassForcePushAllowance": return GitHubAppSchema.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GitHubAppSchema.Objects.BypassPullRequestAllowance
    case "CWE": return GitHubAppSchema.Objects.CWE
    case "CheckSuite": return GitHubAppSchema.Objects.CheckSuite
    case "CodeOfConduct": return GitHubAppSchema.Objects.CodeOfConduct
    case "CommentDeletedEvent": return GitHubAppSchema.Objects.CommentDeletedEvent
    case "Comparison": return GitHubAppSchema.Objects.Comparison
    case "ConnectedEvent": return GitHubAppSchema.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GitHubAppSchema.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GitHubAppSchema.Objects.ConvertedToDiscussionEvent
    case "DemilestonedEvent": return GitHubAppSchema.Objects.DemilestonedEvent
    case "DependencyGraphManifest": return GitHubAppSchema.Objects.DependencyGraphManifest
    case "DeployKey": return GitHubAppSchema.Objects.DeployKey
    case "DeployedEvent": return GitHubAppSchema.Objects.DeployedEvent
    case "Deployment": return GitHubAppSchema.Objects.Deployment
    case "DeploymentEnvironmentChangedEvent": return GitHubAppSchema.Objects.DeploymentEnvironmentChangedEvent
    case "DeploymentReview": return GitHubAppSchema.Objects.DeploymentReview
    case "DeploymentStatus": return GitHubAppSchema.Objects.DeploymentStatus
    case "DisconnectedEvent": return GitHubAppSchema.Objects.DisconnectedEvent
    case "DiscussionPoll": return GitHubAppSchema.Objects.DiscussionPoll
    case "DiscussionPollOption": return GitHubAppSchema.Objects.DiscussionPollOption
    case "DraftIssue": return GitHubAppSchema.Objects.DraftIssue
    case "EnterpriseAdministratorInvitation": return GitHubAppSchema.Objects.EnterpriseAdministratorInvitation
    case "EnterpriseIdentityProvider": return GitHubAppSchema.Objects.EnterpriseIdentityProvider
    case "EnterpriseRepositoryInfo": return GitHubAppSchema.Objects.EnterpriseRepositoryInfo
    case "EnterpriseServerInstallation": return GitHubAppSchema.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GitHubAppSchema.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GitHubAppSchema.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GitHubAppSchema.Objects.EnterpriseServerUserAccountsUpload
    case "EnterpriseUserAccount": return GitHubAppSchema.Objects.EnterpriseUserAccount
    case "Environment": return GitHubAppSchema.Objects.Environment
    case "ExternalIdentity": return GitHubAppSchema.Objects.ExternalIdentity
    case "HeadRefDeletedEvent": return GitHubAppSchema.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GitHubAppSchema.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GitHubAppSchema.Objects.HeadRefRestoredEvent
    case "IpAllowListEntry": return GitHubAppSchema.Objects.IpAllowListEntry
    case "Label": return GitHubAppSchema.Objects.Label
    case "LabeledEvent": return GitHubAppSchema.Objects.LabeledEvent
    case "Language": return GitHubAppSchema.Objects.Language
    case "License": return GitHubAppSchema.Objects.License
    case "LinkedBranch": return GitHubAppSchema.Objects.LinkedBranch
    case "LockedEvent": return GitHubAppSchema.Objects.LockedEvent
    case "MarkedAsDuplicateEvent": return GitHubAppSchema.Objects.MarkedAsDuplicateEvent
    case "MarketplaceCategory": return GitHubAppSchema.Objects.MarketplaceCategory
    case "MarketplaceListing": return GitHubAppSchema.Objects.MarketplaceListing
    case "MembersCanDeleteReposClearAuditEntry": return GitHubAppSchema.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GitHubAppSchema.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GitHubAppSchema.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GitHubAppSchema.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GitHubAppSchema.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessBlockedAuditEntry": return GitHubAppSchema.Objects.OrgOauthAppAccessBlockedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GitHubAppSchema.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GitHubAppSchema.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgOauthAppAccessUnblockedAuditEntry": return GitHubAppSchema.Objects.OrgOauthAppAccessUnblockedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GitHubAppSchema.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GitHubAppSchema.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GitHubAppSchema.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubAppSchema.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubAppSchema.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GitHubAppSchema.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubAppSchema.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GitHubAppSchema.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubAppSchema.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubAppSchema.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GitHubAppSchema.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubAppSchema.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GitHubAppSchema.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GitHubAppSchema.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GitHubAppSchema.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GitHubAppSchema.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubAppSchema.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GitHubAppSchema.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubAppSchema.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GitHubAppSchema.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubAppSchema.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GitHubAppSchema.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubAppSchema.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubAppSchema.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GitHubAppSchema.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubAppSchema.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GitHubAppSchema.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GitHubAppSchema.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GitHubAppSchema.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GitHubAppSchema.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GitHubAppSchema.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GitHubAppSchema.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GitHubAppSchema.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubAppSchema.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubAppSchema.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubAppSchema.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubAppSchema.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubAppSchema.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubAppSchema.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubAppSchema.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubAppSchema.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubAppSchema.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubAppSchema.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GitHubAppSchema.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GitHubAppSchema.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GitHubAppSchema.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GitHubAppSchema.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubAppSchema.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GitHubAppSchema.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GitHubAppSchema.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GitHubAppSchema.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GitHubAppSchema.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubAppSchema.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubAppSchema.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "MentionedEvent": return GitHubAppSchema.Objects.MentionedEvent
    case "MergeQueue": return GitHubAppSchema.Objects.MergeQueue
    case "MergeQueueEntry": return GitHubAppSchema.Objects.MergeQueueEntry
    case "MigrationSource": return GitHubAppSchema.Objects.MigrationSource
    case "MilestonedEvent": return GitHubAppSchema.Objects.MilestonedEvent
    case "MovedColumnsInProjectEvent": return GitHubAppSchema.Objects.MovedColumnsInProjectEvent
    case "OIDCProvider": return GitHubAppSchema.Objects.OIDCProvider
    case "OrganizationIdentityProvider": return GitHubAppSchema.Objects.OrganizationIdentityProvider
    case "OrganizationInvitation": return GitHubAppSchema.Objects.OrganizationInvitation
    case "OrganizationMigration": return GitHubAppSchema.Objects.OrganizationMigration
    case "Package": return GitHubAppSchema.Objects.Package
    case "PackageFile": return GitHubAppSchema.Objects.PackageFile
    case "PackageTag": return GitHubAppSchema.Objects.PackageTag
    case "PackageVersion": return GitHubAppSchema.Objects.PackageVersion
    case "PinnedEvent": return GitHubAppSchema.Objects.PinnedEvent
    case "PinnedIssue": return GitHubAppSchema.Objects.PinnedIssue
    case "ProjectCard": return GitHubAppSchema.Objects.ProjectCard
    case "ProjectColumn": return GitHubAppSchema.Objects.ProjectColumn
    case "ProjectV2Field": return GitHubAppSchema.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GitHubAppSchema.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GitHubAppSchema.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GitHubAppSchema.Objects.ProjectV2Item
    case "ProjectV2ItemFieldDateValue": return GitHubAppSchema.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GitHubAppSchema.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GitHubAppSchema.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GitHubAppSchema.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GitHubAppSchema.Objects.ProjectV2ItemFieldTextValue
    case "ProjectV2View": return GitHubAppSchema.Objects.ProjectV2View
    case "ProjectV2Workflow": return GitHubAppSchema.Objects.ProjectV2Workflow
    case "PublicKey": return GitHubAppSchema.Objects.PublicKey
    case "PullRequestReviewThread": return GitHubAppSchema.Objects.PullRequestReviewThread
    case "PullRequestThread": return GitHubAppSchema.Objects.PullRequestThread
    case "Push": return GitHubAppSchema.Objects.Push
    case "PushAllowance": return GitHubAppSchema.Objects.PushAllowance
    case "Reaction": return GitHubAppSchema.Objects.Reaction
    case "Ref": return GitHubAppSchema.Objects.Ref
    case "ReferencedEvent": return GitHubAppSchema.Objects.ReferencedEvent
    case "ReleaseAsset": return GitHubAppSchema.Objects.ReleaseAsset
    case "RemovedFromMergeQueueEvent": return GitHubAppSchema.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GitHubAppSchema.Objects.RemovedFromProjectEvent
    case "RenamedTitleEvent": return GitHubAppSchema.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GitHubAppSchema.Objects.ReopenedEvent
    case "RepositoryInvitation": return GitHubAppSchema.Objects.RepositoryInvitation
    case "RepositoryMigration": return GitHubAppSchema.Objects.RepositoryMigration
    case "RepositoryRule": return GitHubAppSchema.Objects.RepositoryRule
    case "RepositoryRuleset": return GitHubAppSchema.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GitHubAppSchema.Objects.RepositoryRulesetBypassActor
    case "ReviewDismissalAllowance": return GitHubAppSchema.Objects.ReviewDismissalAllowance
    case "ReviewRequest": return GitHubAppSchema.Objects.ReviewRequest
    case "ReviewRequestRemovedEvent": return GitHubAppSchema.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GitHubAppSchema.Objects.ReviewRequestedEvent
    case "SavedReply": return GitHubAppSchema.Objects.SavedReply
    case "SecurityAdvisory": return GitHubAppSchema.Objects.SecurityAdvisory
    case "SponsorsActivity": return GitHubAppSchema.Objects.SponsorsActivity
    case "SponsorsListing": return GitHubAppSchema.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GitHubAppSchema.Objects.SponsorsListingFeaturedItem
    case "SponsorsTier": return GitHubAppSchema.Objects.SponsorsTier
    case "Sponsorship": return GitHubAppSchema.Objects.Sponsorship
    case "SponsorshipNewsletter": return GitHubAppSchema.Objects.SponsorshipNewsletter
    case "Status": return GitHubAppSchema.Objects.Status
    case "StatusCheckRollup": return GitHubAppSchema.Objects.StatusCheckRollup
    case "SubscribedEvent": return GitHubAppSchema.Objects.SubscribedEvent
    case "TransferredEvent": return GitHubAppSchema.Objects.TransferredEvent
    case "UnassignedEvent": return GitHubAppSchema.Objects.UnassignedEvent
    case "UnlabeledEvent": return GitHubAppSchema.Objects.UnlabeledEvent
    case "UnlockedEvent": return GitHubAppSchema.Objects.UnlockedEvent
    case "UnmarkedAsDuplicateEvent": return GitHubAppSchema.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GitHubAppSchema.Objects.UnpinnedEvent
    case "UnsubscribedEvent": return GitHubAppSchema.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GitHubAppSchema.Objects.UserBlockedEvent
    case "UserContentEdit": return GitHubAppSchema.Objects.UserContentEdit
    case "UserStatus": return GitHubAppSchema.Objects.UserStatus
    case "VerifiableDomain": return GitHubAppSchema.Objects.VerifiableDomain
    case "RepositoryConnection": return GitHubAppSchema.Objects.RepositoryConnection
    case "Mutation": return GitHubAppSchema.Objects.Mutation
    case "CreateRepositoryPayload": return GitHubAppSchema.Objects.CreateRepositoryPayload
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
