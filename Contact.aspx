<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="XMLRakendus.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
    <h1>Minu sugupuu</h1>

    <div>
        <asp:Xml runat="server"
            DocumentSource="~/OstapjukSugupuu.xml"
            TransformSource="~/Ostapjukparing.xslt">

        </asp:Xml>
    </div>
</main>
</asp:Content>
