/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kiet
 */
public class tblFAQ {
    int FAQID;
    String Question;
    String Answer;
    byte Active;

    public tblFAQ() {
    }

    public tblFAQ(int FAQID, String Question, String Answer, byte Active) {
        this.FAQID = FAQID;
        this.Question = Question;
        this.Answer = Answer;
        this.Active = Active;
    }

    public int getFAQID() {
        return FAQID;
    }

    public void setFAQID(int FAQID) {
        this.FAQID = FAQID;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    public byte getActive() {
        return Active;
    }

    public void setActive(byte Active) {
        this.Active = Active;
    }
    
}
