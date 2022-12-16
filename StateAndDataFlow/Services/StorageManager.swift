//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mayyura on 15.12.2022.
//

import Foundation
import SwiftUI

class StorageManager: ObservableObject {
    @AppStorage("username") var userName = ""
}
