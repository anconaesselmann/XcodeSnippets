import SwiftUI
import LoadableView
import Combine

struct <#NAME#>View: DefaultLoadableView {
    @StateObject
    var vm = <#NAME#>ViewModel()

    func loaded(_ viewData: <#TYPE#>) -> some View {
        VStack {

        }
    }
}

@MainActor
final class <#NAME#>ViewModel: LoadableViewModel {

    @Published
    var viewState: ViewState<<#TYPE#>> = .notLoaded

    var overlayState: OverlayState = .none

    private let <#DEPENDENCY_NAME#> = <#DEPENDENCY#>

    private var bag = Set<AnyCancellable>()

    init() {
        <#DEPENDENCY_NAME#>.<#STREAM_NAME#>.sink { [weak self] newItem in
            self?.update(with: newItem)
        }.store(in: &bag)
    }

    func load() async throws -> <#TYPE#> {
        try await <#DEPENDENCY_NAME#>.<#FETCH_CALL#>()
    }
}

extension <#NAME#>ViewModel: ReloadsWhenForegrounding {
    var screenId: UUID { ScreenIDs.<#SCREEN_ID#> }

    var reloadTimerInterval: TimeInterval { 60 }
}
