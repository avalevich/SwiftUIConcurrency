//
//  CourseView.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct CourseView: View {
    @Environment(\.presentationMode) var presentationMode
    var course: Course
    var body: some View {
        ZStack(alignment: .top) {
            content
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    CloseButton()
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ScrollView {
            CourseViewCover(course: course)
            
            LazyVStack(spacing: 0) {
                ForEach(course.sectionCollection!.sections.indices, id: \.self) { index in
                    NavigationLink {
                        SectionView(course: course, section: course.sectionCollection!.sections[index])
                    } label: {
                        SectionRow(section: course.sectionCollection!.sections[index], index: index + 1)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    CourseView(course: coursePreviewData)
}
