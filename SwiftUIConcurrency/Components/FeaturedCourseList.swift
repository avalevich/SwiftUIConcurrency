//
//  FeaturedCourseList.swift
//  SwiftUIConcurrency
//
//  Created by Alyaxey Valevich on 20/05/2024.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featuredCourses: [Course]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if featuredCourses.count > 0 {
                    ForEach(featuredCourses, id: \.id) { course in
                        NavigationLink {
                            CourseView(course: course)
                        } label: {
                            FeaturedCourseCard(featuredCourse: course)
                                .frame(width: 252, height: 350)
                        }
                    }
                } else {
                    ForEach(0..<5, id: \.self) { number in
                        FeaturedCourseCard(featuredCourse: coursePreviewData)
                            .frame(width: 252, height: 350)
                            .redacted(reason: .placeholder)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    FeaturedCourseList(featuredCourses: [coursePreviewData])
}
