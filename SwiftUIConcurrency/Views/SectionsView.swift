//
//  Sectionsview.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct SectionsView: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @Environment(\.isSearching) var isSearching
    var body: some View {
        VStack {
            if isSearching {
                if sectionViewModel.filteredSections.count > 0 {
                    List(sectionViewModel.filteredSections, id: \.id) { section in
                        Text(section.title)
                    }
                } else {
                    List(0..<1) { _ in
                        Text("No results")
                    }
                }
            } else {
                SectionList()
                    .environmentObject(sectionViewModel)
            }
        }
        .navigationTitle(Text("All Sections"))
    }
}

#Preview {
    SectionsView()
        .environmentObject(SectionViewModel())
}
