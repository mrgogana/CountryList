//
//  CountryDetailView.swift
//  CountriesSwiftUI
//
//  Created by Navpreet Gogana on 2023-02-27.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    
    init(country: Country) {
        self.country = country
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .darkGray).ignoresSafeArea()
                VStack {
                    Text(country.name)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country(capital: "Non", code: "123", flag: "asdsa", name: "Canada", region: "NA", currency: Currency(name: "Dollar", code: "321", symbol: "$"), language: Language(name: "English", code: "12")))
    }
}
