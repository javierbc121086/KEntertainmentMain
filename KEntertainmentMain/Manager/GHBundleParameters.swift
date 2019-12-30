//
//  GHBundleParameters.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import Foundation
import GNSwissRazor

class GHBundleParameters {
    /// Para pasar los parametros entre views controllers.
    fileprivate lazy var _params: [String : Any] = [:]
    
    /**
     Agrega un valor para pasar entre viewscontrollers.
     - parameters:
     - value: El valor que se desea agregar a la lista de parametros.
     - key: La llave en donde se guardara el valor.
     */
    func add(_ value: Any, key: String) {
        _params.updateValue(value, forKey: key)
    }
    
    /**
     Returna el valor en tipo Int.
     - parameters:
     - key: El valor que se desea obtener del diccionario.
     - returns:
     El valor del diccionario de tipo Int.
     */
    func getInt(_ key: String) -> Int {
        return _params[key] as? Int ?? -1
    }
    
    /**
     Returna el valor en tipo String.
     - parameters:
     - key: El valor que se desea obtener del diccionario.
     - returns:
     El valor del diccionario de tipo String.
     */
    func getString(_ key: String) -> String {
        return _params[key] as? String ?? String.Empty
    }
    
    /**
     Returna el valor en tipo Bool.
     - parameters:
     - key: El valor que se desea obtener del diccionario.
     - returns:
     El valor del diccionario de tipo Bool.
     */
    func getBool(_ key: String) -> Bool {
        return _params[key] as? Bool ?? false
    }
    
    
    /**
     Returna el objeto persistido.
     - parameters:
     - key: El valor que se desea obtener del diccionario.
     - returns:
     El objeto de tipo genreico.
     */
    func get<T>(_ key: String) -> T? {
        if let returna = _params[key] as? T {
            return returna
        }
        return nil
    }
    
    /// Elimina de memoria todos los elementos del diccionario
    func releaseSource() {
        _params.removeAll()
    }
}
