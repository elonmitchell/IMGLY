import CoreMedia
@_spi(Internal) import IMGLYCore
import SwiftUI

@_spi(Internal) public struct ExportButton: View {
  @EnvironmentObject private var interactor: Interactor

  @_spi(Internal) public init() {}

  @_spi(Internal) public var body: some View {
    Button(action: {
      // Handle export action here
    }) {
      Text("Export")
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
    .disabled(interactor.isLoading
      || interactor.isExporting
      || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero))
  }
}
