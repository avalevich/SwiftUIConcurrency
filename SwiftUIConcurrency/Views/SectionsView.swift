//
//  Sectionsview.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct SectionsView: View {
    var body: some View {
        VStack {
            Text("All Sections")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            SectionList()
        }
    }
}

#Preview {
    SectionsView()
}
