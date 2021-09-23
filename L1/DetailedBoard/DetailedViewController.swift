//
//  DetailedViewController.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 16/09/2021.
//

import UIKit

//Хочу в каждую colletion view засунуть инфу с таблицы

class DetailedViewController : UIViewController {
    
    @IBOutlet private weak var CollectionView: UICollectionView!
    
    @IBOutlet private weak var passNameSurname: UILabel!
    
    @IBOutlet private weak var passPhone: UILabel!
    
    var name_surname: String?
    var phone_number: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passNameSurname.text = name_surname
        self.passPhone.text = phone_number
        print(passNameSurname.text!)
        
    }
}

extension DetailedViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
     
}
