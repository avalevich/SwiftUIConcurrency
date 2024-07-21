//
//  AccountViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var user: User?
    func getUser() async throws {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let user = try JSONDecoder().decode(User.self, from: data)
        DispatchQueue.main.async {
            self.user = user
        }
    }
}
