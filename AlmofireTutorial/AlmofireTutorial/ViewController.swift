//
//  ViewController.swift
//  AlmofireTutorial
//
//  Created by Israel Torres Alvarado on 02/07/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var lblNameMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var lblDirectorName: UILabel!
    @IBOutlet weak var actorsTableView: UITableView!
    
    let repository: MovieRepository = MovieRepositoryImp()
    
    var actors: [ActorResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actorsTableView.dataSource = self
        actorsTableView.delegate = self
        
        repository.fetchMovieInfo { movie, error in
           
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let mov = movie else { return }
            
            self.dowloandImageMovie(url: mov.urlImage)
            self.lblNameMovie.text = mov.title
            self.releaseDate.text = "Fecha estreno: \(mov.release_date)"
            self.lblDirectorName.text = "Director: \(mov.director)"
            self.actors = mov.cast
            self.actorsTableView.reloadData()
            
        }
        
    }
    
    func dowloandImageMovie(url: String) {
        
        guard let urlImage = URL(string: url) else { return }
        
        AF.request(urlImage, method: .get).response { response in
            
            switch response.result {
                    
            case .success(let dataImage):
                
                guard let data = dataImage else { return }
                
                DispatchQueue.main.async {
                    self.imageMovie.image = UIImage(data: data)
                }

            case .failure(let error):
                
                debugPrint(error.localizedDescription)
            
            }
        
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let actor = actors[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Nombre: \(actor.name) \nPersonaje: \(actor.character)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Actores"
    }
    
}
