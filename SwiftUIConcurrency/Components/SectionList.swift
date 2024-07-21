//
//  SectionList.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct SectionList: View {
    @StateObject var sectionViewModel = SectionViewModel()
    
    var body: some View {
        List {
            ForEach(sectionViewModel.sections, id: \.id) { section in
                Text(section.title)
            }
        }
        .refreshable {
            await sectionViewModel.randomizeSections()
        }
        .task {
            await sectionViewModel.fetch()
        }
    }
}

#Preview {
    SectionList()
}
