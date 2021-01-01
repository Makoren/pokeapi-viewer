//
//  ViewController.swift
//  pokeapi-viewer
//
//  Created by Luke Lazzaro on 1/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var responseData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        var urlString = "https://pokeapi.co/api/v2/pokemon/"
        
        guard let text = textField.text else { return }
        urlString.append(text)
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                fatalError("Error: \(error?.localizedDescription ?? "No error provided")")
            }
            
            self.responseData = data
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "dataViewer", sender: nil)
            }
        }
        
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? DataViewController {
            // pass properties to this controller
            if let data = responseData {
                print(String(data: data, encoding: .utf8)!)
            }
        }
    }
    
}

