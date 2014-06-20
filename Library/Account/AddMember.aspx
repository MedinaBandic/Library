<%@ Page Title="Add member" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="AddMember.aspx.cs" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Text"%>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        var conf = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        var con = new SqlConnection(conf);
        var query = new SqlCommand("SET IDENTITY_INSERT MEMBERS ON;INSERT INTO MEMBERS (ID, Name, Surname, Email, Phone, Faculty, Department, Occupation) VALUES('" +
            txtID.Text+"','"+
            txtName.Text + "','" +
            txtSurname.Text + "','" +
            txtEmail.Text + "','" +
            txtPhone.Text + "','" +
            txtFaculty.Text + "','" +
            txtDepartment.Text + "','" +
            txtOccupation.Text + "')", con);
        con.Open();
        query.ExecuteNonQuery();
        query.Connection.Close();
    }
</script>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtID" name="ID" type="text" /><br />
    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtName" name="Name" type="text" /><br />
    <asp:Label ID="Label3" runat="server" Text="Surname:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtSurname" name="Surname" type="text" /><br />
    <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtEmail" name="Surname" type="text" /><br />
    <asp:Label ID="Label5" runat="server" Text="Phone:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtPhone" name="Phone" type="text" /><br />
    <asp:Label ID="Label6" runat="server" Text="Faculty:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtFaculty" name="Faculty" type="text" /><br />
    <asp:Label ID="Label7" runat="server" Text="Department:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtDepartment" name="Department" type="text" /><br />
    <asp:Label ID="Label8" runat="server" Text="Occupation:"></asp:Label>
    <br />
    <asp:textbox runat="server" id="txtOccupation" name="Occupation" type="text" /><br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
    <br />
    <br />

</asp:Content>
