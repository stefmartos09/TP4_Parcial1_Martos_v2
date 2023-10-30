using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_1_Martos
{
    public partial class GestionSectores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
            if (txtSector.Text != string.Empty)
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();

            }

            }
            catch (Exception)
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/ArchivoLog.txt", true);
                streamWriter.Close();
            }
        }
    }
}