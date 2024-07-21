import SwiftUI

class ModalManager: ObservableObject {
    enum ActiveModals {
        case signIn
        case signUp
        case resetPassword
    }
    
    @Published
    var showModal = false
    
    @Published
    var activeModal: ActiveModals = .signIn
    
}
