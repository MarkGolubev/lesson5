//
//  main.swift
//  lesson5
//
//  Created by Марк Голубев on 18.03.2021.
//

import Foundation

enum Brand: String {
    case tesla = "Тесла"
    case kia = "Киа"
    case honda = "Хонда"
}

enum EngineState: String {
    case on = "запущен"
    case off = "заглушен"
}

protocol CarProtocol: class {
    
    var transmissionAuto: Bool { get }
    var brand: Brand { get }
    var engineState: EngineState {get set }
    
    func turnOnEngine()
    func turnOffEngine()
}

extension CarProtocol {
    
    func turnOnEngine() {
        engineState = .on
        print("*звук запуска двигателя*")
    }
    
    func turnOffEngine() {
        engineState = .off
        print("*звук заглушения двигателя*")
    }
}

class SportCar: CarProtocol {
    
    enum Model {
        case desertEagle
        case windSerfer
    }
    
    enum SwitchTurbo {
        case on, off
    }
    
    let model: Model
    var transmissionAuto: Bool
    var brand: Brand
    var engineState: EngineState
    var turboAccelerationOn: Bool
    
    init(model: Model, transmissionAuto: Bool, brand: Brand, engineState: EngineState, turboAccelerationOn: Bool) {
        self.model = model
        self.transmissionAuto = transmissionAuto
        self.brand = brand
        self.engineState = engineState
        self.turboAccelerationOn = turboAccelerationOn
    }
    
    func switchTurbo(action: SwitchTurbo) {
        switch action {
        case .on:
            turboAccelerationOn = true
            print("*выпускается огненая струя*")
        default:
            turboAccelerationOn = false
            print("*в воздухе остался запах закиси азота*")
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\nСупер-пупер \(brand.rawValue) модели \(model) c \(self.transmissionAuto ? "автоматической" : "ручной") коробкой передач. Двигатель сейчас \(engineState.rawValue), нитро-ускорение \(self.turboAccelerationOn ? "активировано" : "деактивировано").\n"
    }
}

class TruckCar: CarProtocol {
    
    enum Model {
        case bigFoot
        case cyberTruck
    }
    
    enum TrunkState: String {
        case full = "полный"
        case empty = "пустой"
    }
    
    let model: Model
    var transmissionAuto: Bool
    var brand: Brand
    var engineState: EngineState
    var trunkState: TrunkState
    
    init(model: Model, transmissionAuto: Bool, brand: Brand, engineState: EngineState, trunkState: TrunkState) {
        self.model = model
        self.transmissionAuto = transmissionAuto
        self.brand = brand
        self.engineState = engineState
        self.trunkState = trunkState
    }
    
    func unloadTrunk(){
        trunkState = .empty
        print("*кузов откинут*")
    }
    
    func loadTrunk(){
        trunkState = .full
        print("*кузов забит под завязку*")
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "\nСуровая \(brand.rawValue) модели \(model) c \(self.transmissionAuto ? "автоматической" : "ручной") коробкой передач. Двигатель сейчас \(engineState.rawValue), кузов сейчас \(trunkState.rawValue).\n"
    }
}

var sportCar = SportCar(model: .desertEagle, transmissionAuto: true, brand: .tesla, engineState: .off, turboAccelerationOn: false)
var sportCar2 = SportCar(model: .windSerfer, transmissionAuto: false, brand: .honda, engineState: .on, turboAccelerationOn: true)

print(sportCar)
sportCar.turnOnEngine()
sportCar.switchTurbo(action: .on)

print(sportCar2)
sportCar2.turnOffEngine()
sportCar2.switchTurbo(action: .off)

var truckCar = TruckCar(model: .cyberTruck, transmissionAuto: false, brand: .tesla, engineState: .off, trunkState: .empty)
var truckCar2 = TruckCar(model: .bigFoot, transmissionAuto: false, brand: .kia, engineState: .on, trunkState: .full)

print(truckCar)
truckCar.loadTrunk()
truckCar.turnOnEngine()

print(truckCar2)
truckCar.unloadTrunk()
truckCar.turnOffEngine()
