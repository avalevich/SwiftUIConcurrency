//
//  CourseList.swift
//  SwiftUIConcurrency
//
//  Created by Alyaxey Valevich on 20/05/2024.
//

import SwiftUI

struct CourseList: View {
    var courses: [Course]
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            if courses.count > 0 {
                ForEach(courses, id: \.id) { course in
                    NavigationLink {
                        CourseView(course: course)
                    } label: {
                        CourseCard(course: course)
                    }
                }
            } else {
                ForEach(0..<5, id: \.self) { number in
                    CourseCard(course: coursePreviewData)
                        .redacted(reason: .placeholder)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CourseList(courses: [coursePreviewData])
}
