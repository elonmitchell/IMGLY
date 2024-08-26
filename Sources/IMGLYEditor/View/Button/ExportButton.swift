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
        Image(systemName: "square.and.arrow.up.fill")
            .font(.system(size: 20)) // Adjust the size as needed
            .padding(16)
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
