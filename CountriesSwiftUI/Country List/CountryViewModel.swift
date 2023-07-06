//
//  CountryViewModel.swift
//  CountriesSwiftUI
//
//  Created by Navpreet Gogana on 2023-02-27.
//

import Foundation
import Combine

final class CountryViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var countryList: [Country] = [Country]()
    @Published var searchList: [Country] = [Country]()
    @Published var searchText = "" {
        didSet {
            if searchText.isEmpty {
                searchList = countryList
            } else {
                searchList = countryList.filter {
                    $0.name.contains(searchText) ||
                    $0.capital.contains(searchText)
                }
            }
        }
    }
    
    
    let apiManager = APIManager.shared
    
    
    func getCountryList() {
        apiManager.fetch(endpoint: .countries, type: [Country].self)
            .sink { competion in
                switch competion {
                case .failure(let err):
                    print(err.localizedDescription)
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] countryData in
                guard let self = self else { return }
                self.countryList = countryData
                self.searchList = self.countryList
            }
            .store(in: &cancellables)

    }
}
