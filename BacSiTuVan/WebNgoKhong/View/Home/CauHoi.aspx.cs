using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadList();
        }
    }

    private void LoadList()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string ID = Request.QueryString["id"].ToString();
        string getQuestion = "select * from [Question] where ID = '" + ID + "'";
        DataTable question = DataProvider.GetTable(getQuestion);
        string headTitle = question.Rows[0]["Title" + lang].ToString();// Utils.getField("Question", "Title", "ID" , ID);
        labelTime.InnerHtml = Utils.DateFormat(question.Rows[0]["DateCreate"].ToString());
        headerTitle.InnerHtml = headTitle;

        string sql = "select * from Post where QuestionID = '" + ID + "'";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string content = data.Rows[i]["Content"].ToString();
            string userID = data.Rows[i]["UserID"].ToString();

            string sqlUser = "select * from [User] where ID = '" + userID + "'";
            DataTable dataUser = DataProvider.GetTable(sqlUser);

            string fullName = "", userName = "", userType = "";
            if (dataUser != null && dataUser.Rows.Count > 0)
            {
                fullName = dataUser.Rows[0]["Fullname" + lang].ToString();
                userName = dataUser.Rows[0]["Username"].ToString();
                userType = Utils.getField("UserType", "TypeName" + lang, "ID", dataUser.Rows[0]["UserType"].ToString());
            }


            string dateEdit = Utils.DateFormat(data.Rows[i]["DatePost"].ToString());
            string timeEdit = Utils.TimeFormat(data.Rows[i]["DatePost"].ToString());
            string userImage = Utils.getField("[Image]", "Url", "ID", dataUser.Rows[0]["ImageID"].ToString());

            string time = "Ngày: " + dateEdit + " / Thời gian: " + timeEdit;

            //html += "<li>";
            //html += "    <div class='user-thumb'><img width='40' height='40' alt='User' src='../UI/img/demo/av1.jpg'></div>";
            //html += "    <div class='article-post'>";
            //html += "        <span class='user-info'>" + userType + ": " + userName + " / Ngày: " + dateEdit + " / Thời gian: " + timeEdit + " </span>";

            //html += "    </div>";
            //html += "</li>";

            html += "<article class='message message--post js-post js-inlineModContainer  ' data-author='" + fullName + "' data-content='post-53897' id='js-post-53897'>";
            html += "               <span class='u-anchorTarget' id='post-53897'></span>";
            html += "               <div class='message-inner'>";
            html += "                   <div class='message-cell message-cell--user'>";
            html += "                       <section itemscope='' itemtype='https://schema.org/Person' class='message-user'>";
            html += "                           <div class='message-avatar '>";
            html += "                               <div class='message-avatar-wrapper'>";
            html += "                                   <img src='" + userImage + "' class='avatar avatar--m avatar--default avatar--default--dynamic' data-user-id='49566' data-xf-init='member-tooltip' style='background-color: #993333; color: #df9f9f' id='js-XFUniqueId2'/>";
            html += "                               </div>";
            html += "                           </div>";
            html += "                           <div class='message-userDetails'>";
            html += "                               <h4 class='message-name'><a href='#' class='username ' dir='auto' data-user-id='49566' data-xf-init='member-tooltip' itemprop='name' id='js-XFUniqueId3'>" + fullName + "</a></h4>";
            html += "                               <div class='message-date'><a href='#' class='u-concealed' rel='nofollow'></a></div>";
            html += "                           </div>";
            html += "                           <span class='message-userArrow'></span>";
            html += "                       </section>";
            html += "                   </div>";
            html += "                   <div class='message-cell message-cell--main'>";
            html += "                       <div class='message-main js-quickEditTarget'>";
            html += "                           <header class='message-attribution'>";
            html += "                               <a href='#' class='message-attribution-main u-concealed' rel='nofollow'><time class='u-dt' dir='auto' datetime='" + dateEdit + "' data-time='1547622287' title=''> " + time + " </time></a>";
            html += "                               <div class='message-attribution-opposite'>";
            html += "                                   <a href='#' class='u-concealed' rel='nofollow'>#" + i.ToString() + "</a>";
            html += "                               </div>";
            html += "                           </header>";
            html += "                           <div class='message-content js-messageContent'>";
            html += "                               <div class='message-userContent lbContainer js-lbContainer ' data-lb-id='post-53897' data-lb-caption-desc='" + fullName + " · " + time + "'>";
            html += "                                   <article class='message-body js-selectToQuote'>";
            html += "                                       <div class='bbWrapper'>" + content + "</div>";
            html += "                                       <div class='js-selectToQuoteEnd'>&nbsp;</div>";
            html += "                                   </article>";
            html += "                               </div>";
            html += "                           </div>";
            html += "                       </div>";
            html += "                   </div>";
            html += "               </div>";
            html += "           </article>";
        }


        mainTopicContent.InnerHtml = html;
    }
}