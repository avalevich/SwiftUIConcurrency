// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol SwiftUIConcurrency_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SwiftUIConcurrency.SchemaMetadata {}

protocol SwiftUIConcurrency_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SwiftUIConcurrency.SchemaMetadata {}

protocol SwiftUIConcurrency_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SwiftUIConcurrency.SchemaMetadata {}

protocol SwiftUIConcurrency_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SwiftUIConcurrency.SchemaMetadata {}

extension SwiftUIConcurrency {
  typealias ID = String

  typealias SelectionSet = SwiftUIConcurrency_SelectionSet

  typealias InlineFragment = SwiftUIConcurrency_InlineFragment

  typealias MutableSelectionSet = SwiftUIConcurrency_MutableSelectionSet

  typealias MutableInlineFragment = SwiftUIConcurrency_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return SwiftUIConcurrency.Objects.Query
      case "CourseCollection": return SwiftUIConcurrency.Objects.CourseCollection
      case "Course": return SwiftUIConcurrency.Objects.Course
      case "Section": return SwiftUIConcurrency.Objects.Section
      case "Sys": return SwiftUIConcurrency.Objects.Sys
      case "Asset": return SwiftUIConcurrency.Objects.Asset
      case "CourseSectionCollection": return SwiftUIConcurrency.Objects.CourseSectionCollection
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}