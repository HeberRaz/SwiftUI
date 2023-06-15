//
//  WeatherView.swift
//  MyWeatherApp
//
//  Created by Heber Alvarez on 15/06/23.
//

import SwiftUI

struct WeatherView: View {
    let viewModel: WeatherInfoViewModel

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(systemName: viewModel.icon)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    Text("Title")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(viewModel.timezone.description)
                        .font(.body)
                        .foregroundColor(.white)

                }
                Spacer()

                VStack {
                    Text("\(viewModel.temperature.description) ºC")
                        .font(.system(size: 60))
                        .foregroundColor(.white)

                    Text("Feels like: \(viewModel.apparentTemperature.description)ºC")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
}
