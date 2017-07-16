//
//  ForgotInteractor.swift
//  task1
//
//  Created Quan Tran on 7/2/17.
//  Copyright © 2017 Quan Tran. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ForgotInteractor: ForgotInteractorProtocol {

    weak var presenter: ForgotPresenterProtocol?

    func inputDataPass(userName: String, kindOfSecurity: String, isEmail: Bool) {
        do{
            let data = try checkValidateInput(userName: userName, kindOfSecurity: kindOfSecurity, isEmail: isEmail)
            let queue = DispatchQueue(label: "inputDataPass_Email")
            queue.async {
                self.postJson(json: data)
            }
        }catch let error as errorEmail{
            print(handleErrorWithEmail(error: error))
            presenter?.respondDataPass(false)
        }catch let error as errorNumberPhone{
            print(handleErrorWithNumphone(error: error))
            presenter?.respondDataPass(false)
        }catch{
            print("Something went wrong, are you feeling OK?")
            presenter?.respondDataPass(false)
        }
    }


    func inputDataUser(cmnd: String, birthday: String, kindOfSecurity: String, isEmail: Bool) {

        do {
            let data =  try checkValidateInputForgotUserName(license: cmnd, birthday: birthday, kindOfSecurity: kindOfSecurity, isEmail: isEmail)
            let queue3 = DispatchQueue(label: "inputDataUser_Email")
            queue3.async {
                self.postJson(json: data)
            }

        } catch let errorWithLicense as errorLicense {
            print(handleErrorWithLicense(error: errorWithLicense))
            presenter?.respondDataUser(false)
        }catch let errorBirtDay as errorDate{
            print(handleValidateBirthDay(error: errorBirtDay))
            presenter?.respondDataUser(false)
        }
        catch let error as errorEmail{
            print(handleErrorWithEmail(error: error))
            presenter?.respondDataUser(false)
        }catch let error as errorNumberPhone{
            print(handleErrorWithNumphone(error: error))
            presenter?.respondDataUser(false)        }
        catch{
            print("Something went wrong, are you feeling OK?")
            presenter?.respondDataUser(false)
        }
    }
    func postJson(json:Any){
        let url = URL(string: "https://dev-dbs.ntex.vn/user/forgot/info")
        var urlRepuest = URLRequest(url: url!)
        urlRepuest.httpMethod = "POST"
        urlRepuest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRepuest.addValue("checkingData", forHTTPHeaderField: "checking")
        urlRepuest.httpBody = try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        let session = URLSession.shared
        session.dataTask(with: urlRepuest) { (data, res, err) in
            if err != nil{
                self.presenter?.respondDataPass(false)
            }else{
                if let httpResponse = res as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    self.presenter?.respondDataPass(true)
                }
            }
        }.resume()
    }
    func isValidEmail(testStr:String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"

        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = testStr as NSString
            let results = regex.matches(in: testStr, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                returnValue = false
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }

        return  returnValue

    }

    func checkValidateInputForgotUserName( license: String, birthday:String, kindOfSecurity: String, isEmail: Bool) throws -> Any{
        guard license.characters.count != 0 else {
            throw errorLicense.emptyLicense
        }
        guard Int(license) != nil else {
            throw errorLicense.notValidLicense
        }
        guard license.characters.count == 9 else {
            throw errorLicense.notValidLicense
        }
        guard birthday.characters.count != 0 else {
            throw errorDate.emptyDate
        }
        guard isEmail else {
            guard kindOfSecurity.characters.count != 0 else {
                throw errorNumberPhone.emptyNumberPhone
            }
            guard Int(kindOfSecurity) != nil else {
                throw errorNumberPhone.notNumber
            }
            guard kindOfSecurity.characters.count >= 10 && kindOfSecurity.characters.count <= 12 else {
                throw errorNumberPhone.numberPhoneNotExist
            }
            return DataUserWithNumPhone(license: license, phoneNumber: kindOfSecurity).toJson()
        }
        guard kindOfSecurity.characters.count != 0 else {
            throw errorEmail.emptyEmail
        }
        guard isValidEmail(testStr: kindOfSecurity) else {
            throw errorEmail.errorFormatEmail
        }
        return DataUserWithEmail(license: license, email: kindOfSecurity).toJson()
    }
    func handleErrorWithLicense(error: errorLicense) ->String{
        print("")
        let prefix = "Request Failed."

        switch error {

            case .emptyLicense:
                return "\(prefix) Empty License?"
            case .notValidLicense:
                return "\(prefix) Error format License?"
            case .notExistLicense:
                return  "\(prefix) License does not exist!"
        }
    }
    func handleValidateBirthDay(error: errorDate) -> String{
        print("")
        let prefix = "Request Failed."

        switch error {

            case .emptyDate:
                return "\(prefix) Empty BirthDay?"
            case .errorFormat:
                return "\(prefix) Error format BirthDay?"

        }

    }
    func checkValidateInput(userName: String, kindOfSecurity: String, isEmail: Bool) throws -> Any {
        guard userName != "" else {
            throw errorEmail.emptyEmail
        }
        guard isValidEmail(testStr: userName) else {
            throw errorEmail.errorFormatEmail
        }

        guard isEmail else {
            guard kindOfSecurity.characters.count != 0 else {
                throw errorNumberPhone.emptyNumberPhone
            }
            guard Int(kindOfSecurity) != nil else {
                throw errorNumberPhone.notNumber
            }
            guard kindOfSecurity.characters.count >= 10 && kindOfSecurity.characters.count <= 12 else {
                throw errorNumberPhone.numberPhoneNotExist
            }
            return DataPassWithNumPhone(userName: userName, phoneNumber: kindOfSecurity).toJson()
        }
        guard kindOfSecurity.characters.count != 0 else {
            throw errorEmail.emptyEmail
        }
        guard isValidEmail(testStr: kindOfSecurity) else {
            throw errorEmail.errorFormatEmail
        }
        return DataForPassWithEmail(userName: userName, email: kindOfSecurity).toJson2()
    }
    func handleErrorWithEmail(error :errorEmail) -> String{

        print("")
        let prefix = "Request Failed."

        switch error {

            case .emptyEmail:
                return "\(prefix) Empty Email?"
            case .errorFormatEmail:
                return "\(prefix) It is doesn't Email?"

        }

    }
    func handleErrorWithNumphone(error : errorNumberPhone) -> String{
        print("")
        let prefix = "Request Failed."

        switch error {

        case .emptyNumberPhone:
            return "\(prefix) Empty Number Phone?"
        case .notNumber:
            return "\(prefix) It is doesn't Number Phone?"
        case .numberPhoneNotExist:
            return "\(prefix) Your Phone is not Exist!"
            
        }

    }
}
