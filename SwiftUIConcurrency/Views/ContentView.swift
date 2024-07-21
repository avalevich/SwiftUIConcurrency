import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn now")
                }
            SectionsView()
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
        }
        .task {
            await courseViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CourseViewModel())
}
