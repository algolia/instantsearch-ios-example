import Foundation
import InstantSearchCore
import InstantSearchSwiftUI

class AlgoliaController {
  let searcher: HitsSearcher
  
  let filterState: FilterState

  let searchBoxConnector: SearchBoxConnector
  let searchBoxController: SearchBoxObservableController

  let hitsController: HitsObservableController<Item>
  let hitsConnector: HitsConnector<Item>

  let statsController: StatsTextObservableController
  let statsConnector: StatsConnector

  let facetListConnector: FacetListConnector
  let facetListController: FacetListObservableController

  init() {
    searcher = HitsSearcher(appID: "latency",
                            apiKey: "1f6fd3a6fb973cb08419fe7d288fa4db",
                            indexName: "bestbuy")
    filterState = .init()
      
    searchBoxController = .init()
    searchBoxConnector = .init(searcher: searcher, controller: searchBoxController)
      
    hitsController = .init()
    hitsConnector = .init(searcher: searcher, filterState: filterState, controller: hitsController)
      
    statsController = .init()
    statsConnector = .init(searcher: searcher, controller: statsController, presenter: DefaultPresenter.Stats.present)
      
    facetListController = .init()
    facetListConnector = .init(
        searcher: searcher,
        filterState: filterState,
        attribute: "manufacturer",
        operator: .or,
        controller: facetListController,
        presenter: FacetListPresenter(sortBy: [.count(order: .descending)], showEmptyFacets: false)
    )
    setupConnections()
    searcher.search()
  }

  func setupConnections() {
    searcher.connectFilterState(filterState)
  }
}
