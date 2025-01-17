//
//  DataModel.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import Foundation
import SwiftUI


enum CuisineType: String, CaseIterable {
    
    case american = "American"
    case mexican = "Mexican"
    case chinese = "Chinese"
    case italian = "Italian"
    
}

enum Prices: String, CaseIterable {
    
    case one = "$"
    case two = "$$"
    case three = "$$$"
    case four = "$$$$"
}

struct Restaurant: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var cuisineType: CuisineType
    var priceRange: Prices
    var rating: Double
    var image: String
    
    
}

// ArrayList of Restaurants Information

extension Restaurant {
     static var restaurantsList: [Restaurant] = [
        
        //AMERICAN LIST
        
        Restaurant (name: "Palace Grill Restaurant",
                    cuisineType: CuisineType.american,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "Palace"),
        
        Restaurant (name: "Inspiration Kitchens",
                    cuisineType: CuisineType.american,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: "Inspiration"),
        
        Restaurant (name: "S.K.Y",
                    cuisineType: CuisineType.american,
                    priceRange: Prices.three,
                    rating: 4.7,
                    image: "sky"),
        
        Restaurant (name: "Alinea",
                    cuisineType: CuisineType.american,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: "alinea"),
        
        //CHINESE LIST
        
        Restaurant (name: "China Snack",
                    cuisineType: CuisineType.chinese,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "chinaSnack"),
        
        Restaurant (name: "Xi'an Cuisine",
                    cuisineType: CuisineType.chinese,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: "Xian"),
        
        Restaurant (name: "Duck Duck Goat",
                    cuisineType: CuisineType.chinese,
                    priceRange: Prices.three,
                    rating: 4.6,
                    image: "duckDuckGoat"),
        
        Restaurant (name: "Shangai Terrace",
                    cuisineType: CuisineType.chinese,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: "Shanghai"),
        
        //MEXICAN List
        
        Restaurant (name: "El Mariachi",
                    cuisineType: CuisineType.mexican,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "ElMariachi"),
        
        Restaurant (name: "XOCO",
                    cuisineType: CuisineType.mexican,
                    priceRange: Prices.two,
                    rating: 4.5,
                    image: "Xoco"),
        
        Restaurant (name: "Leña Brava",
                    cuisineType: CuisineType.mexican,
                    priceRange: Prices.three,
                    rating: 4.5,
                    image: "Lenabrava"),
        
        Restaurant (name: "Tzuco",
                    cuisineType: CuisineType.mexican,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: "tzuco"),
        
        //ITALIAN List
        
        Restaurant (name: "Pasta Palazzo",
                    cuisineType: CuisineType.italian,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "pastaPalazzo"),
        
        Restaurant (name: "Bacchanalia",
                    cuisineType: CuisineType.italian,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: "bacchanalia"),
        
        Restaurant (name: "Gaia Ristorante Italiano",
                    cuisineType: CuisineType.italian,
                    priceRange: Prices.three,
                    rating: 4.9,
                    image: "gaia"),
        
        Restaurant (name: "Segnatore",
                    cuisineType: CuisineType.italian,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: "segnatore"),
        
        
    ]
    

}

//var filterArrayByCuisine = restaurantsList.filter({ return $0.cuisineType.rawValue == "mexican"})

var filteredRestaurant: [Restaurant] = []

var restaurantCard: [Restaurant] = []

var favorites: [Restaurant] = []


func filterByCousineType (cuisineType: String) {
    
    for cusine in Restaurant.restaurantsList {
        if cusine.cuisineType.rawValue == cuisineType {
            filteredRestaurant.append(cusine)
        }
    }
    
    
}

func filterByPriceRange (priceRange: String) {

    for price in filteredRestaurant {
        if price.priceRange.rawValue == priceRange {
            let priceRangeFilter = filteredRestaurant.filter{
                $0.priceRange.rawValue == price.priceRange.rawValue
            }
            restaurantCard.append(contentsOf: priceRangeFilter)
        }
    }

}

func addToFavorites () {

        favorites.append(contentsOf: restaurantCard)

}

func filterArray () {
    
    for cusine in Restaurant.restaurantsList {
        
        filteredRestaurant = Restaurant.restaurantsList.filter{
            $0.cuisineType.rawValue == cusine.cuisineType.rawValue
        }

    }
    
}

func resetData () {
    
    filteredRestaurant = []

    restaurantCard = []
    
}

func cusineTypeStatus (cusineType: CuisineType) -> String {
    
    switch cusineType {
    case .mexican:
        return "Nice selection! I see you like SPICY huh?! 🌶"
        
    case .american:
        return "Nice selection! no one can beat steak and burgers! 🍔"
        
    case .chinese:
        return "Nice selection! Lets practice those Chopsticks 🥢!!"
        
    case .italian:
        return "Nice selection! Pasta time!!! 🍝"
    }
}



