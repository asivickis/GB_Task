//
//  ContactViewController.swift
//  L1
//
//  Created by Aleksandrs Sivickis on 14/09/2021.
//
//Было интересно как контактами заполнить, нашел это - https://github.com/ioscreator/ioscreator/tree/master/IOSFetchContactsTutorial
//Надо ещё пару фишек впихнуть и красивее сделать, но мысль понял

import UIKit
//import Contacts

/*
//struct for contacts

struct FetchedContacts {
    var firstName: String
    var lastName: String
    var telephone: String
}
*/

struct myContacts {
    var firstName: String
    var lastName: String
    var number : String
}

class NavContactViewController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ContactViewController: UIViewController {
    
    @IBOutlet private weak var contactTable: UITableView!
    
    override func viewDidLoad() {
        //func to download contacts
        //fetchContacts()
        appendContacts()
        super.viewDidLoad()
        self.contactTable.delegate = self
        self.contactTable.dataSource = self
    }
    
    var contacts = [myContacts]()
    var sorted_contacts = [myContacts]()
    var contacts_dictionary : [String : [String]] = [:]
    
    
    private func appendContacts() {
        
        contacts.append(myContacts(firstName: "Max", lastName: "Ahmedov", number: "6732564"))
        contacts.append(myContacts(firstName: "Aleksandrs", lastName: "Jablonev", number: "8473205"))
        contacts.append(myContacts(firstName: "Maria", lastName: "Cicvarkina", number: "2956734"))
        contacts.append(myContacts(firstName: "Jura", lastName: "Dudj", number: "9123758"))
        contacts.append((myContacts(firstName: "Jana", lastName: "Sicilijska", number: "8533274")))
        contacts.append((myContacts(firstName: "Michael", lastName: "McMaster", number: "93342567")))
        sorted_contacts = contacts.sorted { $0.firstName < $1.firstName }
        
        
        //Creating dictionary
        var contacts_firstName : [String] = []
        for i in sorted_contacts {
            contacts_firstName.append(i.firstName)
        }
        contacts_dictionary = contacts_firstName.reduce(into: [String:[String]]()) { result, element in
            guard let first = element.first else { return }
            let initial = String(first)
            result[initial] = (result[initial] ?? []) + [element]
        }
        print(contacts_dictionary)
        
    }
    
    private func show_details(indexPath : IndexPath) {
        let storyBoard = UIStoryboard(name: "DetailedBoard", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? DetailedViewController {
            let name = sorted_contacts[indexPath.row].firstName
            let surname = sorted_contacts[indexPath.row].lastName
            let number = sorted_contacts[indexPath.row].number
            viewController.name_surname = "\(name + " " + surname)"
            viewController.phone_number = "\(number)"
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    //variable for contacts and func to get them
    /*
    var contacts = [FetchedContacts]()
    
    private func fetchContacts() {
        
        // 1.
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                // 2.
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    // 3.
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContacts(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    */

}


extension ContactViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts_dictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Ne ponimaju po4emu tut 3 vse vremja i kak pravilno vivezti iz dictionary
        return self.contacts_dictionary.values.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
    }
    
}

extension ContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = sorted_contacts[indexPath.row].firstName
        cell.detailTextLabel?.text = sorted_contacts[indexPath.row].lastName
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(indexPath.row)
        //print(contacts[indexPath.row].lastName)
        self.show_details(indexPath: indexPath)
        
    }
}

