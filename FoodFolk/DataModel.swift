//
//  DataModel.swift
//  FoodFolk
//
//  Created by admin on 5/12/22.
//

import Foundation
import SwiftUI


enum CusineTypes: String, CaseIterable {
    
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
    var cuisineType: CusineTypes
    var priceRange: Prices
    var rating: Double
    var image: String
    
    
}

// ArrayList of Restaurants Information

extension Restaurant {
     static var restaurantsList: [Restaurant] = [
        
        //AMERICAN LIST
        
        Restaurant (name: "Palace Grill Restaurant",
                    cuisineType: CusineTypes.american,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "Palace"),
        
        Restaurant (name: "Inspiration Kitchens",
                    cuisineType: CusineTypes.american,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: ""),
        
        Restaurant (name: "S.K.Y",
                    cuisineType: CusineTypes.american,
                    priceRange: Prices.three,
                    rating: 4.7,
                    image: ""),
        
        Restaurant (name: "Alinea",
                    cuisineType: CusineTypes.american,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: ""),
        
        //CHINESE LIST
        
        Restaurant (name: "China Snack",
                    cuisineType: CusineTypes.chinese,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: ""),
        
        Restaurant (name: "Xi'an Cuisine",
                    cuisineType: CusineTypes.chinese,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: ""),
        
        Restaurant (name: "Duck Duck Goat",
                    cuisineType: CusineTypes.chinese,
                    priceRange: Prices.three,
                    rating: 4.6,
                    image: ""),
        
        Restaurant (name: "Shangai Terrace",
                    cuisineType: CusineTypes.chinese,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: "Shangai"),
        
        //MEXICAN List
        
        Restaurant (name: "El Mariachi",
                    cuisineType: CusineTypes.mexican,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: "ElMariachi"),
        
        Restaurant (name: "XOCO",
                    cuisineType: CusineTypes.mexican,
                    priceRange: Prices.two,
                    rating: 4.5,
                    image: ""),
        
        Restaurant (name: "Leña Brava",
                    cuisineType: CusineTypes.mexican,
                    priceRange: Prices.three,
                    rating: 4.5,
                    image: "Lenabrava"),
        
        Restaurant (name: "Tzuco",
                    cuisineType: CusineTypes.mexican,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: ""),
        
        //ITALIAN List
        
        Restaurant (name: "Pasta Palazzo",
                    cuisineType: CusineTypes.italian,
                    priceRange: Prices.one,
                    rating: 4.6,
                    image: ""),
        
        Restaurant (name: "Bacchanalia",
                    cuisineType: CusineTypes.italian,
                    priceRange: Prices.two,
                    rating: 4.7,
                    image: ""),
        
        Restaurant (name: "Gaia Ristorante Italiano",
                    cuisineType: CusineTypes.italian,
                    priceRange: Prices.three,
                    rating: 4.9,
                    image: ""),
        
        Restaurant (name: "Segnatore",
                    cuisineType: CusineTypes.italian,
                    priceRange: Prices.four,
                    rating: 4.6,
                    image: ""),
        
        
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




