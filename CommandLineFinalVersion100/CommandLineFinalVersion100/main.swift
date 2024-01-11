//
//  main.swift
//  CommandLineFinalVersion100
//
//  Created by Mac on 11.01.2024.
//

import Foundation

/*Model (Модель)*/

/*КАРТА*/

/**
Протокол для класса Card
*/
protocol CardProtocol {
    var id: Int {get}
    var name: String {get}
    var icon: String {get}
    var paymentCategories: [PaymentCategory] {get}
}

/**
Класс с параметрами и инициализацией карты
*/
class Card {
    let id: Int // идентификатор карты
    let name: String // наименование карты
    let icon: String // изображение карты (пока в таком виде)
    //var variableProperties: [String: Any] // словарь для хранения дополнительных свойств карты
    var paymentCategories : [PaymentCategory] // массив категорий с процентами кэшбека

    /**
    Инициализация объекта класса
    
    - Parameters:
        - id: идентификатор карты
        - name: наименование карты
        - icon: изображение карты
    */
    init(id: Int, name: String, icon: String) {
        self.id = id
        self.name = name
        self.icon = icon
    //    self.variableProperties = [:]
        self.paymentCategories = []
    }
}

/**
Расширение класса Card
*/
extension Card: CardProtocol {}

/*КАТЕГОРИИ КЭШБЕКА*/

/**
Протокол для структуры PaymentCategory
*/
protocol PaymentCategoryProtocol {
    var category: String { get }
    var cashbackPercentage: Double { get }
    var minimumPurchaseAmount: Double { get }
}


/**
Структура категорий и процентов кэшбека
*/
struct PaymentCategory {
    let category: String // наименование категории/места оплаты
    let cashbackPercentage: Double // процент кэшбека для категории
    let minimumPurchaseAmount: Double // размер минимального чека
}

/*СБОРКА КАРТЫ*/

/**
Протокол для класса создания карты
*/
protocol CardBuildProtocol {
    //func setID(_ id: Int) -> Self
    func setName(_ name: String) -> Self
    func setIcon(_ icon: String) -> Self
    func addPaymentCategory(_ category: PaymentCategory) -> Self
    func build() -> Card?
    
}

/**
Класс для создания карты

В этом классе используются опциональные типы переменных, т.к. не все параметры обязательны
для указания при создании карты. Опциональный тип позволяет установить значение параметра,
если оно передано, или оставить его как nil, если данные отсутствуют.
*/

class CardBuilder {
    private var id: Int? // идентификатор карты
    private var name: String? // наименование карты
    private var icon: String? // изображение карты
    //private var variableProperties: [String: Any] = [:]
    private var paymentCategories: [PaymentCategory] = [] // массив категорий с процентами кэшбека

    enum CardBuildError: Error {
        case missingRequiredProperties
    }
}

extension CardBuilder: CardBuildProtocol {
// сеттеры
    func setID(_ id: Int) -> Self {
        self.id = id
        return self
    }

    func setName(_ name: String) -> Self {
        self.name = name
        return self
    }

    func setIcon(_ icon: String) -> Self {
        self.icon = icon
        return self
    }

// метод добавления дополнительных свойств карты
    // func addVariableProperty(variableKey: String, variableValue: Any) -> CardBuilder {
    //     self.variableProperties[variableKey] = variableValue
    //     return self
    // }

// метод добавления категории cashback в карту
    func addPaymentCategory(_ category: PaymentCategory) -> Self {

        // проверка на дублирование категорий (по имени) на одной карте
        guard !paymentCategories.contains(where: { $0.category == category.category })
        else {
            print("Внимание: Категория \(category.category) уже присутствует на карте \(name!) и не будет добавлена\n")
            return self
        }
        self.paymentCategories.append(category)
        return self
    }

// метод «сборки» карты с проверкой на наличие обязательных полей и обработкой исключений
    func build() -> Card? {
        do {
            guard let id = id, let name = name, let icon = icon else {
                throw CardBuildError.missingRequiredProperties
        }
        let newCard = Card(id: id, name: name, icon: icon)
        //newCard.variableProperties = variableProperties
        newCard.paymentCategories = paymentCategories

        // проверка процента кэшбека на положительное значение
        for category in newCard.paymentCategories {
            if category.cashbackPercentage <= 0 {
                print("Внимание: Категория \(category.category) карты \(name) имеет некорректный cashback (\(category.cashbackPercentage)%) и была удалена\n")
                newCard.paymentCategories.removeAll { $0.category == category.category }
                }
            }
            return newCard
        } catch CardBuildError.missingRequiredProperties {
            print("Ошибка: Не удалось создать карту – отсутствуют обязательные свойства!")
            return nil
        } catch {
            print("Ошибка: Не удалось создать карту из-за неизвестной ошибки: \(error)")
            return nil
        }
    }
}

