//
//  ViewController.swift
//  pokeapi-viewer
//
//  Created by Luke Lazzaro on 1/1/21.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var parsedJson: JSON?
    var pokemonImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        var urlString = "https://pokeapi.co/api/v2/pokemon/"
        
        guard let text = textField.text else { return }
        guard !text.isEmpty else { return }
        urlString.append(text)
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            guard let data = data else {
                fatalError("\(error?.localizedDescription ?? "No error provided")")
            }
            
            // Convert from JSON using SwiftyJSON
            do {
                self.parsedJson = try JSON(data: data)
                let json = self.parsedJson!
                
                if let imageUrl = json["sprites"]["front_default"].rawString() {
                    self.fetchPokemonImage(url: imageUrl)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchPokemonImage(url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            guard let imageData = data else {
                fatalError("\(error?.localizedDescription ?? "No error provided")")
            }
            self.pokemonImage = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "dataViewer", sender: nil)
            }
            
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? DataViewController {
            // previous validation means parsedJson cannot be nil here, safe to force unwrap
            dvc.jsonData = parsedJson!
            dvc.pokemonImage = pokemonImage
        }
    }
    
}

