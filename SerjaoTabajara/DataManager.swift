//
//  SalgadoManager.swift
//  SerjaoTabajara
//
//  Created by Avenue Code on 7/14/16.
//  Copyright © 2016 jonas. All rights reserved.
//

import UIKit

public class DataManager: NSObject {
    
    public func getListSalgados() -> [Food]{
        let enrolado = Food(nome: "enrolado ", imagem: UIImage(named: "enrolado_1"), descricao: "Enrolados de presunto e queijo.")
        let almoco = Food(nome: "Almoço", imagem: UIImage(named: "almoco"), descricao: "Melhor PF da savassi.")
        let paodequeijo = Food(nome: "pão de queijo", imagem: UIImage(named: "pao_de_queijo"), descricao: "Pão de queijo mineiro.")

        let salgados = [enrolado, almoco, paodequeijo]
        return salgados
    }
    
    public func searchSalgados(_ searchString : String) -> [Food]{
        var results:[Food] = []
        for salgado in self.getListSalgados() {
            if searchString.localizedCaseInsensitiveContains(salgado.nome) || searchString.localizedCaseInsensitiveContains(salgado.descricao) || salgado.nome.localizedCaseInsensitiveContains(searchString) || salgado.descricao.localizedCaseInsensitiveContains(searchString) {
                results.append(salgado)
            }
        }
        return results
    }
    
    
    public func getListPerson() ->[Person]{
        let Bruno = Person(nome: "Bruno" , nickname:  "Amigão")
        let Lucio = Person(nome: "Lucio" , nickname:  "Amigão")
        return [Bruno, Lucio]
    }
    
    public func searchPerson(_ searchString : String) -> [Person]{
        var results:[Person] = []
        for person in self.getListPerson() {
            if searchString.localizedCaseInsensitiveContains(person.nome) || searchString.localizedCaseInsensitiveContains(person.nome) || person.nickname.localizedCaseInsensitiveContains(searchString) || person.nickname.localizedCaseInsensitiveContains(searchString) {
                results.append(person)
            }
        }
        return results
    }

}
