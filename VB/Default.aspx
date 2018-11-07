'INSTANT VB NOTE: This code snippet uses implicit typing. You will need to set 'Option Infer On' in the VB file or set 'Option Infer' at the project level:

<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">

		function SetButtonsVisibility(s) {
			var statusBar = s.GetMainElement().getElementsByClassName("StatusBarWithButtons")[0].getElementsByTagName("td")[0];
			if (!s.batchEditApi.HasChanges())
				statusBar.style.visibility = "hidden";
			else
				statusBar.style.visibility = "visible";
		}

		function OnCustomButtonClick(s, e) {
			if (e.buttonID == "deleteButton") {
				s.DeleteRow(e.visibleIndex);
				SetButtonsVisibility(s);
			}
		}
	</script>
</head>
<body>
	<form id="frmMain" runat="server">
	<dx:ASPxGridView ID="Grid" runat="server" KeyFieldName="ID" OnBatchUpdate="Grid_BatchUpdate"
		OnRowInserting="Grid_RowInserting" OnRowUpdating="Grid_RowUpdating" OnRowDeleting="Grid_RowDeleting"
		ClientInstanceName="gridView" Theme="DevEx">
		<ClientSideEvents Init="function(s, e){ SetButtonsVisibility(s); }" EndCallback="function(s, e){ SetButtonsVisibility(s) }"
			BatchEditEndEditing="function(s, e){ window.setTimeout(function(){ SetButtonsVisibility(s); }, 10); }"
			CustomButtonClick="OnCustomButtonClick" />
		<Columns>
			<dx:GridViewCommandColumn>
				<CustomButtons>
					<dx:GridViewCommandColumnCustomButton ID="deleteButton" Text="Delete">
					</dx:GridViewCommandColumnCustomButton>
				</CustomButtons>
			</dx:GridViewCommandColumn>
			<dx:GridViewDataColumn FieldName="C1" />
			<dx:GridViewDataSpinEditColumn FieldName="C2" />
			<dx:GridViewDataTextColumn FieldName="C3" />
			<dx:GridViewDataCheckColumn FieldName="C4" />
			<dx:GridViewDataDateColumn FieldName="C5" />
		</Columns>
		<Templates>
			<StatusBar>
				<div style="text-align: right">
					<dx:ASPxHyperLink ID="hlSave" runat="server" Text="Save changes">
						<ClientSideEvents Click="function(s, e){ gridView.UpdateEdit(); }" />
					</dx:ASPxHyperLink>
					<dx:ASPxHyperLink ID="hlCancel" runat="server" Text="Cancel changes">
						<ClientSideEvents Click="function(s, e){ gridView.CancelEdit(); SetButtonsVisibility(gridView); }" />
					</dx:ASPxHyperLink>
				</div>
			</StatusBar>
		</Templates>
		<SettingsEditing Mode="Batch" />
		<Styles>
			<StatusBar CssClass="StatusBarWithButtons">
			</StatusBar>
		</Styles>
	</dx:ASPxGridView>
	</form>
</body>
</html>