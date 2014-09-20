<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
  <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
  <script type="text/javascript" src="/_layouts/15/sp.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.3.0/handlebars.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/ember.js/1.7.0/ember.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment.min.js"></script>
  <meta name="WebPartPageExpansion" content="full" />

  <!-- Add your CSS styles to the following file -->
  <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
  <link href="../Content/bootstrap.cosmo.min.css" rel="stylesheet" />

  <!-- Add your JavaScript to the following file -->
  <script type="text/javascript" src="../Scripts/App.js"></script>
  <script type="text/javascript" src="../Scripts/routes/IndexRoute.js"></script>
  <script type="text/javascript" src="../Scripts/controllers/MeetupModalController.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
  Meetup for SharePoint
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
  <div style="padding-left: 185px; margin-top: 50px; overflow-x: hidden">
    <div id="app-root" class="container"></div>
  </div>

  <script type="text/x-handlebars">
    {{outlet}}

    {{outlet modal}}
  </script>

  <script type="text/x-handlebars" data-template-name="index">
    <div class="row">
      <div class="col-md-9">
        <h3 class="col-md-12 text-right">{{#link-to 'about'}}About{{/link-to}}</h3>
        <div id="searchResults" class="">
          {{#each item in model }}
            <div class="meetupresult">
              <img class="img-circle col-md-2" {{ bind-attr src=item.group_photo.photo_link }} />
              <div class="col-md-9">
                <h3><a {{action 'showModal' 'meetup-modal' item }}>{{item.name}}</a></h3>
                <p>{{{item.description}}}</p>
              </div>
            </div>
          {{/each}}
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-handlebars" data-template-name="about">
    <h1>About page goes here</h1>
    <h3>{{#link-to 'index'}}<- Go home{{/link-to}}</h3>
  </script>

  <script type="text/x-handlebars" data-template-name="meetup-modal">
    {{#my-modal title=model.name ok='ok' close='removeModal'}}
      <h4>Next Meetups:</h4>
      {{#each item in model.upcomingMeetings}}
      <div class="meetupDetails">
        <h4>{{ item.name }}</h4>
        <p>{{{ item.description }}}</p>
        <div class="text-right">
          <button class="btn btn-success" type="button" {{action 'add' item }}>Add</button>
        </div>
      </div>
      {{/each}}
    {{/my-modal}}
  </script>

  <script type="text/x-handlebars" data-template-name="components/my-modal">
    <div id="{{id}}" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">{{title}}</h4>
          </div>
          <div class="modal-body">
            {{yield}}
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" {{action 'ok' }}>OK</button>
          </div>
        </div>
      </div>
    </div>
  </script>
</asp:Content>
