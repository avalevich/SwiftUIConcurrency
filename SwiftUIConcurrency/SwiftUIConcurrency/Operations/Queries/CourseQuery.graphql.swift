// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SwiftUIConcurrency {
  class CourseQuery: GraphQLQuery {
    static let operationName: String = "Course"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Course { courseCollection { __typename courses: items { __typename sys { __typename publishedAt id } title subtitle numberOfSections numberOfHours subject colors illustration { __typename url } sectionCollection { __typename sections: items { __typename sys { __typename id } title subtitle content } } } } }"#
      ))

    public init() {}

    struct Data: SwiftUIConcurrency.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("courseCollection", CourseCollection?.self),
      ] }

      var courseCollection: CourseCollection? { __data["courseCollection"] }

      /// CourseCollection
      ///
      /// Parent Type: `CourseCollection`
      struct CourseCollection: SwiftUIConcurrency.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.CourseCollection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("items", alias: "courses", [Course?].self),
        ] }

        var courses: [Course?] { __data["courses"] }

        /// CourseCollection.Course
        ///
        /// Parent Type: `Course`
        struct Course: SwiftUIConcurrency.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Course }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("sys", Sys.self),
            .field("title", String?.self),
            .field("subtitle", String?.self),
            .field("numberOfSections", Int?.self),
            .field("numberOfHours", Int?.self),
            .field("subject", String?.self),
            .field("colors", [String?]?.self),
            .field("illustration", Illustration?.self),
            .field("sectionCollection", SectionCollection?.self),
          ] }

          var sys: Sys { __data["sys"] }
          var title: String? { __data["title"] }
          var subtitle: String? { __data["subtitle"] }
          var numberOfSections: Int? { __data["numberOfSections"] }
          var numberOfHours: Int? { __data["numberOfHours"] }
          var subject: String? { __data["subject"] }
          var colors: [String?]? { __data["colors"] }
          var illustration: Illustration? { __data["illustration"] }
          var sectionCollection: SectionCollection? { __data["sectionCollection"] }

          /// CourseCollection.Course.Sys
          ///
          /// Parent Type: `Sys`
          struct Sys: SwiftUIConcurrency.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Sys }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("publishedAt", SwiftUIConcurrency.DateTime?.self),
              .field("id", String.self),
            ] }

            var publishedAt: SwiftUIConcurrency.DateTime? { __data["publishedAt"] }
            var id: String { __data["id"] }
          }

          /// CourseCollection.Course.Illustration
          ///
          /// Parent Type: `Asset`
          struct Illustration: SwiftUIConcurrency.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.Asset }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", String?.self),
            ] }

            var url: String? { __data["url"] }
          }

          /// CourseCollection.Course.SectionCollection
          ///
          /// Parent Type: `CourseSectionCollection`
          struct SectionCollection: SwiftUIConcurrency.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { SwiftUIConcurrency.Objects.CourseSectionCollection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("items", alias: "sections", [Section?].self),
            ] }

            var sections: [Section?] { __data["sections"] }

            /// CourseCollection.Course.SectionCollection.Section
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
                .field("subtitle", String?.self),
                .field("content", String?.self),
              ] }

              var sys: Sys { __data["sys"] }
              var title: String? { __data["title"] }
              var subtitle: String? { __data["subtitle"] }
              var content: String? { __data["content"] }

              /// CourseCollection.Course.SectionCollection.Section.Sys
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
  }

}