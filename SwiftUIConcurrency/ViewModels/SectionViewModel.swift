import Foundation
import Apollo

class SectionViewModel: ObservableObject {
    @Published
    public var sections: [SectionDataCollection.SectionModel] = []
    @Published
    public private(set) var filteredSections: [SectionDataCollection.SectionModel] = []
    private func querySections() async throws -> GraphQLResult<SwiftUIConcurrency.SectionQuery.Data>? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(query: SwiftUIConcurrency.SectionQuery()) { result in
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
    
    private func process(data: SectionsCollectionData) -> [SectionDataCollection.SectionModel] {
        let content = SectionDataCollection(data)
        return content.sections
    }
    
    func fetch() async {
        do {
            if let model = try await querySections() {
                if let sectionCollection = model.data?.sectionCollection {
                    DispatchQueue.main.async {
                        self.sections = self.process(data: sectionCollection)
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
    func randomizeSections() async {
        sections.shuffle()
    }
    
    func orderSectionByPinned() {
        sections.sort { $0.isPinned && !$1.isPinned}
    }
    
    func filterSections(for text: String) {
        filteredSections = []
        let searchText = text.lowercased()
        sections.forEach { section in
            let searchContent = section.title
            
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredSections.append(section)
            }
        }
    }
}
