//
//  FeaturedCourseList.swift
//  SwiftUIConcurrency
//
//  Created by Alyaxey Valevich on 20/05/2024.
//

import SwiftUI

struct FeaturedCourseList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<5, id: \.self) { number in
                    FeaturedCourseCard()
                        .frame(width: 252, height: 350)
                }
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    FeaturedCourseList()
}
