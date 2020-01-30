import UIKit

class UserViewController: UIViewController {
    
    let userView = UserView()
    
    private var users = [User]() {
        didSet{
            DispatchQueue.main.async {
                self.userView.collectionView.reloadData()
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
        
        userView.collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
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
        
        let selectedUser = users[indexPath.row]
        
        cell.configureCell(selectedUser)
        
        return cell
    }
    
    
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.95
        
        return CGSize(width: itemWidth, height: 120)
    }
    
    
}
