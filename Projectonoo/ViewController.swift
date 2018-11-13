//
//  ViewController.swift
//  Projectonoo
//
//  Created by Yingcan Chen on 9/30/18.
//  Copyright © 2018 Yingcan Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Funfacts: UILabel!
    //@IBOutlet weak var funfacts: UILabel!
    @IBOutlet weak var Swipedown: UILabel!
    
    @IBOutlet weak var Swipeup: UILabel!
    //@IBOutlet weak var gestureup: UIView!
    
    
    @IBOutlet weak var taptap: UILabel!
    @IBOutlet weak var gesturedown: UIView!
    @IBOutlet weak var gestureup: UIView!
    //@IBOutlet weak var gestureup: UIView!
    
    @IBOutlet weak var gesturetap: UIView!
    //@IBOutlet weak var gesturetap: UIView!
    //@IBOutlet weak var gesturetap: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //gestureright.isUserInteractionEnabled=true
        gestureup.isUserInteractionEnabled=true
        gesturetap.isUserInteractionEnabled=true
        gesturedown.isUserInteractionEnabled=true
        let gesturedownswipe=UISwipeGestureRecognizer(target: self, action: #selector(self.swipedowngesture))
        Swipedown.text=NSLocalizedString("Swipe down", comment: "")
        Swipeup.text=NSLocalizedString("Swipe Up", comment: "")
        taptap.text=NSLocalizedString("Tap me!!", comment: "")
        gesturedownswipe.direction=UISwipeGestureRecognizerDirection.down
        gesturedown.addGestureRecognizer(gesturedownswipe)
        let gestureta=UITapGestureRecognizer(target:self, action:#selector(self.tapgesture))
        gesturetap.addGestureRecognizer(gestureta)
        let gestureswipe=UISwipeGestureRecognizer(target:self,action:#selector(self.gestureswipe))
        gestureswipe.direction=UISwipeGestureRecognizerDirection.up
        gestureup.addGestureRecognizer(gestureswipe)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let colors=[UIColor.red,UIColor.blue,UIColor.purple,UIColor.orange,UIColor.darkGray,UIColor.black,UIColor.cyan,UIColor.brown]
    let funfacts=["McDonald’s once made bubblegum-flavored broccoli","There’s only one letter that doesn’t appear in any U.S. state name","There is a technical name for the “fear of long words” "," Chainsaws, the murder weapon , were invented for aid in childbirth","There are more public libraries in the US than McDonald's.","It's illegal to own just one guinea pig in Switzerland because they get lonely.","A can of Mountain Dew can dissolve a mouse","Lego is the largest tire manufacturer in the world.", "There are approximately 100,000 hairs on an average human head."]
    var currentupindex:Int=0
    var currenttapindex:Int=0
    var currentswipedownindex: Int=0
    var tapped=false
    var downswipped=false
    var upswipped=false
    var funfactsindex: Int=0
    @objc func gestureswipe(sendr:UISwipeGestureRecognizer){
        if (sendr.direction == .up){
            if currentupindex==colors.count{
                currentupindex=0
            }
            if funfactsindex==funfacts.count{
                funfactsindex=0
            }
            self.gestureup.backgroundColor=self.colors[currentupindex]
            currentupindex+=1
            upswipped=true
            Funfacts.text = funfacts[funfactsindex]
            funfactsindex+=1
        }
        
    }
    
   @objc func tapgesture(sendr:UITapGestureRecognizer){
    if currenttapindex==colors.count{
        currenttapindex=0
        
    }
    if funfactsindex==funfacts.count{
        funfactsindex=0
    }
    
    
    self.gesturetap.backgroundColor=self.colors[currenttapindex]
    currenttapindex+=1
    tapped=true
    Funfacts.text = funfacts[funfactsindex]
    funfactsindex+=1
    
    }

    
    @objc func swipedowngesture(sendr:UISwipeGestureRecognizer){
        if(sendr.direction == .down){
            if currentswipedownindex==colors.count{
                currentswipedownindex=0
            }
            if funfactsindex==funfacts.count{
                funfactsindex=0}
        self.gesturedown.backgroundColor=self.colors[currentswipedownindex]
            currentswipedownindex+=1
            downswipped=true
            Funfacts.text = funfacts[funfactsindex]
            funfactsindex+=1
            
        }
    }
    func actioncheck (){
    if upswipped && tapped && downswipped {
    
    }
    }
}

