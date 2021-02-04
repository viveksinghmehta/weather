//
//  CityView.swift
//  Weather
//
//  Created by WishACloud on 02/02/21.
//

import SwiftUI


struct HourlyModel: Identifiable {
    var id = UUID()
    var imageName: String
    var time: String
    var temp: String
}


struct WeekModel: Identifiable {
    var id = UUID()
    var imageName: String
    var weekName: String
    var minTemp: String
    var maxTemp: String
}

struct CityView: View {
    
    var cityName: String
    
    let sectionArray: [String] = ["Now", "Hourly", "This Week"]
    let hourlyArray: [HourlyModel] =
            [
        HourlyModel(imageName: "sun.min", time: "01:00 AM", temp: "4º C"),
        HourlyModel(imageName: "sunrise.fill", time: "02:00 AM", temp: "5º C"),
        HourlyModel(imageName: "sunset.fill", time: "03:00 AM", temp: "6º C"),
        HourlyModel(imageName: "sun.dust.fill", time: "04:00 AM", temp: "7º C"),
        HourlyModel(imageName: "moon.fill", time: "05:00 AM", temp: "8º C"),
        HourlyModel(imageName: "moon.stars.fill", time: "06:00 AM", temp: "9º C"),
        HourlyModel(imageName: "cloud.rain.fill", time: "07:00 AM", temp: "10º C"),
        HourlyModel(imageName: "cloud.fog.fill", time: "08:00 AM", temp: "11º C"),
        HourlyModel(imageName: "cloud.sun.rain.fill", time: "09:00 AM", temp: "12º C"),
        HourlyModel(imageName: "wind.snow", time: "10:00 AM", temp: "13º C"),
        HourlyModel(imageName: "tornado", time: "11:00 AM", temp: "14º C"),
        HourlyModel(imageName: "cloud.moon.bolt.fill", time: "11:00 AM", temp: "15º C")
            ]
    let weeklyArray: [WeekModel] =
        [
            WeekModel(imageName: "sun.min", weekName: "Sunday", minTemp: "5º C", maxTemp: "13º C"),
            WeekModel(imageName: "sun.dust.fill", weekName: "Monday", minTemp: "7º C", maxTemp: "9º C"),
            WeekModel(imageName: "moon.stars.fill", weekName: "Tuesday", minTemp: "10º C", maxTemp: "23º C"),
            WeekModel(imageName: "cloud.moon.bolt.fill", weekName: "Wednesday", minTemp: "5º C", maxTemp: "5º C"),
            WeekModel(imageName: "wind.snow", weekName: "Thusday", minTemp: "5º C", maxTemp: "5º C"),
            WeekModel(imageName: "cloud.sun.rain.fill", weekName: "Friday", minTemp: "5º C", maxTemp: "5º C"),
            WeekModel(imageName: "tornado", weekName: "Saturday", minTemp: "5º C", maxTemp: "5º C"),
        ]
    
    
    var body: some View {
        Form {
            Group {
                Section(header: Text("Now")) {
                    HStack {
                        Spacer()
                        Image(systemName: "sun.dust")
                        Text("22º C")
                        Spacer()
                    }
                    .font(Font.system(size: 55))
                    .padding()
                }
                Section(header: Text("Hourly")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(hourlyArray, id: \.id) { hourlyData in
                                VStack {
                                    Text(hourlyData.time).bold()
                                    Spacer()
                                    Image(systemName: hourlyData.imageName)
                                        .frame(width: 40.0, height: 40.0)
                                        .font(Font.system(size: 40))
                                    Spacer()
                                    Text(hourlyData.temp)
                                }.padding()
                            }
                        }
                    }
                }
                Section(header: Text("This week")) {
                    LazyVStack {
                        ForEach(weeklyArray, id: \.id) { weekData in
                            HStack {
                                Text(weekData.weekName)
                                    .font(.title2).bold()
                                Spacer()
                                Image(systemName: weekData.imageName)
                                    .font(Font.system(size: 25))
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("min")
                                        .foregroundColor(.gray)
                                        .font(.headline)
                                    Text(weekData.minTemp)
                                        .bold()
                                }
                                .font(.title3)
                                VStack(alignment: .trailing) {
                                    Text("max")
                                        .foregroundColor(.gray)
                                        .font(.headline)
                                    Text(weekData.maxTemp)
                                        .bold()
                                }
                                .font(.title3)
                            }
                        }
                    }
                }
            }
        }.navigationBarTitle(Text(cityName))
    }
}



struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CityView(cityName: "Delhi")
        }
    }
}

