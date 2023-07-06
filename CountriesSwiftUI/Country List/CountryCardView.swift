//
//  CountryCardView.swift
//  CountriesSwiftUI
//
//  Created by Navpreet Gogana on 2023-02-27.
//

import Foundation
import SwiftUI

struct CountryCardView: View {
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.black]), startPoint: .top, endPoint: .bottom))
                .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
            VStack {
                HStack {
                    Image("add")
                        .frame(width: 40, height: 40)
                    HStack {
                        Text(self.country.name)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 5))
                        Text(self.country.code+", "+self.country.region)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 20))
                    }
                    Text(self.country.capital)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 5))
                }
            }
        }
    }
}
