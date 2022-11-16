//
//  Extensions.swift
//  Instagram_Clone
//
//  Created by 大久保樹 on 2022/11/16.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
