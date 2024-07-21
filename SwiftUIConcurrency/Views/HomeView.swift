import SwiftUI
import Apollo

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var modalManager: ModalManager
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DateTitle(title: "Learn \(courseViewModel.featuredSubject.rawValue)")
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
