//
//  AccoutnView.swift
//  GM-Test
//
//  Created by Austin Beck on 2/20/21.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var bleManager = BLEManager()
    
    
    var body: some View {
        VStack {
            if bleManager.isSwitchedOn {
                Text("Connected")
                    .foregroundColor(.green)
                    .padding()
            } else {
                Text("Not Connected")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
            if bleManager.peripherals .isEmpty {
                VStack {
                    Divider()
                    HStack {
                        Text("Mailbox One").padding()
                        Button(action: {
                            //would need to know the characteristics of the mailbox to write the data via Bluetood
                            print("unlocking device")
                        }) {
                            Text("Unlock Mailbox")
                        }.padding()
                    }
                    Divider()
                    HStack {
                        Text("Mailbox Two").padding()
                        Button(action: {
                            //would need to know the characteristics of the mailbox to write the data via Bluetood
                            print("unlocking device")
                        }) {
                            Text("Unlock Mailbox")
                        }.padding()
                    }
                    Divider()
                }
            }
            ForEach(bleManager.peripherals){ peripheral in
                Text(peripheral.name).padding()
            }
            Spacer()
            HStack {
                Button(action: {
                    bleManager.startScanning()
                }) {
                    Text("Scan for Devices")
                }.padding()
                Button(action: {
                    bleManager.stopScanning()
                }) {
                    Text("Stop Scanning")
                }.padding()
            }
        }.navigationBarTitle("Connected Devices")
    }
}

struct AccoutnView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

