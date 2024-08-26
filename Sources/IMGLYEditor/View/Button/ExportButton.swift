import CoreMedia
@_spi(Internal) import IMGLYCore
import SwiftUI

@_spi(Internal) public struct ExportButton: View {
    @EnvironmentObject private var interactor: Interactor

    @_spi(Internal) public init() {}

    var shouldDimOpacity: Bool {
        interactor.isLoading
        || interactor.isExporting
        || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero)
    }

    public var body: some View {
        Button(action: {
            interactor.exportScene()
        }) {
            Image("custom.export.button", bundle: .module)
                .renderingMode(.original)
                .font(.system(size: 24))
                .padding(8)
                .opacity(shouldDimOpacity ? 0.5 : 1.0) // Adjust opacity based on the state
        }
        .disabled(shouldDimOpacity)
    }
}

struct ExportButton_Previews: PreviewProvider {
    static var previews: some View {
        ExportButton() // Provide the necessary environment object
    }
}
