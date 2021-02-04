//
//  WeatherList.swift
//  Weather
//
//  Created by WishACloud on 31/01/21.
//

import SwiftUI

struct WeatherList: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Cites")
                            .font(.headline)) {
                    ForEach(0...20, id: \.self) { _ in
                        NavigationLink(destination: CityView(cityName: "London")) {
                            CityRow()
                        }
                    }
                }
            }.navigationBarTitle("Weather")
            .navigationBarItems(leading: Button(action: editAction, label: {
                Text("Edit")
            }), trailing: Button(action: addCity, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            }))
        }
    }
    
    fileprivate func editAction() {
        print("Edit")
    }
    
    fileprivate func addCity() {
        print("add city")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherList()
                .preferredColorScheme(.dark)
            WeatherList()
                .preferredColorScheme(.light)
        }
    }
}
