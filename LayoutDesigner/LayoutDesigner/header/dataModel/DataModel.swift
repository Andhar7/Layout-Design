//
//  DataModel.swift
//  DataModel
//
//  Created by Andrej Kling on 12.08.21.
//


import SwiftUI
import MapKit
 

struct Reality: Identifiable, Codable, Hashable {
    
    var id: Int
    var price: String
    var ulice: String
    var arrayImage: [String]
    var arrayPodrobnosti: [String]
    var arrayShortPodrobnosti: [String]
    var description: String
    var city : String
    var category : String
    var isFavorite: Bool
   // var location: CLLocationCoordinate2D

    var imageName: String
    var image: Image {
        Image(imageName)
    }

    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

var houses: [Reality] = load("data.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