/*УПРАВЛЕНИЕ КАРТАМИ*/

/**
Протокол для класса управления списком карт.
Определяет методы для добавления, получения списка карт и поиска карт с максимальным кэшбеком по категории.
*/
protocol CardManagerProtocol {
    // Свойство для хранения списка карт
    var cards: [CardProtocol] { get set }
    // Метод добавления карты в список
    func addCard(_ card: CardProtocol)
    // Метод получения списка карт
    func getCards() -> [CardProtocol]
    // Метод получения списка карт и поиска карт с мксимальным кэшбеком по категории
    func getCardWithMaxCashback(forCategory category: String) -> [CardProtocol]
}

/**
Класс для управления списком карт
*/
class CardManager {
    // Список карт
    var cards: [CardProtocol]
    // Инициализация
    init() {
        self.cards = []
    }
}

/**
Расширение класса, содержащее методы протокола
*/
extension CardManager: CardManagerProtocol {
    // Метод добавляет карту в список
    func addCard(_ card: CardProtocol) {
        cards.append(card)
    }
    // Метод возвращает список карт
    func getCards() -> [CardProtocol] {
        return cards
    }
    // Метод возвращает карты, соответствующих условию: макс кэшбек для указанной категории из общего списка
    func getCardWithMaxCashback(forCategory category: String) -> [CardProtocol] {
        // Получение макс кэшбека для указанной категории
        guard let maxCashback = cards.flatMap({ $0.paymentCategories })
            .filter ({ $0.category == category })
            .max (by: { $0.cashbackPercentage < $1.cashbackPercentage })?.cashbackPercentage
        else {
            return []
        }
        // Фильтрация карт по макс кэшбеку
        return cards.filter {
            card in card.paymentCategories.contains {
                $0.category == category && $0.cashbackPercentage == maxCashback
            }
        }
    }
}

/*View (Представление)*/
/*ПРОСМОТР ДАННЫХ КАРТ*/

/**
Протокол для класса отображения карты
*/
protocol CardViewProtocol {
    func displayCard(_ card: CardProtocol)
}

/**
Класс для отображения свойств карты
*/
class CardView {}

extension CardView: CardViewProtocol {
// метод, отображающий карту со всеми характеристиками
    func displayCard(_ card: CardProtocol) {
        print("ID карты: \(card.id)")
        print("Название карты: \(card.name)")
        print("Изображение карты: \(card.icon)")
        //print(«Пользовательские свойства:»)
        //for (key, value) in card.variableProperties {
            //print(«\(key): \(value)»)
        //}
        print("Категории оплаты:")
        for paymentCategory in card.paymentCategories {
            print("Категория: \(paymentCategory.category), Кэшбек: \(paymentCategory.cashbackPercentage)%")
        }
        print("***")
    }
}

/*Controller (Контроллер)*/
/*ЛОГИКА*/

/**
Протокол контроллера
*/
protocol CardControllerProtocol {
    func createCard()
}

/**
Класс контроллера
*/
class CardController {
    let cardManager: CardManager
    let cardView: CardView
    
    init(cardManager: CardManager, cardView: CardView) {
        self.cardManager = cardManager
        self.cardView = cardView
    }
}

