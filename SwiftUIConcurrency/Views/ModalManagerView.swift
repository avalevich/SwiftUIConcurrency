//
//  ModalManagerView.swift
//  SwiftUIConcurrency
//
//  Created by Alex on 21/07/2024.
//

import SwiftUI

struct ModalManagerView: View {
    @EnvironmentObject var modalManager: ModalManager
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black.opacity(0.5))
                .ignoresSafeArea(edges: .all)
                .onTapGesture {
                    modalManager.showModal.toggle()
                    modalManager.activeModal = .signIn
                }
            Group {
                switch modalManager.activeModal {
                case .signIn:
                    SignInView()
                case .signUp:
                    SignUpView()
                case .resetPassword:
                    ResetPasswordView()
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    ModalManagerView()
        .environmentObject(ModalManager())
}
