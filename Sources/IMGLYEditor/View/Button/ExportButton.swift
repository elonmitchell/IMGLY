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
            .font(.system(size: 24)) // Adjust the size as needed
            .padding(12)
    }
  }
}

struct ExportButton_Previews: PreviewProvider {
  static var previews: some View {
    ExportButton() // Provide the necessary environment object
  }
}
