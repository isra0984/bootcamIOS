//
//  ProveedorSeries.swift
//  ProveedorSeries
//
//  Created by Israel Torres Alvarado on 29/07/21.
//

import Foundation

class ProveedorSeries {
        
    func getSeries() -> [Serie] {
        
        var arrSeries: [Serie] = []
        arrSeries.append(Serie(name: "24", image: "24"))
        arrSeries.append(Serie(name: "Anatomia de Grey", image: "Anatomia de Grey"))
        arrSeries.append(Serie(name: "Breaking Bad", image: "Breaking Bad"))
        arrSeries.append(Serie(name: "CSI", image: "CSI"))
        arrSeries.append(Serie(name: "Deadwood", image: "Deadwood"))
        arrSeries.append(Serie(name: "Dexter", image: "Dexter"))
        arrSeries.append(Serie(name: "Doctor Who", image: "Doctor Who"))
        arrSeries.append(Serie(name: "Expediente X", image: "Expediente X"))
        arrSeries.append(Serie(name: "Friends", image: "Friends"))
        arrSeries.append(Serie(name: "Fringe", image: "Fringe"))
        arrSeries.append(Serie(name: "Futurama", image: "Futurama"))
        arrSeries.append(Serie(name: "Heroes", image: "Heroes"))
        arrSeries.append(Serie(name: "House", image: "House"))
        arrSeries.append(Serie(name: "Juego de Tronos", image: "Juego de Tronos"))
        arrSeries.append(Serie(name: "Los Simpsons", image: "Los Simpsons"))
        arrSeries.append(Serie(name: "Los Soprano", image: "Los Soprano"))
        arrSeries.append(Serie(name: "Mad Men", image: "Mad Men"))
        arrSeries.append(Serie(name: "Modern Family", image: "Modern Family"))
        arrSeries.append(Serie(name: "Padre de Familia", image: "Padre de Familia"))
        arrSeries.append(Serie(name: "Perdidos", image: "Perdidos"))
        arrSeries.append(Serie(name: "Prison Break", image: "Prison Break"))
        arrSeries.append(Serie(name: "South Park", image: "South Park"))
        arrSeries.append(Serie(name: "The Big Bang Theory", image: "The Big Bang Theory"))
        arrSeries.append(Serie(name: "The Walking Dead", image: "The Walking Dead"))
        return arrSeries
        
    }

}
