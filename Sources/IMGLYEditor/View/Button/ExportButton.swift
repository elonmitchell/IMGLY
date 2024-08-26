import CoreMedia
@_spi(Internal) import IMGLYCore
import SwiftUI

@_spi(Internal) public struct ExportButton: View {
    @EnvironmentObject private var interactor: Interactor

    @_spi(Internal) public init() {}

    @_spi(Internal) public var body: some View {
        Button(action: {
            interactor.exportScene()
        }) {
            Image("custom.export.button", bundle: .module)
                .renderingMode(.original) // Ensure the image displays in full color
                .font(.system(size: 24)) // Adjust the size as needed
                .padding(12)
                .opacity(interactor.isLoading
                         || interactor.isExporting
                         || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero) ? 0.5 : 1.0) // Reduce opacity when disabled
                .overlay(
                    interactor.isLoading
                    || interactor.isExporting
                    || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero) ?
                    Color.gray.opacity(0.4).blendMode(.overlay) : Color.clear
                )
        }
        .disabled(interactor.isLoading
                  || interactor.isExporting
                  || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero))
    }
}

struct ExportButton_Previews: PreviewProvider {
    static var previews: some View {
        ExportButton() // Provide the necessary environment object
    }
}
