import SwiftUI

@_spi(Internal) public struct UndoRedoButtons: View {
    @EnvironmentObject private var interactor: Interactor

    @_spi(Internal) public init() {}

    @_spi(Internal) public var body: some View {
        Group {
            Image("custom.undo.button", bundle: .module)
                .renderingMode(.original)
                .opacity(interactor.canUndo ? 1.0 : 0.3)
            // Adjust opacity based on canUndo state
            Spacer() // Add space between undo and redo buttons
            .frame(width: 45)
            Image("custom.redo.button", bundle: .module)
                .renderingMode(.original)
                .opacity(interactor.canRedo ? 1.0 : 0.3) // Adjust opacity based on canRedo state
        }
        .allowsHitTesting(interactor.isEditing)
        .opacity(interactor.isEditing ? 1 : 0)
        .animation(nil, value: interactor.isEditing)
    }
}
