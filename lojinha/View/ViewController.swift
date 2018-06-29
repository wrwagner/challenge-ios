//
//  ViewController.swift
//  lojinha
//
//  Created by Wagner Rodrigues on 26/06/2018.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imCollectionView: UIImageView!

    var banner = [Banner]()
    var imageArray = [DataBanner]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        let jsonUrlString = "https://alodjinha.herokuapp.com/banner"
        guard let url = URL(string: jsonUrlString) else { return }


        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    self.imageArray = try JSONDecoder().decode([Banner].self, from: data! )
                }catch {
                    print("Error Parse")
                    print(error)
                }

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }

            }.resume()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath ) as! ViewController

        let link = imageArray[indexPath.row].urlImagem
        cell.imCollectionView.downloadedFrom(link: link)


        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DescriptionViewController") as! CategoryViewController
//        desVC.movie = imageArray[indexPath.row]
//        desVC
//
//        desVC.descTitle = imageArray[indexPath.row].overview

        self.navigationController?.pushViewController(desVC, animated: true)

    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

