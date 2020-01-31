<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/T114462/Default.aspx) (VB: [Default.aspx](./VB/T114462/Default.aspx))
* [Default.aspx.cs](./CS/T114462/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/T114462/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - Batch Editing - How to display save and cancel buttons only after editing
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t114462/)**
<!-- run online end -->

<p><strong>UPDATED:<br></strong><br>Starting with v18.2, if a grid contains modified data, it displays a confirmation message before a grid performs a postback or a callback. The [KeepChangesOnCallbacks](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewBatchEditSettings.KeepChangesOnCallbacks) property specifies whether the grid supports callbacks and allows you to use the 'Preview changes' button to preview and modify inserted, deleted and edited rows before you click 'Update'.</p>

<p><strong>UPDATED:<br></strong><br>Starting with v16.1, this feature is available out of the box. Please refer to the <a href="https://www.devexpress.com/Support/Center/p/T341469">ASPxGridView, ASPxCardView - Change Save and Cancel buttons' enabled state when an end-user changes a value in BatchEdit mode</a> thread for additional information.<br><br>This example demonstrates how to hide the <em>Save changes</em> and <em>Cancel </em><em>changes</em> buttons, and show them only when an end-user edits any cell or row.<br><strong>See Also:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T150388">ASPxGridView - Batch Editing - How to use external buttons to update data and enable them only when a row/cell has been changed  </a> <br><strong>MVC Example:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T150411">GridView - Batch Editing - How to show save and cancel buttons only when any row/cell has been changed</a></p>

<br/>


