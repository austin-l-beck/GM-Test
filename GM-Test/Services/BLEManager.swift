//
//  BLEManager.swift
//  GM-Test
//
//  Created by Austin Beck on 2/20/21.
//

import Foundation
import CoreBluetooth

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var peripherals = [Peripheral]()
    @Published var isSwitchedOn = false
    var myCentral: CBCentralManager!
    
    override init() {
        super.init()
        
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        
        var peripheralName: String!
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        } else {
            peripheralName = "Unknown"
        }
        
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
        print(newPeripheral)
        peripherals.append(newPeripheral)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        } else {
            isSwitchedOn = false
        }
    }
    
    func startScanning() {
        print("scanning")
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScanning() {
        print("scanning stopped")
        myCentral.stopScan()
    }
}

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

let testPeripheral = [
    Peripheral(id: 1, name: "Mailbox One", rssi: 183245),
    Peripheral(id: 2, name: "Mailbox Two", rssi: 183294)
]
