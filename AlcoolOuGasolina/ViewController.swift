//
//  ViewController.swift
//  AlcoolOuGasolina
//
//  Created by Bruno on 03/09/17.
//  Copyright © 2017 Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var txtPrecoAlcool: UITextField!
    @IBOutlet weak var txtPrecoGasolina: UITextField!
    @IBOutlet weak var txtResultado: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func calcular(_ sender: UIButton) {
        
        if let precoAlcool = txtPrecoAlcool.text {
            if let precoGasolina = txtPrecoGasolina.text {
                let resultado = validarCampo(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if resultado {
                    calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                } else {
                    txtResultado.text = "Digite os valores para calcualar"
                }
            }
        }
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                if valorGasolina * 0.70 > valorAlcool {
                    txtResultado.text = "Melhor colocar alcool!"
                } else {
                    txtResultado.text = "Melhor colocar gasolina!"
                }
            }
        }
        
    }
    
    func validarCampo(precoAlcool: String, precoGasolina: String) -> Bool {
        var camposValidados = true
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        return camposValidados
    }

}

