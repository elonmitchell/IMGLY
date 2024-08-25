import CoreMedia
@_spi(Internal) import IMGLYCore
import SwiftUI

@_spi(Internal) public struct ExportButton: View {
  @EnvironmentObject private var interactor: Interactor

  @_spi(Internal) public init() {}

  @_spi(Internal) public var body: some View {
    Button(action: {
      // Perform the same action as ActionButton(.export)
      // You may need to access the same functionality or action as defined in ActionButton(.export)
    }) {
      Text("Export")
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.blue) // Adjust color as needed
        .padding()
    }
    .disabled(interactor.isLoading
      || interactor.isExporting
      || (interactor.sceneMode == .video && interactor.timelineProperties.timeline?.totalDuration == .zero))
  }
}

struct ExportButton_Previews: PreviewProvider {
  static var previews: some View {
    ExportButton().environmentObject(Interactor()) // Provide the necessary environment object
  }
}
