<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="T114462.Default" %>

<!DOCTYPE html>

<<<<<<< HEAD:CS/Default.aspx
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
=======
>>>>>>> 18.2.11+:CS/T114462/Default.aspx
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var isPreviewChangesVisible = false;
        function SetButtonsVisibility(s) {
            var visibility = s.batchEditApi.HasChanges()
            btnPreview.SetVisible(visibility);
            btnSave.SetVisible(visibility);
            btnCancel.SetVisible(visibility);
        }

        function onPreviewChangesClick(s, e) {
            if (isPreviewChangesVisible) {
                s.SetText("Show changes");
                gridView.batchEditApi.HideChangesPreview();
            }
            else {
                s.SetText("Hide preview");
                gridView.batchEditApi.ShowChangesPreview();
            }
            isPreviewChangesVisible = !isPreviewChangesVisible;
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID == "deleteButton") {
                s.DeleteRow(e.visibleIndex);
                SetButtonsVisibility(s);
            }
        }
        function OnBatchEditEndEditing(s, e) {
            window.setTimeout(function () { SetButtonsVisibility(s); }, 0); 
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="Grid" runat="server" KeyFieldName="ID" OnBatchUpdate="Grid_BatchUpdate"
                OnRowInserting="Grid_RowInserting" OnRowUpdating="Grid_RowUpdating" OnRowDeleting="Grid_RowDeleting"
                ClientInstanceName="gridView" Theme="DevEx">
                <ClientSideEvents Init="function(s, e){ SetButtonsVisibility(s); }" EndCallback="function(s, e){ SetButtonsVisibility(s) }"
                    BatchEditEndEditing="OnBatchEditEndEditing" CustomButtonClick="OnCustomButtonClick" />
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
                            <dx:ASPxButton ID="btnPrevChanges" runat="server" ClientInstanceName="btnPreview" RenderMode="Outline" Text="Preview changes" 
                                AutoPostBack="false">
                                <ClientSideEvents Click="onPreviewChangesClick" />
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnSave" runat="server" ClientInstanceName="btnSave" RenderMode="Outline" Text="Save changes" AutoPostBack="false">
                                <ClientSideEvents Click="function(s, e){ gridView.UpdateEdit(); }" />
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnCancel" runat="server" ClientInstanceName="btnCancel" RenderMode="Outline" Text="Cancel changes" AutoPostBack="false">
                                <ClientSideEvents Click="function(s, e){ gridView.CancelEdit(); SetButtonsVisibility(gridView); }" />
                            </dx:ASPxButton>
                        </div>
                    </StatusBar>
                </Templates>
                <SettingsEditing Mode="Batch" />
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
