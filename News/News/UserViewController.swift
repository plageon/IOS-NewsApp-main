

import Foundation
import UIKit

class UserViewController: UIViewController
{
    let defaults = UserDefaults.standard
    let uuidKey = "UUID"
    let keyKey = "KEY"
    
    @IBOutlet weak var uuid_preference: UITextField!
    
    @IBOutlet weak var key_preference: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        defaults.set("2019302110253", forKey: uuidKey)
        uuid_preference.text = defaults.string(forKey: uuidKey)
        
        
    }
    @IBAction func LoginButtonPressed(_ sender: Any) {
        let id = uuid_preference.text!
        let password = key_preference.text!
        uuid_preference.resignFirstResponder()
        key_preference.resignFirstResponder()
        
        if id == "2019302110253" && password == "0"
        {
            let mainBoard:UIStoryboard! = UIStoryboard(name:"Main",bundle:nil )
            let VCMain = mainBoard!.instantiateViewController(withIdentifier:"vcMain")
            
            UIApplication.shared.windows[0].rootViewController = VCMain
        }
        else
        {
            //self.dismiss(animated:true, completion:nil)
            let p = UIAlertController(title:"登录失败", message:"用户名或密码错误", preferredStyle: .alert)
            p.addAction(UIAlertAction(title:"确定",style: .default,
                                      handler:{(
                                        act:UIAlertAction) in
                                        self.key_preference.text = ""}
                                        ))
            present(p, animated:false, completion:nil)
        }
        
    }
}

