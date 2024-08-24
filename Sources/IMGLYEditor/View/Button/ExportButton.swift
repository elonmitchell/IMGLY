import CoreMedia
@_spi(Internal) import IMGLYCore
import SwiftUI

@_spi(Internal) public struct ExportButton: View {
  @EnvironmentObject private var interactor: Interactor

  @_spi(Internal) public init() {}

  @_spi(Internal) public var body: some View {
    Text("Export")
      .onTapGesture {
        // Restore the original export function call here
        interactor.export()
      }
      .disabled(interactor.isLoading
        || interactor.isExporting
        || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero))
  }
}

struct ExportButton_Previews: PreviewProvider {
  static var previews: some View {
    ExportButton()
      .environmentObject(Interactor()) // Provide an environment object if needed
  }
}
