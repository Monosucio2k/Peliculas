using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Peliculas
{
    public partial class Peliculas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty)
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
                    streamWriter.WriteLine(now + "--" + ex.Message.ToString());
                    streamWriter.WriteLine("StackTrace:");
                    streamWriter.WriteLine(ex.StackTrace.ToString());
                    streamWriter.WriteLine("---------");
                    streamWriter.Close();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
                DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
            

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty)
            {
                try
                {
                    Crud.Update();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    DateTime now = DateTime.Now;
                    StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/ExceptionLog.txt", true);
                    streamWriter.WriteLine(now + "--" + ex.Message.ToString());
                    streamWriter.WriteLine("StackTrace:");
                    streamWriter.WriteLine(ex.StackTrace.ToString());
                    streamWriter.WriteLine("---------");
                    streamWriter.Close();
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Crud.FilterExpression = "idDirector =" + DropDownList2.SelectedValue;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Crud.FilterExpression = string.Empty;
            Crud.FilterParameters.Clear();
        }
    }
}