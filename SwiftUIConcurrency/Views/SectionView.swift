//
//  SectionView.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var attributedContent: AttributedString = ""
    var course: Course
    var section: SectionCollection.Section
    
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
            SectionViewCover(course: course, section: section)
            
            Text(attributedContent)
                .padding(.top, 16)
                .padding(.horizontal, 16)
                .onAppear {
                    do {
                        attributedContent = try AttributedString(markdown: section.content)
                    } catch {
                        print("Error ", error.localizedDescription)
                    }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    SectionView(course: coursePreviewData, section: coursePreviewData.sectionCollection!.sections.first!)
}
