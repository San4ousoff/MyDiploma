//
//  EditCardViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

class EditCardViewController: UIViewController {
    var cardManager: CardManagerProtocol // зависимость от менеджера карт
    var card: CardModel? // редактируемая карта, если таковая имеется

    init(cardManager: CardManagerProtocol, card: CardModel?) {
        self.cardManager = cardManager
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
