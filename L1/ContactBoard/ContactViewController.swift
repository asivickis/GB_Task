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


    
    private func appendContacts() {
        
        contacts.append(myContacts(firstName: "Max", lastName: "Ahmedov", number: "6732564"))
        contacts.append(myContacts(firstName: "Aleksandrs", lastName: "Jablonev", number: "8473205"))
        contacts.append(myContacts(firstName: "Maria", lastName: "Cicvarkina", number: "2956734"))
        contacts.append(myContacts(firstName: "Jura", lastName: "Dudj", number: "9123758"))
        
    }
    
    private func show_details() {
        let storyBoard = UIStoryboard(name: "DetailedBoard", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? DetailedViewController {
            self.present(viewController, animated: true)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
    }
    
}

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let sorted_contacts = contacts.sorted { $0.firstName < $1.firstName }
        cell.textLabel?.text = sorted_contacts[indexPath.row].firstName
        cell.detailTextLabel?.text = sorted_contacts[indexPath.row].lastName
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        show_details()
        
    }
}

