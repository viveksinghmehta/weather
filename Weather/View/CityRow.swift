//
//  CityRow.swift
//  Weather
//
//  Created by WishACloud on 02/02/21.
//

import SwiftUI

struct CityRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Text("London")
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Spacer()
            Image(systemName: "wind.snow")
            Text("22º C")
        }
        .font(.title)
        .foregroundColor(.gray)
        .padding()
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow()
    }
}
