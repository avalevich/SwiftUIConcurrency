//
//  SectionList.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct SectionList: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    
    var body: some View {
        List {
            ForEach($sectionViewModel.sections, id: \.id) { $section in
                HStack {
                    Text(section.title)
                    Spacer()
                    if section.isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                    .swipeActions {
                        Button {
                            section.isPinned.toggle()
                            sectionViewModel.orderSectionByPinned()
                        } label: {
                            if section.isPinned {
                                Label("Unpin", systemImage: "pin.slash")
                            } else {
                                Label("Pin", systemImage: "pin")
                            }
                        }
                    }
                    .tint(.yellow)
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
        .environmentObject(SectionViewModel())
}
