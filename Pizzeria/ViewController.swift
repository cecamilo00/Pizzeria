//
//  ViewController.swift
//  Pizzeria
//
//  Created by camilo cabrales on 10/11/15.
//  Copyright © 2015 camilocabrales. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    
    @IBOutlet var ddlTamaños: UIPickerView!
    var tamañosPizza :[String] = [String]()
    var seleccion : String?
    var pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tamañosPizza = ["Chica","Mediana","Grande"]
        ddlTamaños.delegate = self
        ddlTamaños.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVista = segue.destinationViewController as! TipoMasaViewController
        var valor  = seleccion!
        pizza.tamaño = valor
        siguienteVista.pizza = pizza
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamañosPizza.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamañosPizza[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        seleccion = tamañosPizza[Int(row.value)]
    }
    
    

}

