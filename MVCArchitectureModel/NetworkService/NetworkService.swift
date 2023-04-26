//
//  NetworkService.swift
//  MVCArchitectureModel
//
//  Created by mayank ranka on 26/04/23.
//

import UIKit

class NetworkService: NSObject {

    static let shared = NetworkService()
    private override init(){ }
    private  var user : UserModel?
    
    func login(email : String, password : String, completion : @escaping(Bool) -> Void){
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async { [self] in
                if email == "Test@test.com" && password == "Password"{
                    user = UserModel(email: "Test@test.com", name:"Shubham", age: 22, password: "Password", address:"London")
//                    user?.name = "Shubham"
//                    user?.address = "london"
//                    user?.age = 22
//                    user?.email = "test@test.com"
//                    user?.password = "password"
                    completion(true)
                }else{
                    completion(false)
                }
            }
        }
    }
    
    func getLoggedInUser() -> UserModel?{
        
        return user
        
    }
}
