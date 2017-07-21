//
//  ViewController.swift
//  ricePurity
//
//  Created by Levi Walsh on 7/12/17.
//  Copyright © 2017 Levi Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var numChecked: Int = 0
//    var questions: [UILabel] = []
    
    
    
    // TODO make this an array of labels that have the text of each question
    // TODO when the text is too long have it wrap under for the question
    var questions = ["1. Held hands romantically?","2. Been on a date?","3. Been in a relationship?","4. Danced without leaving room for Jesus?","5. Kissed a non-family member", "6. Kissed a non-family member on the lips?", "7. French kissed?", "8. French kissed in public?", "9. Kissed on the neck?", "10. Kissed horizontally?","11. Given or received a hickey?", "12. Kissed or been kissed on the breast?", "13. Kissed someone below the belt?", "14. Kissed for more than two hours consecutively?", "15. Played a game involving stripping?","16. Seen or been seen by another person in a sensual context?","17. Masturbated?", "18. Masturbated to a picture or video?", "19. Masturbated while someone else was in the room?","20. Been caught masturbating?", "21. Masturbated with an inanimate object?", "22. Seen or read pornographic material?","23. Massaged or been massaged sensually?","24. Gone through the motions of intercourse while fully dressed?", "25. Undressed or been undressed by a MPS (member of the preferred sex)?","26. Showered with a MPS?","27. Fondled or had your butt cheeks fondled?","28. Fondled or had your breasts fondled?","29. Fondled or had your genitals fondled?","30. Had or given 'blue balls'?", "31. Had an orgasm due to someone else’s manipulation?","32. Sent a sexually explicit text or instant message?","33. Sent or received sexually explicit photographs?","34. Engaged in sexually explicit activity over video chat?","35. Cheated on a significant other during a relationship?","36. Purchased contraceptives?","37. Engaged in fellatio?","38. Engaged in cunnilingus?","39. Ingested someone else’s genital secretion?","40. Used a sex toy with a partner?","41. Spent the night with a MPS?","42. Been walked in on while engaging in a sexual act?","43. Kicked a roommate out to commit a sexual act?","44. Ingested alcohol in a non-religious context?","45. Played a drinking game?","46. Been drunk?","47. Faked sobriety to parents or teachers?","48. Had severe memory loss due to alcohol?","49. Used tobacco?", "50. Used marijuana?", "51. Used a drug stronger than marijuana?","52. Used methamphetamine, crack cocaine, PCP, horse tranquilizers or heroin?","53. Been sent to the office of a principal, dean or judicial affairs representative for a disciplinary infraction?","54. Been put on disciplinary probation or suspended?","55. Urinated in public?","56. Gone skinny-dipping?","57. Gone streaking?","58. Seen a stripper?","59. Had the police called on you?","60. Run from the police?","61. Had the police question you?","62. Had the police handcuff you?","63. Been arrested?","64. Been convicted of a crime?","65. Been convicted of a felony?","66. Committed an act of vandalism?","67. Had sexual intercourse?","68. Had sexual intercourse three or more times in one night?", "69. ?","70. Had sexual intercourse 10 or more times?", "71. Had sexual intercourse in four or more positions?","72. Had sexual intercourse with a stranger or person you met within 24 hours?","73. Had sexual intercourse in a motor vehicle?","74. Had sexual intercourse outdoors?","75. Had sexual intercourse in public?","76. Had sexual intercourse in a swimming pool or hot tub?","77. Had sexual intercourse in a bed not belonging to you or your partner?","78. Had sexual intercourse while you or your partner’s parents were in the same home?","79. Had sexual intercourse with non-participating third party in the same room?","80. Joined the mile high club?","81. Participated in a 'booty call' with a partner whom you were not in a relationship with?","82 Traveled 100 or more miles for the primary purpose of sexual intercourse?","83. Had sexual intercourse with a partner with a 3 or more year age difference?","84. Had sexual intercourse with a virgin?","85. Had sexual intercourse without a condom?","86. Had a STI test due to reasonable suspicion?","87. Had a STI?","88. Had a threesome?","89. Attended an orgy?","90. Had two or more distinct acts of sexual intercourse with two or more people within 24 hours?","91. Had sexual intercourse with five or more partners?","92. Been photographed or filmed during sexual intercourse by yourself or others?","93. Had period sex?","94. Had anal sex?","95. Had a pregnancy scare?","96. Impregnated someone or been impregnated?","97. Paid or been paid for a sexual act?","98. Committed an act of voyeurism?","99. Committed an act of incest?","100. Engaged in bestiality?"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // var question1: UILabel

        
        setupCollectionView()
        // addMoreImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initializing a collectionView and adding it to the View Controllers current view
    func setupCollectionView() {
        tableView = UITableView(frame: view.frame)
        tableView.register(RiceTableViewCell.self, forCellReuseIdentifier: "riceCell")
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false;
        view.addSubview(tableView)
    }
 
/*
    // Shouldn't need this function but it's helpful just in case
     func addMoreImages() {
        let moreImages = [UIImage(named: "mission6"), UIImage(named: "mission7")]
        images.append(contentsOf: moreImages)
        collectionView.reloadData()
     }
*/
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "riceCell") as! RiceTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.delegate = self
        cell.riceLabel.text = questions[indexPath.row]
        return cell
        
    }
    
    //specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ViewController: RiceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: RiceTableViewCell, state: Bool) {
        if state {
            numChecked -= 1
            forCell.button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        } else {
            numChecked += 1
            forCell.button.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        forCell.state = !forCell.state
        print(numChecked)
    }
}


