import Foundation
import Apollo

class CourseViewModel: ObservableObject {
    @Published
    public private(set) var courses: [Course] = []
    private func queryCourses() async throws -> GraphQLResult<SwiftUIConcurrency.CourseQuery.Data>? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(query: SwiftUIConcurrency.CourseQuery()) { result in
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
    
    func fetch() async {
        do {
            if let model = try await queryCourses() {
                if let courseCollection = model.data?.courseCollection {
                    DispatchQueue.main.async {
                        self.courses = self.process(data: courseCollection)
                    }
                }
            }
        } catch {
            print(error)
        }
    }
}
