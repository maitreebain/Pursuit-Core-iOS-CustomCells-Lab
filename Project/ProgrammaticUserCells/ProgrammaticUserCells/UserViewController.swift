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
    }
    
    private func loadUsers(_ data: Data) {
        users = User.getUsers(from: data)
    }
    
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
    
    
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
    
}
