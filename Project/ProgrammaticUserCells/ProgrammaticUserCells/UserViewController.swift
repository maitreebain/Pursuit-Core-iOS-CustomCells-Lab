import UIKit

class UserViewController: UIViewController {
    
    let userView = UserView()
    
    private var users = [User]() {
        didSet{
            DispatchQueue.main.async {
                
            }
        }
    }
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        userView.collectionView.dataSource = self
        userView.collectionView.delegate = self
        loadUsers()
    }
    
    private func loadUsers() {
        UsersFetchingService.manager.getUsers { (result) in
            
            switch result {
            case .failure:
                print("users cannot be loaded")
            case .success(let userData):
                self.users = userData
            }
        }
    }
    
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast to UserCell")
        }
        
        return cell
    }
    
    
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
    
}
