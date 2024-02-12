//
//  AddCardViewController+Tables.swift
//  AppSwiftUIMyDiplomaVersion101
//
//  Created by Mac on 05.02.2024.
//

import UIKit

extension AddCardViewController {
    
    func setupTableView(belowLine button: UIView) {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Устанавливаем ограничения для таблицы под указанной линией
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10), // Располагаем таблицу под линией с отступом
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), // Начало таблицы с отступом слева
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10), // Конец таблицы с отступом справа
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60) // Дно таблицы с отступом
        ])

        // Добавляем название "Список кэшбеков" как заголовок к таблице
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        //tableHeaderView.backgroundColor = .lightGray

        // Создаем и настраиваем UILabel для заголовка
        let titleLabel = UILabel()
        titleLabel.text = "Список кэшбеков"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black // Цвет текста
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14) // Размер и шрифт текста
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeaderView.addSubview(titleLabel)
        
        // Устанавливаем ограничения для заголовка
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: tableHeaderView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: tableHeaderView.centerYAnchor)
        ])

        tableView.tableHeaderView = tableHeaderView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection вызван")
        return cashbacks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt вызван для indexPath: \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cashback = cashbacks[indexPath.row]
        let cellText = "Category: \(cashback.category), Percentage: \(cashback.percentage)%"
        cell.textLabel?.text = cellText
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Обработка выбора кэшбека
    }


    // Дополнительные методы и функциональность

}
