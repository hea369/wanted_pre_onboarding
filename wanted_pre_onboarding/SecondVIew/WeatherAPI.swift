//
//  weatherAPI.swift
//  wanted_pre_onboarding
//
//  Created by 박호현 on 2022/09/14.
//

import Foundation


// MARK: - Weatherlist
struct Weatherlist: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double
    
    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type: Int?
    let id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}


class WeatherAPI {
    
    func callAPI(cityName: String, completion: @escaping (Weatherlist) -> Void ) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        print(session)
        
        var url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=ebaad1078c344a671b20cf1d79406040&lang=kr")
        
        guard let requestURL = url else { return }
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            
            guard error == nil else { return }
            
            let successsRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successsRange.contains(statusCode) else { return }
            
            guard let resultData = data else { return }
            let resultString = String(data: resultData, encoding: .utf8)
            print(resultData)
            print(resultString)
            
            let data = try! JSONDecoder().decode(Weatherlist.self, from: data!)
            DispatchQueue.main.async {
                completion(data)
            }
            
            
        }
        
        dataTask.resume()
        
    }
}
