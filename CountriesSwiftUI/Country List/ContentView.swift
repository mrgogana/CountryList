//
//  ContentView.swift
//  CountriesSwiftUI
//
//  Created by Navpreet Gogana on 2023-02-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CountryViewModel = CountryViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .darkGray).ignoresSafeArea()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.searchList, id: \.hashValue) { value in
                            NavigationLink(destination: CountryDetailView(country: value)) {
                                CountryCardView(country: value)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("Countries")
            }
        }
        .searchable(text: $viewModel.searchText)
        .tint(.white)
        .onAppear() {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
            viewModel.getCountryList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
