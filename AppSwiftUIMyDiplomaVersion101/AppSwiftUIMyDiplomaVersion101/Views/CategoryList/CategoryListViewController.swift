//
//  CategoryListViewController.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 17.01.2024.
//

import UIKit

class CategoryListViewController: UITableViewController, CategoryDataProviderObserverProtocol {
    var categories: [CategoryModel] = []
    
    lazy var categoryManager: CategoryManager = {
        let coreDataStack = CoreDataStack.shared
        let categoryDataProvider = CategoryDataProvider(context: coreDataStack.context)
        let manager = CategoryManager()
        manager.dataProvider = categoryDataProvider
        return manager
    }()
    
    let openAddCategoryWindowButton = RoundButtonWithSettings(title: "+", backgroundColor: .systemBlue, titleColor: .white)

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список категорий"
        self.tabBarItem.title = "Категории"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        categoryManager.dataProvider.addObserver(self)

        updateData()
        
        configure(openAddCategoryWindowButton)

        let buttonHeight: CGFloat = openAddCategoryWindowButton.frame.size.height
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: buttonHeight, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset
  
    }

    func updateData() {
        // TODO: отладочный принт - пока не отловил проблему почему метод вызывается 3 раза, подозреваю что дело в Обсервере
//        let trace = Thread.callStackSymbols.joined(separator: "\n")
//        debugPrint("Метод CategoryListViewController.updateData запущен with stack trace:\n\(trace)")
        
        DispatchQueue.global().async {
            self.categoryManager.getCategories { categories in
                DispatchQueue.main.async {
                    self.categories = categories
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func categoryDataDidChange() {
        updateData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]

        cell.textLabel?.text = category.name
        
        let categoryIcon = category.icon
        cell.imageView?.image = categoryIcon
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        let message = "Выбрана категория: \(selectedCategory.name)"
        PopupStub.showPopup(title: "Заглушка", message: message, viewController: self)
    }
}

