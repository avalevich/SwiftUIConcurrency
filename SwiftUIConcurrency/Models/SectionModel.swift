//
//  SectionModel.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import Foundation

typealias SectionsCollectionData = SwiftUIConcurrency.SectionQuery.Data.SectionCollection

struct SectionDataCollection: Decodable {
    let sections: [SectionModel]
    
    init(_ sectionsCollection: SectionsCollectionData?) {
        self.sections = sectionsCollection?.sections.map({ section in
            SectionModel(section)
        }) ?? []
    }
    
    struct SectionModel: Decodable {
        let id: String
        let title: String
        var isPinned: Bool
        
        init(_ section: SectionsCollectionData.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.isPinned = false
        }
    }
}
