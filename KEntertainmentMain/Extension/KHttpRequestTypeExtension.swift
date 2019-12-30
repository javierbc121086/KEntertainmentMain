//
//  KHttpRequestTypeExtension.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//
import KEntertainmentDomain

extension KHttpRequestType {
    func getTitle() -> String {
        var title = ""
        
        switch self {
        case .moviePopularity:
            title = "Películas populares"
        case .movieRate:
            title = "Películas mejor calificadas"
        case .movieUpcoming:
            title = "Películas por estrenarse"
        case .tvPopularity:
            title = "Programas Tv popupares"
        case .tvRate:
            title = "Programas Tv mejor calificados"
        case .tvUpcoming:
            title = "Programas Tv por estrenarse"
        case .none:
            title = ""
        }
        
        return title
    }
}
