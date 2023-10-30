using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_1_Martos
{
    public partial class GestionEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtApellido.Text = GridView1.SelectedRow.Cells[1].Text;
            txtNombre.Text = GridView1.SelectedRow.Cells[2].Text;
            drpSector.SelectedValue = GridView1.SelectedRow.Cells[3].Text;

        }

        protected void txtActualizar_Click(object sender, EventArgs e)
        {
            try
            {
            SqlDataSource1.Update();
            gvEmpleadoSector.DataBind();

            }
            catch (Exception)
            {

                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/ArchivoLog.txt", true);
                streamWriter.Close();   
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
            if (txtApellido.Text != string.Empty && txtNombre.Text != string.Empty)
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
                gvEmpleadoSector.DataBind();

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