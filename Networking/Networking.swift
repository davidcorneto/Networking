//
//  Networking.swift
//  Networking
//
//  Created by Darko Jovanovski on 12/10/16.
//  Copyright © 2016 Darko Jovanovski. All rights reserved.
//

import UIKit
import Alamofire

class Networking: NSObject {
    let BASE_URL: String = "YOUR_BASE_URL"
    let headers = ["Content-Type":"application/json"]
    
    private func get(endpoint: String, success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        let url = BASE_URL+endpoint
        let queue = DispatchQueue(label: "com.darkojovanovski.manager-response-queue", qos: .userInitiated, attributes: .concurrent)
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON(queue: queue, options: .allowFragments, completionHandler: { (response:DataResponse<Any>) in
                if (response.response?.statusCode) != nil{
                    let statusCode = (response.response?.statusCode)! as Int
                    print("GET URL",url,statusCode)
                }
                else{
                    print("GET URL",url)
                }
                
                switch(response.result) {
                case .success(_):
                    if(response.response?.statusCode == 200){
                        let JSON = response.result.value as AnyObject!
                        success(JSON!)
                        break
                    }
                    else{
                        failed(response.result.value as AnyObject!)
                        break
                    }
                case .failure(_):
                    failed(response.result.error?.localizedDescription as AnyObject!)
                    break
                }
            })
    }
    private func post(endpoint: String, body:[String:AnyObject], success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        let url = BASE_URL+endpoint
        let queue = DispatchQueue(label: "com.darkojovanovski.manager-response-queue", qos: .userInitiated, attributes: .concurrent)
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseJSON(queue: queue, options: .allowFragments, completionHandler: { (response:DataResponse<Any>) in
                if (response.response?.statusCode) != nil{
                    let statusCode = (response.response?.statusCode)! as Int
                    print("POST URL",url,statusCode)
                }
                else{
                    print("POST URL",url)
                }
                
                switch(response.result) {
                case .success(_):
                    if(response.response?.statusCode == 200){
                        let JSON = response.result.value as AnyObject!
                        success(JSON!)
                        break
                    }
                    else{
                        failed(response.result.value as AnyObject!)
                        break
                    }
                case .failure(_):
                    failed(response.result.error?.localizedDescription as AnyObject!)
                    break
                }
            })
    }
    private func put(endpoint:String, body:[String:AnyObject]?, success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        let url = BASE_URL+endpoint
        let queue = DispatchQueue(label: "com.darkojovanovski.manager-response-queue", qos: .userInitiated, attributes: .concurrent)
        Alamofire.request(url, method: .put, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseJSON(queue: queue, options: .allowFragments, completionHandler: { (response:DataResponse<Any>) in
                if (response.response?.statusCode) != nil{
                    let statusCode = (response.response?.statusCode)! as Int
                    print("PUT URL",url,statusCode)
                }
                else{
                    print("PUT URL",url)
                }
                
                switch(response.result) {
                case .success(_):
                    if(response.response?.statusCode == 200){
                        let JSON = response.result.value as AnyObject!
                        success(JSON!)
                        break
                    }
                    else{
                        failed(response.result.value as AnyObject!)
                        break
                    }
                case .failure(_):
                    failed(response.result.error?.localizedDescription as AnyObject!)
                    break
                }
            })
    }
    private func delete(endpoint:String, body:[String:AnyObject]?, success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        let url = BASE_URL+endpoint
        let queue = DispatchQueue(label: "com.darkojovanovski.manager-response-queue", qos: .userInitiated, attributes: .concurrent)
        Alamofire.request(url, method: .delete, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseJSON(queue: queue, options: .allowFragments, completionHandler: { (response:DataResponse<Any>) in
                if (response.response?.statusCode) != nil{
                    let statusCode = (response.response?.statusCode)! as Int
                    print("PUT URL",url,statusCode)
                }
                else{
                    print("PUT URL",url)
                }
                
                switch(response.result) {
                case .success(_):
                    if(response.response?.statusCode == 200){
                        let JSON = response.result.value as AnyObject!
                        success(JSON!)
                        break
                    }
                    else{
                        failed(response.result.value as AnyObject!)
                        break
                    }
                case .failure(_):
                    failed(response.result.error?.localizedDescription as AnyObject!)
                    break
                }
            })
    }
    func postSomething(postDict:[String:AnyObject], success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        self.post(endpoint: "YOUR_ENDPOINT_URL", body: postDict, success: { dict in
            success(dict)
        }) { message in
            failed(message)
        }
    }
    func getSomething(success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        self.get(endpoint: "YOUR_ENDPOINT_URL", success: { dict in
            success(dict)
        }) { message in
            failed(message)
        }
    }
    func putSomething(putID: String, success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        self.put(endpoint: String(format:"YOUR_ENDPOINT_URL",putID), body: nil, success: { dict in
            success(dict)
        }) { message in
            failed(message)
        }
    }
    func deleteSomething(deleteID: String, success:@escaping (AnyObject) -> Void, failed:@escaping (AnyObject) -> Void){
        self.delete(endpoint: String(format:"YOUR_ENDPOINT_URL",deleteID), body: nil, success: { dict in
            success(dict)
        }) { message in
            failed(message)
        }
    }
    
}