/**
Расширение контроллера с методами
*/
extension CardController: CardControllerProtocol {
// метод, принимающий данные для создания экземпляров карт и создающий карты
    func createCard() {
        // карта 1
        if let card1 = CardBuilder()
            .setID(1)
            .setName("Зарплатная")
            .setIcon("card_icon1")
            //.addVariableProperty(variableKey: «monthlyCashback», variableValue: true)
            //.addVariableProperty(variableKey: «minimumPurchaseAmount», variableValue: 1000.0)
            .addPaymentCategory(PaymentCategory(category: "Ресторан", cashbackPercentage: 7.0, minimumPurchaseAmount: 0.0))
            .addPaymentCategory(PaymentCategory(category: "АЗС", cashbackPercentage: 2.0, minimumPurchaseAmount: 0.0))

            // тест с дублированием категории на одной карте
            .addPaymentCategory(PaymentCategory(category: "АЗС", cashbackPercentage: 4.0, minimumPurchaseAmount: 0.0))

            // тест с нулевым кэшбеком у категории
            .addPaymentCategory(PaymentCategory(category: "Супермаркет", cashbackPercentage: 0.0, minimumPurchaseAmount: 0.0))
            .build() {
                cardManager.addCard(card1)
            } else {
                print("Ошибка при создании карты 1\n")
            }
        // карта 2
        if let card2 = CardBuilder()
            .setID(2)
            .setName("Кредитная")
            .setIcon("card_icon2")
            //.addVariableProperty(variableKey: «monthlyCashback», variableValue: false)
            .addPaymentCategory(PaymentCategory(category: "Ресторан", cashbackPercentage: 7.0, minimumPurchaseAmount: 1000.0))

            // тест с отрицательным кэшбеком у категории
            .addPaymentCategory(PaymentCategory(category: "Аптека", cashbackPercentage: -5.0, minimumPurchaseAmount: 1000.0))
            .build() {
                cardManager.addCard(card2)
            } else {
                print("Ошибка при создании карты 2\n")
            }
        // карта 3
        if let card3 = CardBuilder()
            .setID(3)

            // тест с отсутствием обязательного параметра у карты
            //.setName(«Дебетовая»)
            .setIcon("card_icon3")
            //.addVariableProperty(variableKey: «monthlyCashback», variableValue: true)
            //.addVariableProperty(variableKey: «minimumPurchaseAmount», variableValue: 1000.0)
            .addPaymentCategory(PaymentCategory(category: "Ресторан", cashbackPercentage: 5.0, minimumPurchaseAmount: 0.0))
            .addPaymentCategory(PaymentCategory(category: "Кино", cashbackPercentage: 2.0, minimumPurchaseAmount: 0.0))
            .addPaymentCategory(PaymentCategory(category: "Кафе", cashbackPercentage: 0.0, minimumPurchaseAmount: 0.0))
            .build() {
                cardManager.addCard(card3)
            } else {
                print("Ошибка при создании карты 3\n")
            }
    }
}

/*Main*/
print("*** Реализация кода для создания и поиска карты с макс кэшбеком с проверками. Применение протоколов, структур, методов, классов, расширений. Последний консольный релиз *** \n")
let cardManager = CardManager()
let cardView = CardView()
let cardController = CardController(cardManager: cardManager, cardView: cardView)

cardController.createCard()

// вывод в консоль всех карт с параметрами для анализа отработки исключений (CP>0, CP!=CP)
let allCards = cardManager.getCards()
for card in allCards {
    cardView.displayCard(card)
}

let selectedCategory = "Ресторан" // назначение переменной места оплаты (категории кэшбека)
let cardWithMaxCashback = cardManager.getCardWithMaxCashback(forCategory: selectedCategory) // формирование списка карт по условию

if !cardWithMaxCashback.isEmpty {
    print("\nКАРТЫ С НАИБОЛЬШИМ РАЗМЕРОМ CASHBACK ДЛЯ КАТЕГОРИИ '\(selectedCategory)':\n")

// вывод в консоль списка карт с нужными данными
    for card in cardWithMaxCashback {
        print("Имя карты: \(card.name)")
        if let paymentCategory = card.paymentCategories.first(where: { $0.category == selectedCategory }) {
            print("Процент cashback: \(paymentCategory.cashbackPercentage)%")
            print("Минимальный чек для начисления casback: \(paymentCategory.minimumPurchaseAmount)")
        }
        print("---")
    }
} else {
    print("Нет карт с категорией '\(selectedCategory)'")
}






