import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @State private var text = ""
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn now")
                }
            NavigationView {
                SectionsView()
            }
            .searchable(text: $text)
            .onSubmit(of: .search) {
                sectionViewModel.filterSections(for: text)
            }
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
        .environmentObject(SectionViewModel())
}
