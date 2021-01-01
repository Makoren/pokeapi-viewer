//
//  DataViewController.swift
//  pokeapi-viewer
//
//  Created by Luke Lazzaro on 1/1/21.
//

import UIKit
import SwiftyJSON

class DataViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var canLearnLabel: UILabel!
    
    var jsonData: JSON?
    var pokemonImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let pokemonData = jsonData else {
            fatalError("Something went terribly wrong with JSON validation.")
        }
        
        nameLabel.text = pokemonData["name"].rawString()
        imageView.image = pokemonImage
        
        typeLabel.text = pokemonData["types"][0]["type"]["name"].rawString()
        abilitiesLabel.text = pokemonData["abilities"][0]["ability"]["name"].rawString()
        canLearnLabel.text = pokemonData["moves"][0]["move"]["name"].rawString()
    }

}
