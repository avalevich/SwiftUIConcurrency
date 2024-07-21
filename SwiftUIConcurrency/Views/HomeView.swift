import SwiftUI
import Apollo

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                DateTitle(title: "Learn SwiftUI")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                FeaturedCourseList()
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
            Color(.white)
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height: 0)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(CourseViewModel())
}
