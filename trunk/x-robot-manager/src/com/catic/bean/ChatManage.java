package com.catic.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.chinese.Sentence;
import net.sf.robot.util.chinese.SentenceParse;
import net.sf.robot.util.chinese.WordSegment;
import net.sf.robot.util.db.TiSqlDao;

public class ChatManage
{
  private TiSqlDao sqlDao = (TiSqlDao)SpringInstance.getBean("sqlDao");
  private static int count = 20;

  private String searchQuestion = "select questionid,content,keywords from t_chatquestion where content=? order by questionid";
  private String qryQuestion = "select * from (select rownum row_num,t.* from (select questionid,content,keywords from t_chatquestion order by questionid desc) t) where row_num >=? and row_num<?";

  private String qryAnswer = "select a.answerid,a.content from t_chatanswer a,t_chatrelation r where r.answerid=a.answerid and r.questionid=?";

  public List<Question> qryQuestion(String content)
  {
    List questions = new ArrayList();
    List list = this.sqlDao.qryBySQLText(this.searchQuestion, new Object[] { content });

    for (int i=0;i<list.size();i++)
    {
      Map map= (Map)list.get(i);
      Question question = new Question();
      question.setId(Integer.valueOf(map.get("QUESTIONID").toString()));
      question.setContent(map.get("CONTENT").toString());
      question.setKeywords(map.get("KEYWORDS").toString());

      questions.add(question);
    }

    return questions;
  }

  public List<Question> qryQuestion(int page)
  {
    List questions = new ArrayList();

    int start = (page - 1) * count;
    int end = page * count;

    List list = this.sqlDao.qryBySQLText(this.qryQuestion, new Object[] { Integer.valueOf(start), Integer.valueOf(end) });
    for (int i=0;i<list.size();i++)
    {
      Map map= (Map)list.get(i);
      Question question = new Question();
      question.setId(Integer.valueOf(map.get("QUESTIONID").toString()));
      question.setContent(map.get("CONTENT").toString());
      question.setKeywords(map.get("KEYWORDS").toString());
      questions.add(question);
    }

    return questions;
  }

  public List<Answer> qryAnswer(Question question)
  {
    List answers = new ArrayList();

    List list = this.sqlDao.qryBySQLText(this.qryAnswer, new Object[] { question.getId() });
    for (int i=0;i<list.size();i++)
    {
      Map map= (Map)list.get(i);
      Answer answer = new Answer();
      answer.setId(Integer.valueOf(map.get("ANSWERID").toString()));
      answer.setContent(map.get("CONTENT").toString());

      answers.add(answer);
    }

    return answers;
  }

  public void delQuestion(Question question)
  {
    String delRelation = "delete t_chatrelation where questionid=?";
    String delQuestion = "delete t_chatquestion where questionid=?";
    String delAnswer = "delete t_chatanswer where answerid not in (select answerid from t_chatrelation)";

    this.sqlDao.updateBySQLText(delRelation, new Object[] { question.getId() });
    this.sqlDao.updateBySQLText(delQuestion, new Object[] { question.getId() });
    this.sqlDao.updateBySQLText(delAnswer, null);
  }

  public static void main(String[] arges)
  {
  }

  public void delAnswer(Answer answer) {
    String delRelation = "delete t_chatrelation where answerid=?";
    String delAnswer = "delete t_chatanswer where answerid=?";

    this.sqlDao.updateBySQLText(delRelation, new Object[] { answer.getId() });
    this.sqlDao.updateBySQLText(delAnswer, new Object[] { answer.getId() });
  }

  public void add(Question question, Answer answer)
  {
    if ((question == null) || (question.getContent() == null) || (question.getContent().length() == 0)) {
      return;
    }
    if (question.getId() == null) {
      question = addQuestion(question);
    }
    if ((answer == null) || (answer.getId() != null) || (answer.getContent().length() == 0)) {
      return;
    }
    addAnswer(question.getId().intValue(), answer);
  }

  public Question addQuestion(Question question)
  {
    if (question.getId() != null) {
      return question;
    }
    List list = this.sqlDao.qryBySQLName("QRY_SEQUENCE", null);
    Integer questionId = new Integer(((Map)list.get(0)).get("SEQUENCE").toString());

    String segment = WordSegment.segment(question.getContent());

    Sentence sentence = SentenceParse.parse(segment);

    this.sqlDao.updateBySQLName("ADD_CHATQUESTION", new Object[] { questionId, sentence.getContent(), 
      sentence.getKeywords(), sentence.getTrunkString(), question.getMsn() });

    question.setId(questionId);
    return question;
  }

  public void addAnswer(int questionId, Answer answer)
  {
    if (answer.getId() != null) {
      return;
    }
    List list = this.sqlDao.qryBySQLName("QRY_SEQUENCE", null);
    Integer answerId = new Integer(((Map)list.get(0)).get("SEQUENCE").toString());

    this.sqlDao.updateBySQLName("ADD_CHATANSWER", new Object[] { answerId, answer.getContent(), answer.getMsn() });
    this.sqlDao.updateBySQLName("ADD_CHATRELATION", new Object[] { Integer.valueOf(questionId), answerId });
    this.sqlDao.updateBySQLName("MOD_CHATQUESTION_ANSWER", new Object[] { Integer.valueOf(questionId) });
  }

  public void updateQuestion(Question question) {
    String update = "update t_chatquestion set content=?,keywords=?,trunk=? where questionid=?";
    String segment = WordSegment.segment(question.getContent());

    Sentence sentence = SentenceParse.parse(segment);
    this.sqlDao.updateBySQLText(update, new Object[] { sentence.getContent(), sentence.getKeywords(), sentence.getTrunkString(), question.getId() });
  }

  public void updateAnswer(Answer answer) {
    String update = "update t_chatanswer set content=? where answerid=?";

    this.sqlDao.updateBySQLText(update, new Object[] { answer.getContent(), answer.getId() });
  }
}