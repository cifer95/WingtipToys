<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WingtipToys.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Shopping Cart</h1></div>
    <asp:GridView runat="server" ID="CartList" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
                  ItemType="WingtipToys.Models.CartItem" SelectMethod="GetShoppingCartItems"
                  CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID" SortExpression="ProductId" />
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="PurchaseQuantity" Width="40" Text="<%#: Item.Quantity %>"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) * Convert.ToDouble(Item.Product.UnitPrice))) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="Remove"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label runat="server" ID="LabelTotalText" Text="Order Total: "></asp:Label>
            <asp:Label runat="server" ID="lblTotal" EnableViewState="False"></asp:Label>
        </strong>
    </div>
    <br/>
    <table>
        <tr>
            <td>
                <asp:Button runat="server" ID="UpdateBtn" Text="Update" OnClick="UpdateBtn_Click"/>
            </td>
            <td>
                <!-- Checkout Placeholder -->
            </td>
        </tr>
    </table>
</asp:Content>
