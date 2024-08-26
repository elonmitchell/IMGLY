import SwiftUI
import IMGLYEngine

@_spi(Internal) public struct UndoRedoButtons: View {
    @EnvironmentObject private var interactor: Interactor

    @_spi(Internal) public init() {}

    @_spi(Internal) public var body: some View {
        HStack {
            Button(action: {
                // Execute the undo action
                do {
                    try interactor.engine?.undo()
                } catch {
                    // Handle the error if undo fails
                    print("Undo failed: \(error)")
                }
            }) {
                Image("custom.undo.button", bundle: .module)
                    .renderingMode(.original)
                    .opacity(interactor.canUndo ? 1.0 : 0.5)
            }
            .disabled(!interactor.canUndo) // Optionally disable the button if undo is not possible

            Spacer()
                .frame(width: 26) // Adjust the width as needed

            Button(action: {
                // Execute the redo action
                do {
                    try interactor.engine?.redo()
                } catch {
                    // Handle the error if redo fails
                    print("Redo failed: \(error)")
                }
            }) {
                Image("custom.redo.button", bundle: .module)
                    .renderingMode(.original)
                    .opacity(interactor.canRedo ? 1.0 : 0.5)
            }
            .disabled(!interactor.canRedo) // Optionally disable the button if redo is not possible
        }
        .allowsHitTesting(interactor.isEditing)
        .opacity(interactor.isEditing ? 1 : 0)
        .animation(nil, value: interactor.isEditing)
    }
}

// Engine extension to add undo and redo methods
@_spi(Internal) public extension Engine {
    
    // Method to perform undo operation
    func undo() throws {
        try self.editor.undo()
    }

    // Method to perform redo operation
    func redo() throws {
        try self.editor.redo()
    }
}
