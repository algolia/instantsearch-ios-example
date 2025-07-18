import SwiftUI

@main
struct InstantSearchExampleApp: App {
    
    var body: some Scene {
        let controller = AlgoliaController()
        WindowGroup {
            NavigationStack {
                ContentView(searchBoxController: controller.searchBoxController,
                            hitsController: controller.hitsController,
                            statsController: controller.statsController,
                            facetListController: controller.facetListController)
            }
        }
    }
}
