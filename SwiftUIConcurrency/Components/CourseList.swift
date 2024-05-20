//
//  CourseList.swift
//  SwiftUIConcurrency
//
//  Created by Alyaxey Valevich on 20/05/2024.
//

import SwiftUI

struct CourseList: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(0..<10, id: \.self) { number in
                CourseCard()
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CourseList()
}
