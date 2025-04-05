//
//  Account.swift
//  IcecreamUscream
//
//  Created by Brenton Niebauer on 4/5/25.
//
import Foundation

struct UserAccount: Identifiable, Codable {
    var id = UUID()
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
}

@Observable
class Account {
    var user: UserAccount {
        didSet {
            UserDefaults.standard.set(try? JSONEncoder().encode(user), forKey: "user")
        }
    }
    
    init() {
        if let savedUser = UserDefaults.standard.data(forKey: "user") {
            if let decodedUser = try? JSONDecoder().decode(UserAccount.self, from: savedUser) {
                user = decodedUser
                return
            }
        }
        
        user = UserAccount()
    }
}
