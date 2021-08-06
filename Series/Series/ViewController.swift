//
//  ViewController.swift
//  Series
//
//  Created by Israel Torres Alvarado on 02/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seriesCollectionView: UICollectionView!
    
    var series: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        series = getSeries()
        seriesCollectionView.reloadData()
        seriesCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        
    }
    
    func getSeries() -> [String] {
        return ["24","Anatomia de Grey","Breaking Bad", "CSI","Deadwood","Dexter","Doctor Who","Expediente X","Friends","Fringe","Futurama","Heroes","House","Juego de Tronos","Los Simpsons","Los Soprano","Mad Men","Modern Family","Padre de Familia","Perdidos","Prison Break","South Park","The Big Bang Theory","The Walking Dead"]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier,
           identifier == "goToDetalle",
           let detalleVC = segue.destination as? DetalleSerieViewController,
           let nombreSerie = sender as? String {
            
            detalleVC.serie = nombreSerie
            
        }
        
    }
    

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SerieCollectionViewCell
        let serie = series[indexPath.row]
        cell.itemImage.image = UIImage(named: serie)
        cell.itemName.text = serie
        return cell
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10) / 2, height: 224)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let serie = series[indexPath.row]
        print(serie)
        performSegue(withIdentifier: "goToDetalle", sender: serie)
        
    }
    
    
}


