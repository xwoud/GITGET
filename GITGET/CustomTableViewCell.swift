//
//  CustomTableViewCell.swift
//  GITGET
//
//  Created by Bo-Young PARK on 05/12/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //profileCell
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var profileDetailLabel: UILabel!
    
    //themeCell
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var themeTitleLabel: UILabel!
    
    //detailCell
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailSubTitleLabel: UILabel!
    
    //modifiableCell
    @IBOutlet weak var modifiableTitleLabel: UILabel!
    @IBOutlet weak var modifiableTextField: UITextField!
    
    //contributionCell
    @IBOutlet weak var contributionUserNameTextLabel: UILabel!
    @IBOutlet weak var contributionsWebView: UIWebView!
    @IBOutlet weak var contributionsActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.reuseIdentifier == "contributionsCell" {
            self.contributionsWebView.delegate = self
            self.contributionsWebView.isHidden = true
            self.contributionsWebView.scrollView.bounces = false
        }else if self.reuseIdentifier == "themeCell" {
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CustomTableViewCell:UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let xPosition = webView.scrollView.contentSize.width - self.frame.width - 8
        self.contributionsActivityIndicator.startAnimating()
        webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('body')[0].style.fontFamily =\"-apple-system\"")
        webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('body')[0].style.fontSize = '10px'")
        webView.scrollView.contentOffset = CGPoint(x: xPosition, y: 0.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.contributionsWebView.isHidden = false
            self.contributionsActivityIndicator.stopAnimating()
        })
    }
}

