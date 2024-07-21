// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SwiftUIConcurrency {
  class SectionQuery: GraphQLQuery {
    static let operationName: String = "Section"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Section { sectionCollection { __typename sections: items { __typename sys { __typename id } title } } }"#
      ))

    public init() {}

    struct Data: SwiftUIConcurrency.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("sectionCollection", SectionCollection?.self),
      ] }

      var sectionCollection: SectionCollection? { __data["sectionCollection"] }

      /// SectionCollection
      ///
      /// Parent Type: `SectionCollection`
      struct SectionCollection: SwiftUIConcurrency.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.SectionCollection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("items", alias: "sections", [Section?].self),
        ] }

        var sections: [Section?] { __data["sections"] }

        /// SectionCollection.Section
        ///
        /// Parent Type: `Section`
        struct Section: SwiftUIConcurrency.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Section }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("sys", Sys.self),
            .field("title", String?.self),
          ] }

          var sys: Sys { __data["sys"] }
          var title: String? { __data["title"] }

          /// SectionCollection.Section.Sys
          ///
          /// Parent Type: `Sys`
          struct Sys: SwiftUIConcurrency.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Sys }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", String.self),
            ] }

            var id: String { __data["id"] }
          }
        }
      }
    }
  }

}