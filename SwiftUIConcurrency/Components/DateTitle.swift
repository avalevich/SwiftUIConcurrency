import SwiftUI

struct DateTitle: View {
    var title: AttributedString
    @State private var date: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(date.uppercased())
                .font(.footnote)
                .fontWeight(.medium)
                .opacity(0.7)
            
            Text(title)
                .font(.largeTitle).bold()
        }
        .onAppear {
            date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
        }
    }
}

#Preview {
    DateTitle(title: "Learn SwiftUI")
}
