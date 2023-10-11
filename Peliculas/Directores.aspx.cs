using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Peliculas
{
    public partial class Directores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty && TextBox2.Text != string.Empty)
            {
                try
                {
                    Crud.Insert();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    DateTime now = DateTime.Now;
                    StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/ExceptionLog.txt", true);
                    streamWriter.WriteLine(now + "--"+ ex.Message.ToString());
                    streamWriter.WriteLine("StackTrace:");
                    streamWriter.WriteLine(ex.StackTrace.ToString());
                    streamWriter.WriteLine("---------");
                    streamWriter.Close();
                }
            }
        }
    }
}