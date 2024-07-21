import Foundation
import Apollo
enum FeaturedSubject: String, CaseIterable {
    case SwiftUI = "SwiftUI"
    case Design = "Design"
}
class CourseViewModel: ObservableObject {
    @Published
    public private(set) var courses: [Course] = []
    var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    @Published
    public private(set) var featuredCourses: [Course] = []
    
    private func queryCourses() async throws -> GraphQLResult<SwiftUIConcurrency.CourseQuery.Data>? {
        await withCheckedContinuation { continuation in
            let preferredLanguage = Locale.preferredLanguages[0]
            let locale = preferredLanguage.contains("ru") ? "ru" : "en-US"
            Network.shared.apollo.fetch(query: SwiftUIConcurrency.CourseQuery(locale: locale)) { result in
                switch result {
                case .success(let model):
                    continuation.resume(returning: model)
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    private func process(data: CourseData) -> [Course] {
        let content = CoursesCollection(data)
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard courses.count > 0 else { return }
        
        featuredCourses = courses.filter { course in
            course.subject == featuredSubject.rawValue
        }
    }
    
    func fetch() async {
        do {
            if let model = try await queryCourses() {
                if let courseCollection = model.data?.courseCollection {
                    DispatchQueue.main.async {
                        self.courses = self.process(data: courseCollection)
                        self.findFeaturedCourses()
                    }
                }
            }
        } catch {
            print(error)
        }
    }
}
