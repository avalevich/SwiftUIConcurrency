import SwiftUI
import Apollo

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var modalManager: ModalManager
    
    var attributedTitle: AttributedString {
        var subject = AttributedString(courseViewModel.featuredSubject.rawValue)
        var container = AttributeContainer()
        if courseViewModel.featuredCourses.count > 0 {
            let color = Color.init(hex: courseViewModel.featuredCourses[0].colors[0]!)
            container.foregroundColor = color
        } else {
            container.foregroundColor = .purple
        }
        subject.mergeAttributes(container)
        return "Learn " + subject
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DateTitle(title: attributedTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                        
                        
                        Spacer()
                        
                        ProfileIcon()
                            .onTapGesture {
                                modalManager.showModal.toggle()
                            }
                    }
                    .padding(.horizontal, 20)
                    
                    FeaturedCourseList(featuredCourses: courseViewModel.featuredCourses)
                        .padding(.top, 20)
                    
                    Text("All courses")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                    
                    CourseList(courses: courseViewModel.courses)
                        .padding(.top, 20)
                }
            }
            Color(.white)
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
        .environmentObject(CourseViewModel())
        .environmentObject(ModalManager())
}
