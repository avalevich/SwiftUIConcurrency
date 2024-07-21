//
//  AccountView.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()

    var body: some View {
        VStack {
            if let user = accountViewModel.user {
                ProfileCard(user: user)
                    .padding(.horizontal, 8)
            } else {
                Text("No user")
            }
        }
            .task {
                do {
                    try await accountViewModel.getUser()
                } catch {
                    print("Error", error.localizedDescription)
                }
            }
    }
}

#Preview {
    AccountView()
}
